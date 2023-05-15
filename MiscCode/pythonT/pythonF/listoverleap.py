import random
a = range(1,random.randint(1,100))
b = range(1,random.randint(10,40))

def listoverleap():
    lst = []
    for x in a:
        if x in b:
            lst.append(x)
        else:
            ()
    for x in b:
        if x in a:
            ()
        elif x in lst:
            lst.append(x)
        else:
            ()
    print (lst)
listoverleap()

lista = [x for x in b if x in a ]
print(lista)