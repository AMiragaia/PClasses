#Escreva um programa que peça as notas de duas componentes de avaliação, CTP e CP, e
#calcule a nota final (inteira) de um aluno de Fundamentos de Programação. Se alguma
#componente for inferior à nota mínima, a nota final deve ser o código 66. Se a nota final
#for não for entre 10 e 20, o programa deve pedir as notas de recurso, ATPR e APR, e
#calcular a nova nota final.   Consulte os pesos e regras nas informações da disciplina.

ctp = float(input("Qual a nota de CTP que obteve?"))
cp = float(input("Qual a nota de CP que obteve?"))
nf = 0.36 * ctp + 0.64 * cp
if(cp > 20 or ctp > 20):
            print("Nota de componente > 20 impossivel")
            exit(1)
            
if ctp < 6.5:
    atpr = float(input("Qual foi a sua nota em recurso?"))
    atp = float(input("Qual foi a sua nota em recurso?"))
    print("Nota Final: Código 66")
elif cp < 6.5:
    print("Nota Final: Código 66")   
elif nf < 10:
    atpr = float(input("Qual foi a sua nota em recurso?"))
    atp = float(input("Qual foi a sua nota em recurso?"))
    nf = 0.36 * atpr + 0.64 * atp
else:
    nf = 0.36 * ctp + 0.64 * cp

nota = round(nf)
print("A sua nota é",nota)
