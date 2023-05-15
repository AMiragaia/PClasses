def ispalindrome(s):
    if len(s) <= 1:
        return True
    else:
        return s[0] == s[-1] and ispalindrome(s[1:-1])

def main():
    s = input("String? ")
    print(ispalindrome(s))


if __name__ == "__main__":
    main()