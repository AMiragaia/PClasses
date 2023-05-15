l = int(input("Num?" ))
def fib():
    lst = [1,1]
    for x in range(2,l):
        lst.append(int(lst[x-2]) + int(lst[x-1])) 
    return lst

print(fib())