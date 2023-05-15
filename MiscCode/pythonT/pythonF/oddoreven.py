number = int(input("Numero?" ))
def oddoreven():
    if number%2 != 0:
         print("Odd")
    elif number%4 ==0:
        print("The number is a multiple of 4")
    else:
        print("Even")

def divide():
    num = int(input("Numero?" ))
    check = int(input("Numero)" ))
    if num%check == 0:
        print(num, "é divisivel por", check)
    else:
        print(num, "não é divisivel por", check)


def main():
    oddoreven()
    divide()
main()            