#A left-truncatable prime is a prime number that contains no 0 digits and, when the first digit is successively removed, the result is always prime.

#A right-truncatable prime is a prime number that contains no 0 digits and, when the last digit is successively removed, the result is always prime.

#Create a function that takes an integer as an argument and:

#If the integer is only a left-truncatable prime, return "left".
#If the integer is only a right-truncatable prime, return "right".
#If the integer is both, return "both".
#Otherwise, return False.
def truncatableprime():
    import math
    def isprime(n):
        if n==1:
            return False
        for i in range(2,int(math.sqrt(n))+1):
            if n%i==0:
                return False
        return True
    def lefttruncatableprime(n):
        n=str(n)
        for i in range(1,len(n)):
            if isprime(int(n[i:]))==False:
                return False
        return True
    def righttruncatableprime(n):
        n=str(n)
        for i in range(1,len(n)):
            if isprime(int(n[:i]))==False:
                return False
        return True
    def truncatableprime(n):
        if lefttruncatableprime(n)==True and righttruncatableprime(n)==True:
            return "both"
        elif lefttruncatableprime(n)==True and righttruncatableprime(n)==False:
            return "left"
        elif lefttruncatableprime(n)==False and righttruncatableprime(n)==True:
            return "right"
        else:
            return False
    return truncatableprime
    
a=truncatableprime()
print(a(7))