def intersects(a1,b1,a2,b2):
    if a1 > b2 or a2 > b1:
        return False
    else:
        return True

def main():
    a1 = int(input("a1: "))
    b1 = int(input("b1: "))
    a2 = int(input("a2: "))
    b2 = int(input("b2: "))
    print(intersects(a1,b1,a2,b2))

if __name__ == "__main__":
    main()