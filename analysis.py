from lxml import etree
import pandas
import pathlib
import pydash
import rdflib
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

def extract_value(v):


	if type(v) != list:
		v = [v]

	term = pydash.flatten([x['value'] for x in v])
	term = [x['#text'] for x in term if x['@lang'] == '0']

	return term


def pull_vocab(xml_path, key):

	xml_path = pathlib.Path.cwd() / 'xml' / xml_path
	with open(xml_path) as xml_data:
	    xml_data = xml_data.read()
	    xml_data = xmltodict.parse(xml_data)['adlibXML']['recordList']['record']

	values = list()
	for r in tqdm.tqdm(xml_data):
		if 'base' in r.keys():
			values.append(r['base'])

	vocab_df = pandas.DataFrame({'values':values})
	vocab_df['values'] = vocab_df['values'].apply(extract_value)
	vocab_df = vocab_df.explode('values')
	vocab_df = vocab_df.value_counts('values')

	print(len(vocab_df))
	print(vocab_df.head(20))

# # pull a full list of keys for each record under the XML.

# pull_keys('BFI_FIAF_LOD_Works.xml')
# pull_keys('BFI_FIAF_LOD_Manifestations.xml')
# pull_keys('BFI_FIAF_LOD_Items.xml')

# pull vocabs of values.

pull_vocab('BFI_FIAF_LOD_Items.xml', 'base')
