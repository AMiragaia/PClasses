def main():
    usrInp = int(input("Todos os números até? "))
    print(isPrime(usrInp))


def isPrime(n):
    primenumb = []
    for i in range(2, n+1):
        j = 2
        templist = [1, i]
        while(j < i-1):
            if (i % j == 0):
                templist.append(j)
            j += 1
        if(len(templist) == 2):
            primenumb.append(i)
    return(primenumb)


if __name__ == "__main__":
    main()