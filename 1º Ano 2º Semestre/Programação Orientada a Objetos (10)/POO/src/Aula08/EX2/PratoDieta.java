package Aula08.EX2;

public class PratoDieta extends Prato {
    private double maxcalorias;

    public PratoDieta(String nome, double maxcalorias) {
        super(nome);
        this.maxcalorias = maxcalorias;
        
    }
    public double getMaxcalorias() {
        return maxcalorias;
    }
    
}
