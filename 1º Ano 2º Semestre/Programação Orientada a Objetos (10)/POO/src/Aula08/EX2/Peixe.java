package Aula08.EX2;

public  class Peixe extends Alimento {
    private TipoPeixe TipoPeixe;

    public Peixe(double proteinas, double calorias, double peso, TipoPeixe TipoPeixe) {
        super(proteinas, calorias, peso);
        this.TipoPeixe = TipoPeixe;
    }
    public TipoPeixe getTipoPeixe() {
        return TipoPeixe;
    }
    public void setTipo(TipoPeixe TipoPeixe) {
        this.TipoPeixe = TipoPeixe;
    }

    @Override
    public String toString() {
        return "Peixe " + this.getTipoPeixe() + ", Proteinas " + this.getProteinas() + ", calorias " + this.getCalorias() + ", Peso " + this.getPeso();
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        Peixe other = (Peixe) obj;
        return super.equals(obj) && this.getTipoPeixe
        ().equals(other.getTipoPeixe());
    }
    
}
