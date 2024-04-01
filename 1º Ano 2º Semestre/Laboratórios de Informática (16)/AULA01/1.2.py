import hashlib
t = input("Qual o nome do ficheiro que deseja encriptar?" )
f = open(t)
e = f.read(512)
h = hashlib.sha512()
h.update(e.encode("utf-8") )
print(h.hexdigest())