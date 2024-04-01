# This program outputs the age category for a given input age.
# It has a semantic error.  Can you find it?
# Which values of age produce the output "adult"?
# Correct the error.
# Can you simplify the code to avoid redundant conditions?
#Execute o programa age.py e teste-o com vários valores de entrada. Analise o
#código-fonte para perceber como funciona. Consegue detetar o erro semântico? Que
#valores de age produzem a categoria "grown-up"? Corrija o erro. Consegue
#reescrever o código com uma instrução if-elif-else? Tente simplificar o código
#para eliminar condições redundantes.

age = int(input("Age? "))

if age < 0:
    print("ERROR: invalid age!")
    exit(1)     # this terminates the program

print("Age:", age)

if age < 13 :
    cat = "child"
elif 13 <= age < 20:
    cat = "teenager"
else:
    cat = "adult"

print("Category:", cat)

