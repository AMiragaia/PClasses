def main():
    usrinput = int(input("Número de termos"))
    print(leibnizPi4(usrinput))

def leibnizPi4(n):
    #assert n>0;
    i = 0
    result = 0

    while(i <= n):
        if((i % 2) == 0):                                       #Par
            result = result + ( ( 1 ) / ( ( 2 * i ) + 1 ) )     
            i += 1
        else:                                                   #Impar
            result = result - ( ( 1 ) / ( ( 2 * i) + 1 ) )      
            i += 1
    return (result)


if __name__ == "__main__":
    main()