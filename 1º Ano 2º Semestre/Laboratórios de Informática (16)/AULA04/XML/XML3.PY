from lxml import etree
import time
import psutil
def main():
    root = etree.Element("stats")
    for i in range(1,10):
        value = etree.SubElement(root,"value")
        value.set("time", str(int(time.time())))
        value.set("cpu", str(psutil.cpu_percent(interval=1)))
        value.set("ram", str(psutil.virtual_memory().percent))
        value.set("network", str(psutil.disk_usage('/').percent))
        value.text = str(i)
        time.sleep(1)

        print(etree.tostring(root, xml_declaration=True,
            encoding="utf-8",pretty_print=True).decode("utf-8"))
main()