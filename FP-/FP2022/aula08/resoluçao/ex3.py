
def primesUpTo(n):
    """Returns a set of all primes up to n using the Sieve of Eratosthenes."""
    numbers = list(range(2,n+1))
    primes = set()
    while numbers:
        p = numbers[0]
        primes.add(p)
        numbers = [x for x in numbers if x % p != 0]
    return primes
    

def main():
    # Testing:
    s = primesUpTo(1000)
    print(s)

    # Do some checks:
    assert primesUpTo(30) == {2,3,5,7,11,13,17,19,23,29}
    assert len(primesUpTo(1000)) == 168
    assert len(primesUpTo(7918)) == 999
    assert len(primesUpTo(7919)) == 1000
    print("All tests passed!")

if __name__ == "__main__":
    main()

