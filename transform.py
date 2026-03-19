
import pandas
import pathlib
import pydash
import rdflib
import requests
import tqdm
import uuid
from lxml import etree

def local_ontology():

    fiafcore_path = pathlib.Path.cwd() / 'fiafcore.ttl'
    if not fiafcore_path.exists():
        r = requests.get('https://raw.githubusercontent.com/FIAF/fiafcore/refs/heads/develop/fiafcore.ttl')
        if r.status_code != 200:
            raise Exception('API call failed.')
        with open(fiafcore_path, 'w') as local_fiafcore:
            local_fiafcore.write(r.text)

def subclasses(parent):

    fiafcore_path = pathlib.Path.cwd() / 'fiafcore.ttl'
    if not fiafcore_path.exists():
        raise Exception('Local ontology file not found.')

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

    # TODO: with current architecture, manifestation etc uris are not being picked up
    # and converted during the processing of work data as, within this specific context,
    # those entities have no type declaration. Codeblock below is a temp solution to this.

    for string_match in [
        'bfi://resource/manifestation/',
        'bfi://resource/item/',
    ]:
        for s,p,o in graph.triples((None, None, None)):
            if string_match in str(s):
                local_ids.append(str(s))
            if string_match in str(o):
                local_ids.append(str(o))

    authority = dict()
    for x in pydash.uniq(local_ids):
        match = df.loc[df.local.isin([str(x)])]
        if len(match) > 1:
            raise Exception("This should never happen.")
        elif len(match) < 1:
            minted_id = f"https://dev.fiafcore.org/{str(uuid.uuid4())}"
            authority[str(x)] = minted_id
            df.loc[len(df)] = [(minted_id), (str(x))]
            print(x, minted_id)
        else:
            authority[x] = match.iloc[0]["fiafcore"]

    turtle_string = graph.serialize(format="turtle")
    for k, v in authority.items():
        turtle_string = turtle_string.replace(f"<{k}>", f"<{v}>")

    return rdflib.Graph().parse(data=turtle_string, format="turtle")

def validate(g):

    fiafcore_path = pathlib.Path.cwd() / 'fiafcore.ttl'
    if not fiafcore_path.exists():
        raise Exception('Local ontology file not found.')

    fiafcore = rdflib.Graph().parse(fiafcore_path)
    fiafcore_entities = list()
    for s,p,o in fiafcore:
        fiafcore_entities.append(s)
        if type(o) is type(rdflib.URIRef('')):
            fiafcore_entities.append(o)

    fiafcore_entities = [x for x in pydash.uniq(fiafcore_entities) if 'fiafcore' in str(x)]

    graph_entities = list()
    for s,p,o in g:
        graph_entities.append(s)
        if type(o) is type(rdflib.URIRef('')):
            graph_entities.append(o)

    graph_entities = [x for x in pydash.uniq(graph_entities) if 'fiafcore' in str(x)]

    for x in graph_entities:
        if len(pathlib.Path(x).name) == 36:
            continue

        if x not in fiafcore_entities:
            raise Exception(f'{x} not found in fiafcore.')


def transform(tier, df, res):

    tier_graph = rdflib.Graph()
    xml_items = etree.parse(str(pathlib.Path.cwd() / "xml" / f"{tier}.xml"))
    xml_items = [x for x in xml_items.findall(".//record")]

    xml_items = xml_items[:100] # filter for medium dataset.

    for xml in tqdm.tqdm(xml_items, desc=tier):

        # # testing filter.

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

       # validate entities.

        validate(g)

        # collect output into main graph.

        tier_graph += g

    return tier_graph


def main():

    auth_path = pathlib.Path.cwd() / "auth.parquet"
    if not auth_path.exists():
        auth_df = pandas.DataFrame(columns=["fiafcore", "local"])
    else:
        auth_df = pandas.read_parquet(auth_path)

    # local instance of ontology.

    local_ontology()

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

    graph += transform("BFI_FIAF_LOD_Works", auth_df, resource_types)
    graph += transform("BFI_FIAF_LOD_Manifestations", auth_df, resource_types)
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
