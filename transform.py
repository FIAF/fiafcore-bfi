from lxml import etree
import json
import pandas
import pathlib
import rdflib
import tqdm
import uuid


def conform(graph_in, vocabulary, prop):

    vocab_path = pathlib.Path.cwd() / 'vocabulary' / f'{vocabulary}.json'
    if not vocab_path.exists():
        raise Exception(f'{vocab_path} not found.')

    with open(vocab_path) as vocab:
        vocab = json.load(vocab)

    turtle_string = graph_in.serialize(format="turtle")
    for a,b in vocab.items():
        turtle_string = turtle_string.replace(f'<{a}>', f'<{b}>')
    
    if prop == 'rdf:type':
        prop_uri = rdflib.RDF.type
    else:
        prop_uri = rdflib.URIRef(f"https://ontology.fiafcore.org/{prop}")

    turtle_rdf = rdflib.Graph().parse(data=turtle_string, format="turtle")
    for s,p,o in turtle_rdf.triples((None, prop_uri, None)):

        # you will want to add a caveat here, which is that if "o" is a blank node
        # then return rdf:type of the blank node rather than "o" itself.

        if str(o) not in vocab.values():
            raise Exception('@@@', s, o)

    return turtle_rdf


def harmonise(graph):

    graph = conform(graph, 'ontology', 'rdf:type')
    graph = conform(graph, 'country', 'hasCountry')
    graph = conform(graph, 'genre', 'hasGenre')
    graph = conform(graph, 'element', 'isElement')

    return graph


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

    xml_items = etree.parse(str(pathlib.Path.cwd() / "xml" / f"{tier}.xml"))
    xml_items = [x for x in xml_items.findall(".//record")]
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

    # initiate a graph.

    g = rdflib.Graph()
    g.bind("fiaf", rdflib.Namespace("https://ontology.fiafcore.org/"))

    # transform tier.

    g += transform("BFI_FIAF_LOD_Works", auth_df)
    g += transform("BFI_FIAF_LOD_Manifestations", auth_df)
    g += transform("BFI_FIAF_LOD_Items", auth_df)

    # update authority parquet.

    auth_df.to_parquet(auth_path)

    # save graph.

    g.serialize(destination=pathlib.Path.cwd() / "fiafcore_bfi.ttl", format="turtle")
    
    # total triples.
    
    print(f'{len(g)} triples.')


if __name__ == "__main__":
    main()
