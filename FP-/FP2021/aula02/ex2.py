# coding: utf-8
# This program finds the maximum of two numbers.
# It uses the built-in max function.
# Can you do it with conditional statements (if / if-else) instead?
#O programa max2.py lê dois números e mostra o maior deles. Teste-o e analise-o.
#Altere o programa para fazer o mesmo, mas usando uma instrução condicional em vez da função pré-definida max.



x1 = float(input("number? "))
x2 = float(input("number? "))

# Use conditional statements instead of max function!
if x1 > x2:
    print("Maximum:", x1)
else:
    print("Maximum:", x2) 
