package Aula07;

public class Apartamento extends Alojamento {

    private int numeroQuartos;

    public Apartamento(String codigo, String nome, String localizacao, double precoNoite, boolean disponibilidade, double avaliação, int numeroQuartos) {
        super(codigo, nome, localizacao, precoNoite, disponibilidade, avaliação);
        this.numeroQuartos = numeroQuartos;
    }

    public int getNumeroQuartos() {
        return numeroQuartos;
    }

    public void setNumeroQuartos(int numeroQuartos) {
        this.numeroQuartos = numeroQuartos;
    }
    
}