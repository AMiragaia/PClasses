def isDigit(str):
    x = 0
    for i in str:
        if i.isdigit():
            x += 1
    print(x)

def main():
    str = input("String? ")
    isDigit(str)

if __name__ == "__main__":
    main()