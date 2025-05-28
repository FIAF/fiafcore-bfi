from lxml import etree
import rdflib
import pathlib
import pydash
import xmltodict

# transformation via xslt to fiafcore structures.

data = etree.parse(str(pathlib.Path.cwd() / 'data' / 'BFI_FIAF_LOD_Works.xml'))
xsl_file = etree.parse(str(pathlib.Path.cwd() / 'bfi_works.xsl'))
transform = etree.XSLT(xsl_file)
result = transform(data)
turtle = rdflib.Graph().parse(data=str(result), format='xml')

# mapping, ontology and vocabulary elements to fiafcore.

turtle_string = turtle.serialize(format='longturtle')
turtle_string = turtle_string.replace('<bfi://ontology/work>', '<https://ontology.fiafcore.org/Work>')

# authority, entities to fiafcore pids.

print(len(turtle))

# print(turtle.serialize(format='longturtle'))
# print(turtle_string)