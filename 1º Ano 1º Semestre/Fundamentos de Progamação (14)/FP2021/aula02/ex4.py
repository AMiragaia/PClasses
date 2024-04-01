#Escreva um programa que leia um número inteiro e mostre uma mensagem indicando se o
#número é par ou ímpar. Sugestão: use o operador % para obter o resto da divisão por 2.

n = int(input("Qual o numero que deseja?" ))
if n % 2 == 0:
    print(n, "é um numero par")
else:
    print(n, "é um numero impar")