#Escreva um programa que lê um valor1 de temperatura em graus Celsius, converte-o para
#graus Fahrenheit e imprime o resultado na forma "X ºC = Y ºF". A fórmula de
#conversão de graus Célsius (C) para graus Fahrenheit (F) é a seguinte: F = 1.8·C + 32.
#(Também pode experimentar responder no CodeCheck.)

t = float(input("Temperatura (ºC)?" ))
TF = 1.8 * t  + 32
print ( "A temperatura de", t, "ºC")
print ("equivale a", TF, "ºf")