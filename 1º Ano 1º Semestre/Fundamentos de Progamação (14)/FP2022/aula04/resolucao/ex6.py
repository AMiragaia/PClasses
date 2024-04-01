def LeibnizPi4(n):
    pi = 0
    for i in range(n):
        pi += (-1)**i / (2*i+1)
    return pi*4

def main():
    n = int(input("Enter a number: "))
    print(LeibnizPi4(n))

if __name__ == "__main__":
    main()
    