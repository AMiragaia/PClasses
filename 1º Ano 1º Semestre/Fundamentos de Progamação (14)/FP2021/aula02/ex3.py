# coding: utf-8
# This program finds the maximum of two numbers.
# It uses the built-in max function.
# Can you do it with conditional statements (if / if-else) instead?
#Copie o programa anterior para max3.py e modifique esta cópia para achar o maior de
#três números.  Use instruções condicionais.  Consegue fazê-lo só com duas comparações?



x1 = float(input("number? "))
x2 = float(input("number? "))
x3 = float(input("number? "))
# Use conditional statements instead of max function!
if x1 > x2:
    mx = x1
else:
    mx = x2
if mx > x3:
    x = mx
else:
    x = x3
print(x)     


