package Aula05;
import java.util.ArrayList;

public class EX5 {
    //Utilizando as classes desenvolvidas no exercicio anterior, crie um programa que permita gerir os emprestimos de livros e utilizadores.
    // deve ser usado um menu para o utilizador escolher entre:
    // 1 - Adicionar um utilizador
    // 2 - Remover um utilizador
    // 3 - imprimir lista de utilizadores
    // 4 - registar um novo livro
    // 5 - imprimir lista de livros
    // 6 - emprestimo de livro
    // 7 - devolução de livro
    // 8 - sair
    //as operações de empréstimo e devolução sejam efetuadas com base no ID do livro e no número mecanográfico do aluno
    //existem 100 livros e 100 utilizadores
    //so existe 1 exemplar de cada livro
    public static void main(String[] args) {
        int opcao = 0;
        ArrayList<Utilizador> alunos = new ArrayList<>();
        ArrayList<Livro> livros = new ArrayList<>();
        do {  
            System.out.println("Escolha uma opção:");
            System.out.println("1 - Inscrever um utilizador");
            System.out.println("2 - Remover um utilizador");
            System.out.println("3 - imprimir lista de utilizadores");
            System.out.println("4 - registar um novo livro");
            System.out.println("5 - imprimir lista de livros");
            System.out.println("6 - emprestimo de livro");
            System.out.println("7 - devolução de livro");
            System.out.println("8 - sair");
            opcao = Integer.parseInt(System.console().readLine());
            switch (opcao) {
                case 1:
                    //inscrever um utilizador
                    System.out.println("Digite o nome do utilizador:");
                    String utilizador = System.console().readLine();
                    System.out.println("Digite o numero de mecanografico do utilizador:");
                    int nMec = Integer.parseInt(System.console().readLine());
                    System.out.println("Digite o curso do utilizador:");
                    String curso = System.console().readLine();
                    Utilizador u = new Utilizador(utilizador, nMec, curso);
                    alunos.add(u);
                    break;
                case 2:
                    //remover um utilizador com base no numero de mecanografico
                    System.out.println("Digite o numero de mecanografico do utilizador:");
                    nMec = Integer.parseInt(System.console().readLine());
                    for (int i = 0; i < alunos.size(); i++) {
                        if (alunos.get(i).getnMec() == nMec) {
                            alunos.remove(i);
                        }
                    }
                    break;
                case 3:         
                    //imprimir lista de utilizadores
                    for (Utilizador u3 : alunos) {
                        System.out.println(u3.toString());
                    }
                    break;
                case 4:
                    //registar um novo livro
                    System.out.println("Digite o nome do livro:");
                    String nome = System.console().readLine();
                    System.out.println("Digite o tipo de emprestimo do livro:");
                    String tipoEmprestimo = System.console().readLine();

                    Livro l = new Livro(nome, tipoEmprestimo);
                    livros.add(l);
                    break;
                case 5:
                    for (Livro l2 : livros) {
                        System.out.println(l2.toString());
                        
                    }
                    break;
                case 6:
                    //emprestimo de livro
                    System.out.println("Digite o numero de mecanografico do utilizador:");
                    nMec = Integer.parseInt(System.console().readLine());
                    System.out.println("Digite o id do livro:");
                    int id = Integer.parseInt(System.console().readLine());
                    for (int i = 0; i < alunos.size(); i++) {
                        if (alunos.get(i).getnMec() == nMec) {
                            for (int j = 0; j < livros.size(); j++) {
                                if (livros.get(j).getId() == id) {
                                    alunos.get(i).guardarLivro(livros.get(j));
                                    livros.get(j).setTipoEmprestimo("CONDICIONAL");
                                }
                            }
                        }
                    }
                    
                    break;
                case 7:
                    //devolução de livro
                    System.out.println("Digite o numero de mecanografico do utilizador:");
                    nMec = Integer.parseInt(System.console().readLine());
                    System.out.println("Digite o id do livro:");
                    id = Integer.parseInt(System.console().readLine());
                    for (int i = 0; i < alunos.size(); i++) {
                        if (alunos.get(i).getnMec() == nMec) {
                            for (int j = 0; j < livros.size(); j++) {
                                if (livros.get(j).getId() == id) {
                                    alunos.get(i).devolverLivro(livros.get(j));
                                    livros.get(j).setTipoEmprestimo("NORMAL");
                                }
                            }
                        }
                    }

                case 8:
                    //sair
                    break;
                default:
                    System.out.println("Opção inválida");
                    break;
            }
        } while (opcao != 8);
    }
}
  

    
