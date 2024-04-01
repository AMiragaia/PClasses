def CountDigits(str):
    count = 0
    for i in str:
        if i.isdigit():
            count += 1
    return count

def main():
    str = input("Enter a string: ")
    print("The number of digits in the string is", CountDigits(str))

if __name__ == "__main__":
    main()
    