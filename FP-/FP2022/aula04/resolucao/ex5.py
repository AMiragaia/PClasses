# Complete the code to make the HiLo game...
import random
def main():
    # Pick a random number between 1 and 100, inclusive
    secret = random.randrange(1, 101);
    print("Can you guess my secret?")
    number = int(input("Enter a number: "))
    while number != secret:
        if number > secret:
            print("Too high")
        else:
            print("Too low")
        number = int(input("Enter a number: "))
    print("You guessed it!")

main()