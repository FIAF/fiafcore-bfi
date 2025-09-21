from lxml import etree
import dotenv
import os
import pathlib
import pymongo
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
    ]:
        turtle_string = turtle_string.replace(a, b)

    return rdflib.Graph().parse(data=turtle_string, format="turtle")


def authority(graph):
    work_type = rdflib.URIRef("https://ontology.fiafcore.org/Work")
    work_ids = [str(s) for s, p, o in graph.triples((None, rdflib.RDF.type, work_type))]

    atlas_user, atlas_pass = os.getenv("ATLAS_USER"), os.getenv("ATLAS_PASS")
    uri = f"mongodb+srv://{atlas_user}:{atlas_pass}@fiafcore.wrscui9.mongodb.net/?retryWrites=true&w=majority&appName=fiafcore"
    client = pymongo.MongoClient(uri)
    database = client.get_database("fiafcore")
    coll = database.get_collection("auth")

    authority = dict()
    for x in tqdm.tqdm(work_ids):
        match = list(coll.find({"local": {"$elemMatch": {"$eq": x}}}))

        if len(match) > 1:
            raise Exception("This should not happen.")
        elif len(match) < 1:
            minted_id = f"https://resource.fiafcore.org/{str(uuid.uuid4())}"
            coll.insert_one({"fiafcore": minted_id, "local": [x]})
            authority[x] = minted_id
        else:
            authority[x] = match[0]["fiafcore"]

    client.close()

    turtle_string = graph.serialize(format="longturtle")
    for k, v in authority.items():
        turtle_string = turtle_string.replace(f"<{k}>", f"<{v}>")

    return rdflib.Graph().parse(data=turtle_string, format="turtle")


def transform(tier):
    graph = rdflib.Graph()

    xml_works = etree.parse(str(pathlib.Path.cwd() / "xml" / f"{tier}.xml"))
    xml_works = [x for x in xml_works.findall(".//record")]
    print(len(xml_works))
    for xml in tqdm.tqdm(xml_works, desc=tier):

        # testing filter.

        if 'Work' in tier:
            if xml.find('.//priref').text != '150335572':
                continue

        if 'Manifestation' in tier:
            if xml.find('.//priref').text != '152148202':
                continue

        if 'Item' in tier:
            if xml.find('.//priref').text != '152744617':
                continue

        # transformation via xslt to fiafcore structures.

        xsl_file = etree.parse(str(pathlib.Path.cwd() / "xsl" / f"{tier}.xsl"))
        transform = etree.XSLT(xsl_file)
        result = transform(xml)
        g = rdflib.Graph().parse(data=str(result), format="xml")
        g.bind("fiaf", rdflib.Namespace("https://ontology.fiafcore.org/"))

        # harmonise vocabulary terms to fiafcore.

        g = harmonise(g)

        # fiafcore authority ids for entities.

        # g = authority(g)

        # collect output into main graph.

        graph += g

    return graph


def main():
    # load variables.

    dotenv.load_dotenv()

    # transform data.

    g = rdflib.Graph()
    g += transform("BFI_FIAF_LOD_Works")
    g += transform("BFI_FIAF_LOD_Manifestations")
    g += transform("BFI_FIAF_LOD_Items")

    # write resulting rdf.

    print(len(g))

    g.serialize(destination=pathlib.Path.cwd() / "fiafcore_bfi.ttl", format="turtle")

    # print(g.serialize(format='turtle'))

if __name__ == "__main__":
    main()
