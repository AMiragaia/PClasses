#Um automóvel faz uma viagem entre duas cidades com velocidade média v1 e regressa
#pelo mesmo percurso com velocidade média v2. Escreva um programa que peça os dois
#valores, v1 e v2, e calcule e imprima a velocidade média da viagem completa. Note que
#a velocidade média é dada pela razão entre a distância total percorrida e o tempo total,
#v=d/t. Sugestão: analise e calcule um ou dois exemplos no papel antes de avançar com
#o programa. A solução não é tão óbvia como parece!
#(Tente responder também no CodeCheck.)
v1 = float(input("Qual a velocidade do primeiro percurso?" ))
v2 = float(input("Qual a velocidade do segundo percurso?" ))
vm = (2*v1*v2)/(v1+v2)
print("v1:",v1, "v2:",v2, "vm:", vm)
