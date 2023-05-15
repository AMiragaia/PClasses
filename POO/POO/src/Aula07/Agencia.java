package Aula07;
import java.util.ArrayList;
public class Agencia {
    private ArrayList<Alojamento> alojamentos = new ArrayList<Alojamento>();
    private ArrayList<Carro> carros = new ArrayList<Carro>();
    private String nome;
    private String morada;

    public Agencia(String nome, String morada) {
        this.nome = nome;
        this.morada = morada;
    }
    public void adicionarAlojamento(Alojamento alojamento){
        alojamentos.add(alojamento);
    }
    public void adicionarCarro(Carro carro){
        carros.add(carro);
    }
    public String getNome() {
        return nome;
    }
    public String getMorada() {
        return morada;
    }
    public ArrayList<Alojamento> getAlojamentos() {
        return alojamentos;
    }
    public ArrayList<Carro> getCarros() {
        return carros;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public void setMorada(String morada) {
        this.morada = morada;
    }
    public void removeAlojamentoPorCodigo(String codigo) {
        for (Alojamento alojamento : this.alojamentos) {
            if (alojamento.getCode().equals(codigo)) {
                this.alojamentos.remove(alojamento);
                return;
            }
        }
        throw new IllegalArgumentException("alojamento nao encontrado");
    }

    public void removeCarroPorCodigo(String codigo) {
        for (Carro carro : this.carros) {
            if (carro.getCodigo().equals(codigo)) {
                this.carros.remove(carro);
                return;
            }
        }
        throw new IllegalArgumentException("carro nao encontrado");
    }

    public void checkInPorCodigo(String codigo) {
        for (Alojamento alojamento : this.alojamentos) {
            if (alojamento.getCode().equals(codigo)) {
                alojamento.checkIn();
                return;
            }
        }
        throw new IllegalArgumentException("alojamento nao encontrado");
    }

    public void checkOutPorCodigo(String codigo) {
        for (Alojamento alojamento : this.alojamentos) {
            if (alojamento.getCode().equals(codigo)) {
                alojamento.checkOut();
                return;
            }
        }
        throw new IllegalArgumentException("alojamento nao encontrado");
    }

    public void levantarPorCodigo(String codigo) {
        for (Carro carro : this.carros) {
            if (carro.getCodigo().equals(codigo)) {
                carro.levantar();
                return;
            }
        }
        throw new IllegalArgumentException("carro nao encontrado");
    }

    public void entregarPorCodigo(String codigo) {
        for (Carro carro : this.carros) {
            if (carro.getCodigo().equals(codigo)) {
                carro.entregar();
                return;
            }
        }
        throw new IllegalArgumentException("carro nao encontrado");
    }
    
    @Override
    public String toString() {
        return "Agencia{" + "nome=" + nome + ", morada=" + morada + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Agencia other = (Agencia) obj;
        return this.getNome() == other.getNome() && this.getMorada() == other.getMorada() && this.getAlojamentos() == other.getAlojamentos() && this.getCarros() == other.getCarros();
    }
}