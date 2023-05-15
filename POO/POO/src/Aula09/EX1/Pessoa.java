package Aula09.EX1;
import Aula07.Date;

public class Pessoa {
    private String nome;
    private int cc;
    private Date dataNasc;
    public Pessoa(String nome, int cc, Date dataNasc) {
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

    public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        assert dataNasc != null;
        this.dataNasc = dataNasc;
    }
    @Override public String toString() {
        return "Pessoa{" + "nome=" + nome + ", cc=" + cc + ", dataNasc=" + dataNasc + '}';
    }


    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;

        final Pessoa other = (Pessoa) obj;
        return this.cc == other.cc && this.nome.equals(other.nome) && this.dataNasc.equals(other.dataNasc);
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((dataNasc == null) ? 0 : dataNasc.hashCode());
        result = prime * result + cc;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        return result;
    }

}