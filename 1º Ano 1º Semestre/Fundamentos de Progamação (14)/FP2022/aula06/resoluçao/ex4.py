# Complete o programa!

# a)
def loadFile(fname, lst):
    with open(fname, 'r') as f:
        #split the lines
        i = 0
        for line in f:
            if i == 0:
                i += 1
                continue
            line = line.strip()
            line = line.split("\t")
            lst.append((line[0],line[1], line[-3], line[-2], line[-1]))
    return lst

            
    
# b) Crie a função notaFinal aqui...
def notafinal(reg):
    return (float(reg[2]) + float(reg[3]) + float(reg[4]))/3
    

# c) Crie a função printPauta aqui...
def printPauta(lst):
    #create a table with the data
    #with the first row as the headers
    for x in range(len(lst)):
        print(f"{lst[x][0]:^10} {lst[x][1]:^20} {notafinal(lst[x]):>10.2f}")


# d)
def main():
    lst = []
    # ler os ficheiros
    loadFile("school1.csv", lst)
    loadFile("school2.csv", lst)
    loadFile("school3.csv", lst)
    
    # ordenar a lista 
    lst.sort()
    
    # mostrar a pauta
    printPauta(lst)

    #save the data to a file
    with open("pauta.txt", "w") as f:
        f.write("Nº Aluno\tNome\tMédia")
        for x in range(len(lst)):
            f.write(f"{lst[x][0]}\t{lst[x][1]}\t{notafinal(lst[x]):.2f}")


# Call main function
if __name__ == "__main__":
    main()
