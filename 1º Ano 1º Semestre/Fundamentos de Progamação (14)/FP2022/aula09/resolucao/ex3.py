"""
Complete a função para devolver a mediana da lista de valores lst.
A função não deve modificar a lista.
Se a lista tiver um número ímpar de valores,
a mediana é o valor no meio da lista ordenada.
Se a lista tiver um número par de valores,
a mediana é a média dos dois valores no meio da lista ordenada.
"""

def median(lst):
    assert len(lst) > 0
    lst.sort()
    if len(lst) % 2 == 0:
        return (lst[len(lst) // 2] + lst[len(lst) // 2 - 1]) / 2
    else:
        return lst[len(lst) // 2]
    

def check(lst):
   backup = lst.copy()
   m = median(lst)
   return m, lst

print(check([1, 2, 3, 4, 5]))