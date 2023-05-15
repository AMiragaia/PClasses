def get_num():
    return int(input("Give me a number: "))
def primecheck():
    num = get_num()
    a = [x for x in range(2, num) if num % x == 0]
    if num > 1:
        if len(a) == 0:
            print ("prime")
        else:
            print ("not prime")
    else:
        print ("not prime")

def main():
    primecheck()

main()

