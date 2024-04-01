#Exercicio 1.1
def comprimento(lista):
	#Dada uma lista, retorna o seu comprimento
	if lista == []:
		return 0
	else:
		return 1 + comprimento(lista[1:])
	pass

#Exercicio 1.2
def soma(lista):
	#Dada uma lista de números, retorna a respectiva soma
	if lista == []:
		return 0
	else:
		return lista[0] + soma(lista[1:])

	pass

#Exercicio 1.3
def existe(lista, elem):
	#Dada uma lista e um elemento, verifica se o elemento ocorre na lista. Retorna um valor booleano.
	if lista == []:
		return False
	elif lista[0] == elem:
		return True
	else:
		return existe(lista[1:], elem)
	pass

#Exercicio 1.4
def concat(l1, l2):
	#Dadas duas listas, retorna a sua concatenação
	if l1 == []:
		return l2
	else:
		return [l1[0]] + concat(l1[1:], l2)
	pass

#Exercicio 1.5
def inverte(lista):
	#Dada uma lista, retorna a sua inversa.
	if lista == []:
		return []
	else:
		return inverte(lista[1:]) + [lista[0]]
	pass

#Exercicio 1.6
def capicua(lista):
	#Dada uma lista, veriﬁca se forma uma capicua, ou seja, se, quer se leia da esquerda para a direita ou vice-versa, se obtem a mesma sequência de elementos.
	if lista == []:
		return True
	elif lista[0] == lista[-1]:
		return capicua(lista[1:-1])
	else:
		return False
	pass

#Exercicio 1.7
def concat_listas(lista):
	#Dada uma lista de listas, retorna a concatenação dessas listas.
	if lista == []:
		return []
	else:
		return lista[0] + concat_listas(lista[1:])
	pass

#Exercicio 1.8
def substitui(lista, original, novo):
	#Dada uma lista, um elemento x e outro elemento y, retorna uma lista similar à lista de entrada, na qual x é substituido por y em todas as ocorrências de x.
	if lista == []:
		return []
	elif lista[0] == original:
		return [novo] + substitui(lista[1:], original, novo)
	else:
		return [lista[0]] + substitui(lista[1:], original, novo)
	pass

#Exercicio 1.9
def fusao_ordenada(lista1, lista2):
	#Dadas duas listas ordenadas de números, calcular a união ordenada mantendo eventuais repeticões
	if lista1 == []:
		return lista2
	elif lista2 == []:
		return lista1
	elif lista1[0] < lista2[0]:
		return [lista1[0]] + fusao_ordenada(lista1[1:], lista2)
	else:
		return [lista2[0]] + fusao_ordenada(lista1, lista2[1:])
	pass

#Exercicio 1.10
def lista_subconjuntos(lista):
	#Dado um conjunto, na forma de uma lista, retorna uma lista de listas que representa o conjunto de todos os subconjuntos do conjunto dado.
	if lista == []:
		return [[]]
	else:
		temp = lista_subconjuntos(lista[1:])
		return temp + [[lista[0]] + x for x in temp]
	pass


#Exercicio 2.1
def separar(lista):
	#Dada uma lista de pares, produzir um par com as listas dos primeiros e segundos elementos desses pares.
	if lista == []:
		return ([], [])
	else:
		temp = separar(lista[1:])
		return ([lista[0][0]] + temp[0], [lista[0][1]] + temp[1])
	pass

#Exercicio 2.2
def remove_e_conta(lista, elem):
	#Dada uma lista l e um elemento x, retorna um par formado pela lista dos elementos de l diferentes de x e pelo numero de ocorrencias x em l
	if lista == []:
		return ([], 0)
	elif lista[0] == elem:
		temp = remove_e_conta(lista[1:], elem)
		return (temp[0], temp[1] + 1)
	else:
		temp = remove_e_conta(lista[1:], elem)
		return ([lista[0]] + temp[0], temp[1])
	pass

#Exercicio 2.3
def ocorrencias(lista,elem):
	#Dada uma lista, retorna o n´umero de ocorrˆencias de cada elemento, na forma de uma lista de pares (elemento,contagem)
	if lista == []:
		return []
	else:
		temp = remove_e_conta(lista, lista[0])
		return [(lista[0], temp[1])] + ocorrencias(temp[0], elem)
	pass
#Exercicio 3.1
def cabeca(lista):
	#Dada uma lista, retornar o elemento que esta a cabeca (ou seja, na posicao 0)
	if lista == []:
		return None
	else:
		return lista[0]
	pass

#Exercicio 3.2
def cauda(lista):
	#Dada uma lista, retornar a sua cauda (ou seja, todos os elementos a excepcao do primeiro)
	if lista == []:
		return None
	else:
		return lista[1:]
	pass

#Exercicio 3.3
def juntar(l1, l2):
    if len(l1) != len(l2):
        return None
    if not l1 or not l2:
        return []
    else:
        return [(l1[0], l2[0])] + juntar(l1[1:], l2[1:])




#Exercicio 3.4
def menor(lista):
    if not lista:
        return None
    elif len(lista) == 1:
        return lista[0]
    else:
        min_of_tail = menor(lista[1:])
        return lista[0] if lista[0] < min_of_tail else min_of_tail


#Exercicio 3.5
def parmin(lista):
	#Dada uma lista de n´umeros, retorna um par formado pelo menor elemento e pela lista dos restantes elementos
	pass
#Exercicio 3.6
def max_min(lista):
	#Dada uma lista de n´umeros, calcular o m´aximo e o m´ınimo, retornando-os num tuplo
	pass