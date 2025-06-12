from lxml import etree
import rdflib
import pathlib
import pydash
import tqdm
import xmltodict

def pull_keys(xml_path):

	print(xml_path)

	xml_path = pathlib.Path.cwd() / 'xml' / xml_path
	with open(xml_path) as xml_data:
	    xml_data = xml_data.read()
	    xml_data = xmltodict.parse(xml_data)['adlibXML']['recordList']['record']

	keys = list()
	for r in tqdm.tqdm(xml_data):
	    keys += r.keys()
	keys = pydash.uniq(keys)
	print(len(keys))
	for k in keys:
		print(k)

	print('\n')

pull_keys('BFI_FIAF_LOD_Works.xml')
pull_keys('BFI_FIAF_LOD_Manifestations.xml')
pull_keys('BFI_FIAF_LOD_Items.xml')
