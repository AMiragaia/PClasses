
def primesUpTo(n):
    numblist = list(range(0,n+1))
    for primes in numblist:
        if primes <2:
            continue
        for i in range(primes ** 2, n+1, primes):
            numblist[i] = 0
    return [x for x in numblist if x>1]     


def main():
    # Testing:
    s = primesUpTo(1000)
    print(s)

    # Do some checks:
    assert primesUpTo(30) == [2,3,5,7,11,13,17,19,23,29]
    assert len(primesUpTo(1000)) == 168
    assert len(primesUpTo(7918)) == 999
    assert len(primesUpTo(7919)) == 1000
    print("All tests passed!")

if __name__ == "__main__":
    main()