def divisor():
    lst = []
    num = int(input("Number?" ))
    for i in range(1,num):
        if num%i == 0:
            lst.append(i)
        else:
            None
    print(lst)
divisor()
