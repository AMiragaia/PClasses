from lxml import etree

def main():
    xml = etree.parse('aula04/XML/conf.xml')
    root = xml.getroot()
    print(root.tag)
    for atributo in root.attrib:
        print(atributo, '=', root.attrib[atributo])
    for filho in root:
        print(filho.tag, filho.attrib)
        for filho2 in filho:
            print(filho2.tag, filho2.attrib)
        

    

if __name__ == '__main__':
    main()