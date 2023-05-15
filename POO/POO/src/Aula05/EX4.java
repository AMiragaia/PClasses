package Aula05;
import java.util.ArrayList;
public class EX4 {
        public static void main(String[] args) {
            // Para o conjunto de Livros vamos criar um vetor de 10 posições
            // Este vetor tem uma dimensão fixa pelo que se for necessário guardar
            // mais livros, teremos de criar um vetor de maior dimensão.
            Livro catalogo[] = new Livro[10];
            catalogo[0] = new Livro(" Java 8" , " CONDICIONAL");
            catalogo[1] = new Livro(" POO em Java 8", " NORMAL");
            catalogo[2] = new Livro(" Java para totós", " CONDICIONAL");
            catalogo[0].setId(100);
            catalogo[1].setId(101);
            catalogo[2].setId(102);
            System.out.println("ID = " + catalogo[1].getId() + ", "+ catalogo[1].getTitulo());
            catalogo[2].setTipoEmprestimo(" CONDICIONAL");
            for (int i = 0; i < catalogo.length; i++) { // usando o indice do vector
            if (catalogo[i] != null) // porque o vector catalogo não está cheio
                System.out.println("Livro " + catalogo[i].getId() + ";" + catalogo[i].getTitulo() + ";" + catalogo[i].getTipoEmprestimo());
                
            }
            // Para o conjunto de utilizadores usamos a classe java.util.ArrayList
            // É uma implementação de um vetor com tamanho variável
            
            ArrayList<Utilizador> alunos = new ArrayList<>();
            alunos.add(new Utilizador(" Catarina Marques ", 80232, " MIEGI"));
            alunos.add(new Utilizador(" Joao Silva ", 90123, " LEI"));
            alunos.get(1).setnMec(80123);
            alunos.get(1).setCurso(" LEI");
            alunos.get(1).setNome(" Joao Silva"); 
            for (int i = 0; i < alunos.size(); i++) { // usando o indice do vector
                if (alunos.get(i) != null) // porque o vector alunos não está cheio
                    System.out.println(alunos.get(i));
            }
    }
}

//the output of the program should be:
//ID = 101, POO em Java 8
//Livro 100; Java 8; CONDICIONAL
//Livro 101; POO em Java 8; NORMAL
//Livro 102; Java para totós; CONDICIONAL
//Aluno: 80232; Catarina Marques; MIEGI
//Aluno: 80123; Joao Silva; LEI
