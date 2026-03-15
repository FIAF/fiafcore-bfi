
import pandas
import pathlib
from xml.etree import ElementTree as et

def terms(property, tier, xpath):

    path = pathlib.Path.cwd() / 'xml' / f'BFI_FIAF_LOD_{tier}.xml'
    if not path.exists():
        raise Exception('Path not found.')

    root = et.parse(path).getroot()
    values = root.findall(xpath)
    df = pandas.DataFrame([x.text for x in values], columns=['term'])
    df = pandas.DataFrame(df.value_counts(subset='term')).reset_index()

    string = f'## fiafcore:{property}\n\n'
    string += f'`[{tier}] xpath {xpath}`\n\n'
    string += df.to_markdown(index=False)+'\n\n'

    return string

m = ''

# fiafcore:Activity

m += terms('Activity', 'Works', ".//cast/cast.credit_type")
m += terms('Activity', 'Works', ".//credits/credit.type")

# fiafcore:Base

m += terms('Base', 'Items', ".//base/value[@lang='0']")

# fiafcore:Codec

m += terms('Codec', 'Items', ".//code_type")

# fiafcore:ColourCharacteristic

m += terms('ColourCharacteristic', 'Manifestations', ".//colour_manifestation/value[@lang='0']")

# fiafcore:ColourStandard

m += terms('ColourStandard', 'Manifestations', ".//colour_code_manifestation")

# fiafcore:Country

m += terms('Country', 'Works', ".//production_country")

# fiafcore:Element

m += terms('Element', 'Items', ".//physical_description")

# fiafcore:Extent

m += terms('Extent', 'Manifestations', ".//runtime")
m += terms('Extent', 'Manifestations', ".//runtime_seconds")
m += terms('Extent', 'Manifestations', ".//cans")
m += terms('Extent', 'Items', ".//total_footage")
m += terms('Extent', 'Items', ".//total_filesize")

# fiafcore:Format

m += terms('Format', 'Manifestations', ".//format_low_level")

# fiafcore:Genre

m += terms('Genre', 'Works', ".//content")

# fiafcore:Language

m += terms('Language', 'Manifestations', ".//language/language")

# fiafcore:LanguageUsage

m += terms('LanguageUsage', 'Manifestations', ".//language.type/value[@lang='0']")

# fiafcore:Manifestation

m += terms('Manifestation', 'Manifestations', ".//manifestationlevel_type_specific/value[@lang='0']")

# fiafcore:SoundCharacteristic

m += terms('SoundCharacteristic', 'Manifestations', ".//sound_manifestation/value[@lang='0']")
m += terms('SoundCharacteristic', 'Items', ".//sound_item/value[@lang='0']")

# fiafcore:SoundSystem

m += terms('SoundSystem', 'Manifestations', ".//sound_system_manifestation")
m += terms('SoundSystem', 'Items', ".//sound_system_item")

# fiafcore:Status

m += terms('Status', 'Items', ".//copy_status/value[@lang='0']")
m += terms('Status', 'Items', ".//copy_usage")

# fiafcore:Stock

m += terms('Stock', 'Items', ".//stock/stock_film")

# fiafcore:Subject

m += terms('Subject', 'Works', ".//content.subject")

# fiafcore:Title

m += terms('Title', 'Works', ".//title.type/value[@lang='0']")

# render report to disk.

with open(pathlib.Path.cwd() / 'report.md', 'w') as markdown_export:
    markdown_export.write(m)
