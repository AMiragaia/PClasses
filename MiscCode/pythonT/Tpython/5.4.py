def recurse(n, s):
    if n == 0:
        print(s)
    else:
        recurse(n-1, n+s)
recurse(3, 0)

#A função recurse pede dois argumentos e faz a soma entre um todos os valores ate n acima de 0. 