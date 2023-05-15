#Um triângulo retângulo tem catetos A e B e hipotenusa C. Escreva um programa que leia                               
#os comprimentos dos catetos e determine a hipotenusa, bem como o valor do ângulo (em                             
#graus) entre o lado A e a hipotenusa. ​Sugestão: use o módulo ​math​. Pode abrir o                               
#Python em modo interativo e fazer ​import math; help(math) para ver todas as                         
#funções disponíveis​

import math
A = float(input("Qual o comprimento do cateto?" ))
B = float(input("Qual o comprimento do cateto?" ))
h = math.hypot(A,B)
t = A / B
a = math.atan(t)
print(h)
print(a)