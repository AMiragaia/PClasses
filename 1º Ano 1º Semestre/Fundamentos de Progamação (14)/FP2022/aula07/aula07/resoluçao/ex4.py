def main():
    equipas = []
    resultado = {}
    equipa = input("Nome da equipa: ")
    while equipa != "":
        equipas.append(equipa)
        equipa = input("Nome da equipa: ")
    

    for i in range(len(equipas)):
        for j in range(i+1, len(equipas)):
            resultado1 = int(input("Casa:(" + equipas[i] + ")" ))
            resultado2 = int(input("Visitante:(" + equipas[j] + ")" ))
            resultado[equipas[i], equipas[j]] = (resultado1, resultado2)

    print(resultado)
            





if __name__ == '__main__':
    main()
