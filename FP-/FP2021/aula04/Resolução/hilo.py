# Complete the code to make the HiLo game...

import random

def main():
    # Pick a random number between 1 and 100, inclusive
    secret = random.randrange(1, 101);
    print("Can you guess my secret?")
    # put your code here
    x = None
    guesses = 0
    while (x != secret):
        x = int(input())
        if (x > secret):
            print("High")
        else:
            print("Low")
        guesses += 1
    
    print("Congrats! My secret number was {}, it took you {} tries to guess it!".format(secret,guesses))
main()
