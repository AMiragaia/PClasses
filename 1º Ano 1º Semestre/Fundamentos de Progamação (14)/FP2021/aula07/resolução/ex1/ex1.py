import sys


def main():
    Alph = {}
    n = sys.argv
    if len(n) == 1: 
        print("É preciso um parametro")
        return(0)
    Filetxt = open(sys.argv[1],"r",encoding="utf-8")
    for lines in Filetxt:
        lines = lines.split()
        for word in lines:
            for i in word:
                if i.isalpha():
                    if i in Alph:
                        Alph[i] += 1
                    else:
                        Alph[i] = 1
    for x in Alph:
        print("{} = {}".format(x, Alph[x]))
main()