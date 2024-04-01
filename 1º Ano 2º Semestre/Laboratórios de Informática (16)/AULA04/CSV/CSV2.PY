import csv
from mailcap import findmatch
import sys
def main(argv):

    fich_csv = open(argv[1], "r")
    reader = csv.DictReader(fich_csv, delimiter=",")
    for row in reader:
        print(row)
    fich_csv.close()

    if len(argv) > 2:
        fich_csv = open(argv[2], "r")
        reader = csv.DictReader(fich_csv)
        for row in reader:
            print(row)
        fich_csv.close()
    
if __name__ == "__main__":
    main(sys.argv)
#Assegura um valor random através do rand.csv.
#Não existe nenhum valor numerico no ficheiro rand.csv (?).
