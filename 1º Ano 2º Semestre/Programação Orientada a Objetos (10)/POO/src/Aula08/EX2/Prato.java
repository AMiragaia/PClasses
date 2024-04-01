package Aula08.EX2;
import java.util.ArrayList;
public class Prato {
    private String nome;
    private ArrayList<Alimento> composição;

    public Prato(String nome) {
        this.nome = nome;
        this.composição = new ArrayList<>();
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public ArrayList<Alimento> getComposição() {
        return composição;
    }
    public void setComposição(ArrayList<Alimento> composição) {
        this.composição = composição;
    }
    public boolean addAlimento(Alimento alimento) {
        return this.composição.add(alimento);
    }
    @Override
    public String toString() {
        return "Prato{" + "nome=" + nome + ", composição=" + composição + '}';
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        Prato other = (Prato) obj;
        return this.getNome().equals(other.getNome()) && this.getComposição().equals(other.getComposição());
    }
}
