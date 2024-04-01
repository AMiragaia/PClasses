package Teste;
public class Restaurante {
    public Restaurante(String nome, TipoComida comida) {
        this.nome = nome;
        this.comida = comida;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public TipoComida getTipo() {
        return comida;
    }
    public void setTipo(TipoComida comida) {
        this.comida = comida;
    }
    private String nome;
    private TipoComida comida;
    
    @Override
    public String toString() {
        return "Restaurante{" + "nome=" + nome + ", tipo=" + comida.toString() + '}';
    }
    
    
}
