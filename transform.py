from lxml import etree
import rdflib
import pathlib
import pydash
import xmltodict

# with open(pathlib.Path.cwd() / 'data' / 'BFI_FIAF_LOD_Works.xml') as xml_data:
#     xml_data = xml_data.read()
#     xml_data = xmltodict.parse(xml_data)['adlibXML']['recordList']['record']

# record_keys = list()
# for r in xml_data[:200]:
#     record_keys += r.keys()
# record_keys = pydash.uniq(record_keys)
# print(len(record_keys))

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