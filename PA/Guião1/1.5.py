#Pretende-se construir um sistema de informação simplificado para a gestão da biblioteca de uma
#universidade. A biblioteca contém um catálogo de livros e um conjunto de utilizadores (só alunos).
#Como primeiro passo pretende-se criar Classes para Livros e Alunos.
#Considerando que:
#Todos os alunos são identificados pelo seu número mecanográfico, nome e curso;
#Os livros são caraterizados por um ID (numérico e sequencial, começando em 100), título e
#tipo de empréstimo (CONDICIONAL ou NORMAL).
#Desenvolva as classes Livro e Aluno e teste-as com o programa seguinte

class Livro:
    __livrosNormais = []
    __livrosCondicionais = []
    __id = 100
    def __init__(self, titulo, tipoEmprestimo="NORMAL"):
        self.__id = Livro.__id
        Livro.__id += 1
        self.__titulo = titulo
        self.__tipoEmprestimo = tipoEmprestimo
    def getId(self):
        return self.__id
    def getTitulo(self):
        return self.__titulo
    def getTipoEmprestimo(self):
        return self.__tipoEmprestimo
    def setTipoEmprestimo(self, tipoEmprestimo):
        self.__tipoEmprestimo = tipoEmprestimo
    def __str__(self):
        return f"Livro {self.__id}: {self.__titulo}, {self.__tipoEmprestimo}"
    def __repr__(self):
        return f"Livro({self.__titulo}, {self.__tipoEmprestimo})"
    def _livrosCondicionais():
        return Livro.__livrosCondicionais
    def _livrosNormais():
        return Livro.__livrosNormais


    
class Aluno:
    def __init__(self, nome, num_mec, curso):
        self.__nome = nome
        self.__num_mec = num_mec
        self.__curso = curso
    def get_nome(self):
        return self.__nome
    def get_num_mec(self):
        return self.__num_mec
    def get_curso(self):
        return self.__curso
    def set_nome(self, nome):
        self.__nome = nome
    def set_num_mec(self, num_mec):
        self.__num_mec = num_mec
    def set_curso(self, curso):
        self.__curso = curso
    def __str__(self):
        return f"Aluno : {self.__num_mec};{self.__nome};{self.__curso}"
    def __repr__(self):
        return f"Aluno({self.__nome}, {self.__num_mec}, {self.__curso})"


def main():
    livro1= Livro("Java 8", "CONDICIONAL");
    print(livro1)
    catalogo=[]
    catalogo.append(livro1)
    catalogo.append(Livro("POO em Java 8"))
    catalogo.append(Livro("Java para totós", "NORMAL"))
    print(f"ID = {catalogo[1].getId()} Título = { catalogo[1].getTitulo()}")
    catalogo[2].setTipoEmprestimo("CONDICIONAL")
    for livro in catalogo:
        print(livro)
    # Alunos
    utilizadores=[]
    utilizadores.append(Aluno("Catarina Marques", 80232, "MIEGI"))
    utilizadores.append(Aluno("Joao Silva", 90123, "Lic Física"))
    utilizadores[1].set_num_mec(80123)
    utilizadores.append(Aluno("António Costa", 100123, "Lic Matemática"))
    for aluno in utilizadores:
        print(aluno)
main()