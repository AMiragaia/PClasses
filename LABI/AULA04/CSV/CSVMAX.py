#implemente um programa que leia um arquivo CSV e calcule o valor maximo,minimo e a media da temperatura
import csv
import sys

def main(argv):
    fich_csv = open(argv[1], "r")
    csv_reader = csv.reader(fich_csv, delimiter=",")
    linhas = []
    for row in csv_reader:
        linhas.append(row)
    linhas = linhas[1:]
    fich_csv.close()

    max = 0
    min = 0
    media = 0
    for row in linhas:
        if float(row[1]) > max:
            max = float(row[1])
        if float(row[1]) < min:
            min = float(row[1])
        media += float(row[1])
    media = media / len(linhas)
    print("Max:", max)
    print("Min:", min)
    print("Media:", media)

main(sys.argv)