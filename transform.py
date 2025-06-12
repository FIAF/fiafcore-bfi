from lxml import etree
import rdflib
import pathlib

def transform(tier):

    data = etree.parse(str(pathlib.Path.cwd() / 'xml' / f'{tier}.xml'))
    xsl_file = etree.parse(str(pathlib.Path.cwd() / 'xsl' / f'{tier}.xsl'))
    transform = etree.XSLT(xsl_file)
    result = transform(data)

    return rdflib.Graph().parse(data=str(result), format='xml')

def authority(source_id):

    # TODO, lookup source id on authority db
    # if it exists, return fiafcore id
    # else, generate, and then return.

    pass

# transformation via xslt to fiafcore structures.

g = rdflib.Graph()
g += transform('BFI_FIAF_LOD_Works')
g += transform('BFI_FIAF_LOD_Manifestations')
g += transform('BFI_FIAF_LOD_Items')



# authority harmonisation via mongo.

# 


# print(g.serialize(format='longturtle'))

# mapping, ontology and vocabulary elements to fiafcore.

# turtle_string = g.serialize(format='longturtle')
# turtle_string = turtle_string.replace('<bfi://ontology/work>', '<https://ontology.fiafcore.org/Work>')



for s,p,o in g.triples((rdflib.URIRef('bfi://resource/work/150335572'), None, None)):
    print(s,p,o)
    for a,b,c in g.triples((o, None, None)):
        print(a,b,c)
    print('\n')

print(len(g))


#    ''' Sequential processes. '''

#     turtle = transform(xml)
#     turtle = mapping(turtle)
#     turtle = authority(db, turtle)

#     return turtle

# authority, entities to fiafcore pids.

# print(len(turtle))

# print(turtle.serialize(format='longturtle'))
# print(turtle_string)


# print(len(g))
