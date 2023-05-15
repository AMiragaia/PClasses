def isPrime(n):
    if n < 2:
        return False
    elif n == 2:
        return True
    else:
        for i in range(2, n):
            if n % i == 0:
                return False
        return True

def main():
    for i in range(100):
        if isPrime(i):
            print(i, "is prime")
        else:
            print(i, "is not prime")

main()