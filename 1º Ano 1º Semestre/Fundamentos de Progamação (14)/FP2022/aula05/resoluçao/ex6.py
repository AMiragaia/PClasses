def shorten (s):
    string1 = ""
    for x in s:
        if x.isupper():
            string1 += x
    return string1

def main():
    s = input("String? ")
    print(shorten(s))

if __name__ == "__main__":
    main()