a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
def fiveminus():
    for x in a:
        if x < 5:
            print (x)
        else:
            None
def newlist():
    lst = []
    for x in a:
        if x < 5:
            lst.append(x)
        else:
            None
    print(lst)
def newnumber():
    lista = []
    number = int(input("Numero?" ))
    for x in a:
        if number < x:
            None
        else:
            lista.append(x)
    print(lista)


def main():
    newlist()
    fiveminus()
    newnumber()
main()