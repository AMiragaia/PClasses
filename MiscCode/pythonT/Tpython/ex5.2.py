a = int(input("Valor de a?" ))
b = int(input("Valor de b?" ))
c = int(input("Valor de c?" ))
n = int(input("Valor de n?" ))
def check_fermat(a,b,c,n):
    if n > 2:
        x = a**n+b**n == c**n
        if not x:
            print("No, that doesn’t work.")
        else:
            print("Holy smokes, Fermat was wrong!")
check_fermat(a,b,c,n)
