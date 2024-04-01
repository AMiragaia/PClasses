#Exercicio 4.1

#Implementar na forma de uma expressao-lambda:) Dado um numero inteiro, retorna True caso o numero seja ımpar, e False caso contrario
impar = lambda x: x % 2 != 0


#Exercicio 4.2
positivo = lambda x: x > 0

#Exercicio 4.3
comparar_modulo = lambda x, y: abs(x) < abs(y)

#Exercicio 4.4
#(Implementar na forma de uma expressao-lambda:) Dado um par (x, y), representando coordenadas cartesianas de um ponto no plano XY, retorna um par (r, θ), correspondente as coordenadas polares do mesmo ponto.
import math
cart2pol = lambda x, y: (math.sqrt(x**2 + y**2), math.atan2(y, x))

#Exercicio 4.5
#Dadas tres funcoes de duas entradas, f, g e h, retorna uma funcao de tres entradas, x, y e z, cujo resultado e dado por: h(f (x, y), g(y, z)).
ex5 = lambda f, g, h: lambda x, y, z: h(f(x, y), g(y, z))

#Exercicio 4.6
def quantificador_universal(lista, f):
    pass

#Exercicio 4.8
def subconjunto(lista1, lista2):
    pass

#Exercicio 4.9
def menor_ordem(lista, f):
    pass

#Exercicio 4.10
def menor_e_resto_ordem(lista, f):
    pass

#Exercicio 5.2
def ordenar_seleccao(lista, ordem):
    pass
