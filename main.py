from lxml import etree
import pandas
import pathlib
import rdflib
import tqdm
import uuid


def harmonise(graph):
    turtle_string = graph.serialize(format="turtle")

    for a,b in [
        ("<bfi://ontology/work>", "<https://ontology.fiafcore.org/Work>"),
        ("<bfi://ontology/identifier>", "<https://ontology.fiafcore.org/Identifier>"),
        ("<bfi://ontology/agent>", "<https://ontology.fiafcore.org/Agent>"),
        ("<bfi://ontology/manifestation>", "<https://ontology.fiafcore.org/Manifestation>"),  
        ("<bfi://ontology/item>", "<https://ontology.fiafcore.org/Item>")      
    ]:
        turtle_string = turtle_string.replace(a, b)

    return rdflib.Graph().parse(data=turtle_string, format="turtle")


def authority(graph, df):
    local_ids = list()
    for entity_type in ["Work", "Manifestation", "Item", "Carrier", "Agent"]:
        type_uri = rdflib.URIRef(f"https://ontology.fiafcore.org/{entity_type}")
        local_ids += [
            str(s) for s, p, o in graph.triples((None, rdflib.RDF.type, type_uri))
        ]

    authority = dict()
    for x in local_ids:
        match = df.loc[df.local.isin([str(x)])]
        if len(match) > 1:
            raise Exception("This should not happen.")
        elif len(match) < 1:
            minted_id = f"https://resource.fiafcore.org/{str(uuid.uuid4())}"
            authority[x] = minted_id
            df.loc[len(df)] = [(minted_id), (x)]
        else:
            authority[x] = match.iloc[0]["fiafcore"]

    turtle_string = graph.serialize(format="turtle")
    for k, v in authority.items():
        turtle_string = turtle_string.replace(f"<{k}>", f"<{v}>")

    return rdflib.Graph().parse(data=turtle_string, format="turtle")


def transform(tier, df):
    graph = rdflib.Graph()

    xml_works = etree.parse(str(pathlib.Path.cwd() / "xml" / f"{tier}.xml"))
    xml_works = [x for x in xml_works.findall(".//record")]
    print(len(xml_works))
    for xml in tqdm.tqdm(xml_works, desc=tier):

        # # testing filter.

        if 'Work' in tier:
            if xml.find('.//priref').text != '150335572':
                continue

        if 'Manifestation' in tier:
            if xml.find('.//priref').text != '152100981':
                continue

        if 'Item' in tier:
            if xml.find('.//priref').text != '152772493':
                continue

        # transformation via xslt to fiafcore structures.

        xsl_file = etree.parse(str(pathlib.Path.cwd() / "xsl" / f"{tier}.xsl"))
        transform = etree.XSLT(xsl_file)
        result = transform(xml)
        g = rdflib.Graph().parse(data=str(result), format="xml")

        # harmonise vocabulary terms to fiafcore.

        g = harmonise(g)

        # fiafcore authority ids for entities.

        g = authority(g, df)

        # collect output into main graph.

        graph += g

    return graph


def main():

    auth_path = pathlib.Path.cwd() / "auth.parquet"
    if not auth_path.exists():
        auth_df = pandas.DataFrame(columns=["fiafcore", "local"])
    else:
        auth_df = pandas.read_parquet(auth_path)


    # transform data.

    g = rdflib.Graph()
    g.bind("fiaf", rdflib.Namespace("https://ontology.fiafcore.org/"))

    g += transform("BFI_FIAF_LOD_Works", auth_df)
    g += transform("BFI_FIAF_LOD_Manifestations", auth_df)
    g += transform("BFI_FIAF_LOD_Items", auth_df)

    # write resulting rdf.

    print(len(g))

    # save authority parquet.

    auth_df.to_parquet(auth_path)

    # save graph.

    g.serialize(destination=pathlib.Path.cwd() / "fiafcore_bfi.ttl", format="turtle")


if __name__ == "__main__":
    main()
