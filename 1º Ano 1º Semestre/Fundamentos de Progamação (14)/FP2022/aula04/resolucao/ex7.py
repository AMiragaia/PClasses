
def ask_sequence():
    number = input("Enter a number: ")
    x = 0
    y = 0
    while True:
        if number == "":
            break
        else:
            number = float(number)
            x = x + number
            y = y + 1
            number = input("Enter a number: ")
    return x/y

def main():
    print(ask_sequence())

main()

