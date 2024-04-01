def fibonacci(n):
    res = []    
    if n < 0:
        return res


def teste1():
    if fibonacci(0) == [0] and fibonacci(-1) == []:
        print("Teste OK")
    else:
        print("Teste Falhou")

# test_fibonacci.py
import pytest
#from fibonacci import fibonacci
def test_inferior_1():
    print("Testa comportamento com n < 1")
    assert fibonacci(-1) == []
    assert fibonacci(0) == [0]

def main():
    fibonacci(5)
    teste1()
    test_inferior_1()