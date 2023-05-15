#Num prédio com R/C e 3 andares e um morador por piso, o elevador sobe e desce 2                                   
#vezes por dia para cada morador. Se cada piso tem uma altura de 3m, quantos km                               
#percorre o elevador por ano? Considere que o elevador viaja à velocidade constante de 1                             
#m/s. Quantas horas esteve o elevador em funcionamento num ano? 

#sobe e desce 2 vezes para cada morador
#so depende do numero total de moradores
#separar o numero de andares por unidades
#numero de pisos adicionais ao res do chao

def main():
    TempoEmDias = int(input("Digite o tempo em dias: "))
    Pisos = int(input("Quantos pisos tem o prédio? "))
    MoradoresPorPiso = int(input("Quantos moradores por piso? "))
    MoradoresTotais = MoradoresPorPiso * Pisos
    AlturaDePisos = int(input("Qual a altura de cada piso? "))
    Vel = int(input("Qual a velocidade?")) #m/s

    DistanciaTotal = TempoEmDias * (Pisos*(Pisos+1)/2) * 2 * MoradoresPorPiso * AlturaDePisos
    HorasDeFuncionamento = (TempoEmDias * ((AlturaDePisos * (2 * MoradoresTotais)) / Vel)) / 3600

    print("Distância total percorrida num ano: ", DistanciaTotal, "\nHoras de funcionamento num ano: ", HorasDeFuncionamento) 



if __name__ == "__main__":
    main()



