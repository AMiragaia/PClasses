package Aula06;

import Aula05.Date;

public class Aluno extends Pessoa {
    private int numeroAluno;
    private Date anoIngresso;
    private static int numeroAlunos = 100;
    public Aluno(String nome, int cc, String dataNasc, Date anoIngresso) {
        super(nome, cc, dataNasc);
        this.numeroAluno = numeroAlunos++;
        this.anoIngresso = anoIngresso;

    }
    public Aluno(String nome, int cc, String dataNasc) {
        super(nome, cc, dataNasc);
        this.numeroAluno = numeroAlunos++;
        this.anoIngresso = new Date(dataNasc);
    }

    public int getNumeroAluno() {
        return numeroAluno;
    }

    public void setNumeroAluno(int numeroAluno) {
        this.numeroAluno = numeroAluno;
    }

    public Date getAnoIngresso() {
        return anoIngresso;
    }

    public void setAnoIngresso(Date anoIngresso) {
        this.anoIngresso = anoIngresso;
    }
    @Override public String toString() {
        return "Nome: " + this.getNome() + "\n" + "Numero de aluno: " + this.getNumeroAluno() + "\n" + "Ano de ingresso: " + this.getAnoIngresso();
    }
}

