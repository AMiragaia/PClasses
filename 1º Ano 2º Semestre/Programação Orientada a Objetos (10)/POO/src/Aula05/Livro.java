package Aula05;


public class Livro {
    private int id;
    private String titulo;
    private String tipoEmprestimo;
    private static int totalLivros;

    public Livro(String titulo, String tipoEmprestimo) {
        this.titulo = titulo;
        this.tipoEmprestimo = tipoEmprestimo;
        // id starts in 100 and is sequencial
        this.id = 100 + Livro.getTotalLivros();
        Livro.setTotalLivros(Livro.getTotalLivros() + 1);
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTipoEmprestimo() {
        return tipoEmprestimo;
    }

    public void setTipoEmprestimo(String tipoEmprestimo) {
        this.tipoEmprestimo = tipoEmprestimo;
    }

    public static int getTotalLivros() {
        return totalLivros;
    }

    public static void setTotalLivros(int totalLivros) {
        Livro.totalLivros = totalLivros;
    }


    public String getLivros(Utilizador u) {
        return "Livro:" + id + ";" + titulo + ";" + tipoEmprestimo;
    }
    public String toString() {
        return "Livro:" + id + ";" + titulo + ";" + tipoEmprestimo;
    }

    //criar um metodo para indicar a disponibilidade do livro
    public void disponibilidade(String disponibilidade) {
        //declare a array of available books
       if  (disponibilidade.equals(tipoEmprestimo)) {
           System.out.println("Erro: Livro indisponivel ou livro não está em sua posse");
       } else {
           this.tipoEmprestimo = disponibilidade;
       }


    }
    

}
