package Aula05;

public class Utilizador {
    
    private String nome;
    private int nMec;
    private String curso;
    int[] idLivrosS= new int[3];
    public Utilizador(String nome, int nMec, String curso) {
        this.nome = nome;
        this.nMec = nMec;
        this.curso = curso;
    }
    
    public String getNome() {
        return nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public int getnMec() {
        return nMec;
    }
    
    public void setnMec(int nMec) {
        this.nMec = nMec;
    }
    
    public String getCurso() {
        return curso;
    }
    
    public void setCurso(String curso) {
        this.curso = curso;
    }
    
    public String toString() {
        return "Aluno:" + nMec + ";" + nome + ";" + curso;
    }
    public String emprestarLivro(Livro l) {
        return "Livro:" + l.getId() + ";" + l.getTitulo() + ";" + l.getTipoEmprestimo();
    }
    public String devolverLivro(Livro l) {
        return "Livro:" + l.getId() + ";" + l.getTitulo() + ";" + l.getTipoEmprestimo();
    }
    //metodo que guarda os livros requesitados pelo utilizador
    //metodo que garante um maximo de  3 livros requesitados pelo utilizador
    public void guardarLivro(Livro l) {
        //guarda o id do livro requesitado
        for (int i = 0; i < idLivrosS.length; i++) {
            if (idLivrosS[i] == 0){
                idLivrosS[i] = l.getId();
                break;  
            }
        }   
    }
}
