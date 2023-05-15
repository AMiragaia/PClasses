def euclides(a, b):
    r = a % b
    if r == 0:
        return b
    elif r > 0:
        return euclides(b, r)

    

def main():
    a = int(input("a: "))
    b = int(input("b: "))
    print(euclides(a,b))

main()