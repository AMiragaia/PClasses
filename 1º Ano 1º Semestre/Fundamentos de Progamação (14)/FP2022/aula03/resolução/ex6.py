def max2(x,y):
    if x > y:
        return x
    else:
        return y

def max3(x,y,z):
    return max2(max2(x,y),z)

def main():
    a = int(input("a: "))
    b = int(input("b: "))
    c = int(input("c: "))
    print(max2(a,b))
    print(max3(a,b,c))

if __name__ == "__main__":
    main()
