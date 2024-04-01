package Aula06;

public class Pessoa {
    private String nome;
    private int cc;
    private String dataNasc;
    public Pessoa(String nome, int cc, String dataNasc) {
        assert nome != null && cc > 0 && dataNasc != null;
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        assert nome != null;
        this.nome = nome;
    }

    public int getCc() {
        return cc;
    }

    public void setCc(int cc) {
        assert cc > 0;
        this.cc = cc;
    }

    public String getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(String dataNasc) {
        assert dataNasc != null;
        this.dataNasc = dataNasc;
    }
    @Override public String toString() {
        return "Pessoa{" + "nome=" + nome + ", cc=" + cc + ", dataNasc=" + dataNasc + '}';
    }
}





        