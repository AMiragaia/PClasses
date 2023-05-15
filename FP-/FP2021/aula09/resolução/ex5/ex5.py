from bisect import bisect_left
from contextvars import copy_context
import re
import string
from tkinter import Y
def main():
    lst = []
    filetext = open("wordlist.txt","r")
    for i in filetext:
        lst.append(i.strip("\n"))
    
    while True:
        strinput = input("Starting letter?").lower()
        possLetters = searchwords(lst, strinput)
        if len(possLetters) == 0:
            print("You wrote {}".format(strinput))
            break
        else:
            print("Possible Letters:")
            for i in possLetters:
                print(i)




def searchwords(a, x):
    alphabet_string = list(string.ascii_lowercase)
    cpossible = alphabet_string.copy()
    #lista de letras
    print(cpossible)
    for i in cpossible:
        run = x + i 
        pos = bisect_left(a, run)
        #print(pos)
        #print(run)
        #print(a[pos][0:len(x)])
        if a[pos][0:len(x)+1] != run:
            cpossible.remove(i)
    return(cpossible)            

main()



