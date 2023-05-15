import random
def game():
    a = random.randint(1,9)
    guess = 0
    t = 0
    while guess != a and guess != "exit":
        guess = input("Guess?" )
        if guess == "exit":
            break
        guess = int(guess)
        t += 1
        if guess < a:
            print("Higher")
        elif guess > a: 
            print("Lower")
        else:
            print("Acertaste no numero, levaste", t, "tentativas")

def main():
    game()

main()
    
   
  