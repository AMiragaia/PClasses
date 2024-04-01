from msilib import schema
from pydoc import doc
from lxml import etree
from lxml.etree import XMLSyntaxError

def main():
    doc = etree.parse("aula04/XML/playlist.xml")
    #no momento em que este script foi feito
    #não existe um ficheiro de validação disponivél para verificar a playlist
    schema = etree.parse("xspf-draft8.rng")
    validator = etree.RelaxNG(schema)

    if validator.validate(doc):
        print("XML is valid")
    else:
        print(validator.error_log.last_error)

main()
