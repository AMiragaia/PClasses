def tax(r):
    if r <= 1000:
        print(0.1*r)
    elif r <= 2000:
        print(0.2*r-100)
    elif r > 2000:
        print(0.3*r-300)

def main():
    r = int(input("r: "))
    tax(r)

if __name__ == "__main__":
    main()