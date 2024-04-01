import time
import psutil
import xml.etree.ElementTree as ET
#alterar a função para que ela tenha em conta o ficheiro conf.xml
def main():
    #criar uma lista com os nomes dos processos
    lista_processos = []
    fout = open("conf.xml", "w")
    fout.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
    fout.write("<processos>\n")
    for proc in psutil.process_iter():
        try:
            pinfo = proc.as_dict(attrs=['pid', 'name'])
            lista_processos.append(pinfo)
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass
    for processo in lista_processos:
        fout.write("<processo>\n")
        fout.write("<pid>%s</pid>\n" % processo['pid'])
        fout.write("<name>%s</name>\n" % processo['name'])
        fout.write("</processo>\n")
    fout.write("</processos>\n")
    fout.close()
    #adicionar a lista de processos ao ficheiro conf.xml
    tree = ET.parse("conf.xml")
    root = tree.getroot()
    for processo in root.findall("processo"):
        print("PID: %s" % processo.find("pid").text)
        print("Nome: %s" % processo.find("name").text)
        print("\n")

main()
