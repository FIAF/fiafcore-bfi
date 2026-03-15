
import pandas
import pathlib
import rdflib
import tqdm
import uuid
from lxml import etree

def subclasses(parent):

    fiafcore_path = 'https://raw.githubusercontent.com/FIAF/fiafcore/refs/heads/develop/fiafcore.ttl'
    fiafcore = rdflib.Graph().parse(fiafcore_path)
    query = """
        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
        SELECT ?subClass
        WHERE {
            ?subClass rdfs:subClassOf+ <"""+parent+"""> .
        }
    """
    result = [row.subClass for row in fiafcore.query(query)]
    result.append(rdflib.URIRef(parent))

    return result

def authority(graph, df, types):

    local_ids = list()
    for t in types:
        t = rdflib.URIRef(str(t))
        local_ids += [
            str(s) for s, p, o in graph.triples((None, rdflib.RDF.type, t))
        ]

    authority = dict()
    for x in local_ids:
        match = df.loc[df.local.isin([str(x)])]
        if len(match) > 1:
            raise Exception("This should never happen.")
        elif len(match) < 1:
            minted_id = f"https://dev.fiafcore.org/{str(uuid.uuid4())}"
            authority[x] = minted_id
            df.loc[len(df)] = [(minted_id), (x)]
        else:
            authority[x] = match.iloc[0]["fiafcore"]

    turtle_string = graph.serialize(format="turtle")
    for k, v in authority.items():
        turtle_string = turtle_string.replace(f"<{k}>", f"<{v}>")

    return rdflib.Graph().parse(data=turtle_string, format="turtle")

def transform(tier, df, res):

    tier_graph = rdflib.Graph()
    xml_items = etree.parse(str(pathlib.Path.cwd() / "xml" / f"{tier}.xml"))
    xml_items = [x for x in xml_items.findall(".//record")]
    for xml in tqdm.tqdm(xml_items, desc=tier):

        # testing filter.

        # if 'Work' in tier:
        #     if xml.find('.//priref').text != '150335572':
        #         continue

        # if 'Manifestation' in tier:
        #     if xml.find('.//priref').text != '152100981':
        #         continue

        # if 'Item' in tier:
        #     if xml.find('.//priref').text != '152772493':
        #         continue

        # transformation via xslt to fiafcore structures.

        xsl_file = etree.parse(str(pathlib.Path.cwd() / "xsl" / f"{tier}.xsl"))
        transform = etree.XSLT(xsl_file)
        result = transform(xml)
        g = rdflib.Graph().parse(data=str(result), format="xml")

        # fiafcore authority ids for entities.

        g = authority(g, df, res)

        # collect output into main graph.

        tier_graph += g

    return tier_graph


def main():

    auth_path = pathlib.Path.cwd() / "auth.parquet"
    if not auth_path.exists():
        auth_df = pandas.DataFrame(columns=["fiafcore", "local"])
    else:
        auth_df = pandas.read_parquet(auth_path)

    # gather resource types.

    resource_types = list()
    resource_types += subclasses('https://dev.fiafcore.org/Agent')
    resource_types += subclasses('https://dev.fiafcore.org/Work')
    resource_types += subclasses('https://dev.fiafcore.org/Manifestation')
    resource_types += subclasses('https://dev.fiafcore.org/Item')
    resource_types += subclasses('https://dev.fiafcore.org/Carrier')

    # top level graph.

    graph = rdflib.Graph()
    graph.bind("fiaf", rdflib.Namespace("https://dev.fiafcore.org/"))

    # transform tier.

    # graph += transform("BFI_FIAF_LOD_Works", auth_df, resource_types)
    # graph += transform("BFI_FIAF_LOD_Manifestations", auth_df, resource_types)
    graph += transform("BFI_FIAF_LOD_Items", auth_df, resource_types)

    # update authority parquet.

    auth_df.to_parquet(auth_path)

    # save graph.

    graph.serialize(
        destination=pathlib.Path.cwd() / "fiafcore_bfi.ttl",
        format="turtle"
    )

    # total triples.

    print(f'{len(graph)} triples.')


if __name__ == "__main__":
    main()
