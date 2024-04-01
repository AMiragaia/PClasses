

def main():
    print(seq())

def seq():

    list = []
    x = 0.0

    while True:
        tempUsrInp = input("Número? ")
        while(not tempUsrInp.isnumeric() and tempUsrInp != ""):
            tempUsrInp = input("Por favor escreva um número. ")
        if tempUsrInp == "":
            break
        list.append(int(tempUsrInp))
    
    for i in list:
        x = x + i
    median = x / len(list)
    return(median)
        



if __name__ == "__main__":
    main()