from lxml import etree
import dotenv
import os
import pathlib
import rdflib

def transform(tier):

    data = etree.parse(str(pathlib.Path.cwd() / 'xml' / f'{tier}.xml'))
    xsl_file = etree.parse(str(pathlib.Path.cwd() / 'xsl' / f'{tier}.xsl'))
    transform = etree.XSLT(xsl_file)
    result = transform(data)

    return rdflib.Graph().parse(data=str(result), format='xml')

def harmonise(graph_in):

    turtle_string = graph_in.serialize(format='longturtle')

    turtle_string = turtle_string.replace('<bfi://ontology/work>', '<https://ontology.fiafcore.org/Work>')
    
    graph_out = rdflib.Graph().parse(data=turtle_string, format='turtle')

    return graph_out

def authority(graph_in):


    work_type = rdflib.URIRef('https://ontology.fiafcore.org/Work')
    work_ids = [str(s) for s,p,o in graph_in.triples((None, rdflib.RDF.type, work_type))]
    
    print(len(work_ids))
    print((work_ids[:3]))




    # dotenv.load_dotenv()
    # atlas_user, atlas_pass = os.getenv('atlas_username'), os.getenv('atlas_password')
    # client = pymongo.MongoClient(f'mongodb+srv://{atlas_user}:{atlas_pass}@fiaf-auth.frdajdk.mongodb.net/?retryWrites=true&w=majority&appName=fiaf-auth')
    # db = client["fiafauth"] 



        # print('@@@', s)



    # copy find and replace as above,
    # first pull all "works"
    # then find all those that exist in mongo, if not create
    # build a dict of transforms
    # apply and return

#     # TODO, lookup source id on authority db
#     # if it exists, return fiafcore id
#     # else, generate, and then return.


    return graph_in

# load variables.

dotenv.load_dotenv()

# transformation via xslt to fiafcore structures.

g = rdflib.Graph()
g += transform('BFI_FIAF_LOD_Works')
# g += transform('BFI_FIAF_LOD_Manifestations')
# g += transform('BFI_FIAF_LOD_Items')

# harmonise vocabulary terms to fiafcore.

g = harmonise(g)

# fiafcore authority ids for entities.

g = authority(g)

# write resulting rdf.

g.serialize(destination=pathlib.Path.cwd() / 'fiafcore_bfi.ttl', format='longturtle')
