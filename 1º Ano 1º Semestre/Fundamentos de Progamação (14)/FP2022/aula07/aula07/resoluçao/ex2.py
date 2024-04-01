# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {}".format("Numero", "Nome"))
    for num in dic:
        print("{:>12s} : {}".format(num, dic[num]))

def filterPartName(contacts, partName):
    """Returns a new dict with the contacts whose names contain partName."""
    newDict = {}
    for num in contacts:
        if partName in contacts[num]:
            newDict[num] = contacts[num]
    return newDict

def addContact(contacts):
    contact = input("Nome do contacto: ")
    number = input("Número do contacto: ")
    contacts[number] = contact

def removeContact(contacts):
    number = input("Número do contacto: ")
    if number in contacts:
        del contacts[number]
    else:
        print("Contacto não existe!")

def searchContact(contacts):
    number = input("Número do contacto: ")
    if number in contacts:
        print("Contacto:", contacts[number]) 
    else:
        print("Contacto não existe!")

def menu():
    """Shows the menu and gets user option."""
    print()
    print("(L)istar contactos")
    print("(A)dicionar contacto")
    print("(R)emover contacto")
    print("Procurar (N)úmero")
    print("Procurar (P)arte do nome")
    print("(T)erminar")
    op = input("opção? ").upper()   # converts to uppercase...
    return op


def main():
    """This is the main function containing the main loop."""

    # The list of contacts (it's actually a dictionary!):
    contactos = {"234370200": "Universidade de Aveiro",
        "727392822": "Cristiano Aveiro",
        "387719992": "Maria Matos",
        "887555987": "Marta Maia",
        "876111333": "Carlos Martins",
        "433162999": "Ana Bacalhau"
        }

    op = ""
    while op != "T":
        op = menu()
        if op == "T":
            print("Fim")
        elif op == "A":
            addContact(contactos)
        elif op == "R":
            removeContact(contactos)
        elif op == "N":
            searchContact(contactos)
        elif op == "L":
            print("Contactos:")
            listContacts(contactos)
        else:
            print("Não implementado!")
    

# O programa começa aqui
main()
