a = int(input("Valor de um lado?" ))
b = int(input("Valor de um lado?" ))
c = int(input("Valor de um lado?" ))
def is_triangle(a,b,c):
    if a+b == c:
        print("No")
    else:
        print("Yes")
is_triangle(a,b,c)