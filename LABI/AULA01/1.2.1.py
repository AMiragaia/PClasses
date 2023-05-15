from unicodedata import name


name = input("variavel")
f = open(name, "rb")
buffer = f.read(512)

while len(buffer) > 0:

    buffer = f.read(512)
print(buffer)