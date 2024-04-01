# Pode correr o programa sem argumentos:
#   python3 shop
# ou passando outros ficheiros de produtos como argumento:
#   python3 shop produtos1.txt ...

def loadDataBase(fname, produtos):
    """Lê dados do ficheiro fname e atualiza/acrescenta a informação num
    dicionário de produtos com o formato {código: (nome, secção, preço, iva), ...}.
    """
    with open(fname, 'r') as f:
        lines = f.readlines()
        for line in lines[1:]:
            line = line.strip()
            line = line.split(';')
            code = line[0]
            name = line[1]
            section = line[2]
            price = float(line[3])
            iva = float(line[4][:-1])/100
            produtos[code] = (name, section, price, iva)

    f.close()
    return produtos



def registaCompra(produtos):
    """Lê códigos de produtos (ou códigos e quantidades),
    mostra nome, quantidade e preço final de cada um,
    e devolve dicionário com {codigo: quantidade, ...}
    """
    compra = {}
    codigo = input("Code? ")
    codigos = codigo.split()
    codigo = codigos[0]
    code_list = []
    for x in produtos.keys():
        code_list.append(x)
    if codigo in code_list:
        compra[codigo] = 0
    
    while True:
        if codigo == "":
            break
        codigo = codigos[0]
        if codigo in code_list:

            if len(codigos) == 2:
                if codigo in produtos:
                    print("%s %s %5.2f" % (produtos[codigo][0], codigos[1], (produtos[codigo][2]+produtos[codigo][2]*produtos[codigo][3])*float(codigos[1])))
                    
                    if codigo == "":
                        break
                    elif codigo not in compra:
                        compra[codigo] = int(codigos[1])
                    elif codigo in compra:
                        compra[codigo] += int(codigos[1])
                    codigo = input("Code? ")
                    codigos = codigo.split()
                else:
                    codigo = input("Code? ")
                    codigos = codigo.split()
            
            
            if len(codigos) == 1:
                if codigo in produtos:
                    print("%s %i %5.2f" % (produtos[codigo][0], 1, produtos[codigo][2]+produtos[codigo][2]*produtos[codigo][3]))  
                    if codigo == "":
                        break
                    elif codigo not in compra:
                        compra[codigo] = 1
                    elif codigo in compra:
                        compra[codigo] += 1
                    codigo = input("Code? ")
                    codigos = codigo.split()
                else:
                    codigo = input("Code? ")
                    codigos = codigo.split()
            
            if len(codigos) > 2:
                codigo = input("Code? ")
                codigos = codigo.split()
        else:
            codigo = input("Code? ")
            codigos = codigo.split()
        
    
    return compra

def fatura(produtos, compra):
    """Imprime a fatura de uma dada compra."""
    total_iva = 0
    total_liquido = 0
    lista = []
    for x in compra:
        #prints the same section only once
        if produtos[x][1] not in lista:
            print(produtos[x][1])
            lista.append(produtos[x][1])
        if len(str(int(produtos[x][3] * 100))) == 1:
            print("%i %s %s %5.2f" % (compra[x], produtos[x][0], "(" + " " + str(int(produtos[x][3] * 100))+ "%" + ")", (produtos[x][2] + produtos[x][2]*produtos[x][3])*compra[x]))
        else:
            print("%i %s %s %5.2f" % (compra[x], produtos[x][0], "(" + str(int(produtos[x][3] * 100))+ "%" + ")", (produtos[x][2] + produtos[x][2]*produtos[x][3])*compra[x]))
         
        total_iva += (produtos[x][2]*produtos[x][3])*compra[x]
        total_liquido += (produtos[x][2] + produtos[x][2]*produtos[x][3])*compra[x]
        
    print("Total Bruto: %5.2f" % (total_liquido - total_iva))
    print("Total IVA: %5.2f" % total_iva)
    print("Total Liquido: %5.2f" % total_liquido)

def main(args):
    # produtos guarda a informação da base de dados numa forma conveniente.
    produtos = {'p1': ('Ketchup.', 'Mercearia Salgado', 1.59, 0.23)}
    # Carregar base de dados principal
    loadDataBase("produtos.txt", produtos)
    # Juntar bases de dados opcionais (Não altere)
    for arg in args:
        loadDataBase(arg, produtos)
    
    
    # Use este código para mostrar o menu e ler a opção repetidamente
    MENU = "(C)ompra (F)atura (S)air ? "
    repetir = True
    dict_compras = {}
    while repetir:
        # Utilizador introduz a opção com uma letra minúscula ou maiúscula
        op = input(MENU).upper()
        # Processar opção
        if op == "C":
            # Esta opção regista os produtos de uma compra
            compra = registaCompra(produtos)
            values_list = []
            values_list.append(compra.values())
            if "" in values_list:
                del compra[""]

            # Aqui pode acrescentar a compra a uma estrutura de dados adequada...
            if len(dict_compras) == 0:
                id = 1
            else:
                id = len(dict_compras) + 1
            code_list = []
            for x in compra:
                code_list.append(x)
            for y in code_list:
                if y not in produtos:
                    del compra[y]
            dict_compras[id] = compra
        # Acrescente outras opções aqui...
        elif op == "F":
            # Esta opção imprime a fatura de uma compra
            numero = input("Numero compra? ")
            fatura(produtos, dict_compras[int(numero)])
        elif op == "S":
            # Terminar o programa
            repetir = False
       

    print("Obrigado!")


# Não altere este código / Do not change this code
import sys
if __name__ == "__main__":
    main(sys.argv[1:])