package Aula08.EX2;

public class Carne extends Alimento {
    private VariedadeCarne variedadeCarne;

    public Carne(double proteinas, double calorias, double peso, VariedadeCarne variedadeCarne) {
        super(proteinas, calorias, peso);
        this.variedadeCarne = variedadeCarne;
    }
    public String getVarieadeCarne() {
        return  variedadeCarne.toString();
    }
    public void setVarieade(VariedadeCarne variedadeCarne) {
        this.variedadeCarne = variedadeCarne;
    }
    @Override
    public String toString() {
        return "Carne " + this.getVarieadeCarne() + ", Proteinas " + this.getProteinas() + ", calorias " + this.getCalorias() + ", Peso " + this.getPeso();
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        Carne other = (Carne) obj;
        return super.equals(obj) && this.getVarieadeCarne().equals(other.getVarieadeCarne());
    }
    
}
