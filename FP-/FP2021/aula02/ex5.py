#Crie um programa que peça a quantidade de litros de combustível de um abastecimento e
#determine o preço a pagar. Considere que o combustível custa 1,40€ por litro e que
#abastecimentos de mais de 40 litros têm um desconto de 10%

c = float(input("Quantos litros de combustivél deseja?" ))
p = 1.40 * c
if c > 40:
    p1 = p * 0.9
else:
    p1 = p
print ("O combustivél custa",p1,"euros.")    