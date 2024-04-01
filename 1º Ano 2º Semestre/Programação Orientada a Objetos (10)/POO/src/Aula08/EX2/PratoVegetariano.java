package Aula08.EX2;
import java.util.ArrayList;
public class PratoVegetariano extends Prato implements Vegetariano {
    private ArrayList<Vegetariano> composição;

    public PratoVegetariano(String nome) {
        super(nome);
        this.composição = new ArrayList<>();
    }

    @Override
    public void setComposição(ArrayList<Alimento> composição) {
        this.composição = new ArrayList<>();
    }

    public void addComposição(Vegetariano alimento) {
        this.composição.add(alimento);
    }
    @Override
    public String toString() {
        return "PratoVegetariano{" + "composição=" + composição + '}';
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        PratoVegetariano other = (PratoVegetariano) obj;
        return this.getComposição().equals(other.getComposição());
    }
    
}
