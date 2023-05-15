word = input("Alguma string:")

random = word[0:]
random1 = word[::-1]
if random == random1:
    print("This word is a palindrome")
else:
    print("This word is not a palindrome")


