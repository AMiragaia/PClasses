def number():
    n = int(input("Enter a number: "))
    y = 0
    for x in range(1,n):
        if n % x == 0:
            y = y + x
            print(x)
    if y == n:
        print(n,"é um numero perfeito")
    if y > n:
        print(n,"é um numero abundante")
    if y < n:
        print(n,"é um numero deficiente")
number()
    