#Um livro custa 20€ a fabricar (PF). Suponha que o preço de capa de um livro é 24,95€
#(PC) e que o mesmo paga uma taxa de IVA de 23% (IMP). Acresce sobre o valor do
#livro uma taxa para compensar os autores pelas cópias de 0,20€ fixos (SPA).
#PC = (PF + Lucro) * (100% + IMP) + SPA
#Para uma tiragem de 500 exemplares: qual o lucro da livraria? Quanto foi coletado em
#impostos? Que quantia de taxas é que foi reunida?

PF = 20 #preço de fabrico
PC = 24.95 #preço de capa
IMP = 0.23 #imposto
SPA = 0.20 #taxa para compensar os autores
T = 500 #número de exemplares
Lucro = PC - PF 
Lucro = (PF + Lucro) * (100% + IMP) + SPA
print(Lucro)