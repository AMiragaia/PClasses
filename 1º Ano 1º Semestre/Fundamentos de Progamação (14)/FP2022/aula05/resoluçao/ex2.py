
def inputFloatList():
    lista = []
    while True:
        num = input("Digite um número: ")
        if num == "":
            break
        else:
            lista.append(float(num))
    return lista

def countLower(lst,v):
    count = 0
    for i in lst:
        if i < v:
            count += 1
    return count

def minmax(lst):
    min = lst[0]
    max = lst[0]
    for i in lst:
        if i < min:
            min = i
        elif i > max:
            max = i
    return min,max

def main():
    lista = inputFloatList()
    min,max = minmax(lista)    
    valor_medio = lista[int(countLower(lista,max)/2)]
    print("O valor médio é",valor_medio)
    print("Há",countLower(lista,valor_medio),"números menores que o valor médio")

main()