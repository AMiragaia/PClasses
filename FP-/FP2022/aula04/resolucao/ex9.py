def Fibonacci(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return Fibonacci(n-1) + Fibonacci(n-2)

def main():
    n = int(input("Enter a number: "))
    print("The Fibonacci number at position", n, "is", Fibonacci(n))

main()