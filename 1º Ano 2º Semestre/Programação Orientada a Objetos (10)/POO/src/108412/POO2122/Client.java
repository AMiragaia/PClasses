

public class Client {
    public Client(String nome , String localidade){
        this.nome = nome;
        this.localidade = localidade;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getLocalidade() {
        return localidade;
    }
    public void setLocalidade(String nome) {
        this.localidade = localidade;
    }
    private String nome;
    private String localidade;
    
    @Override
    public void toString(){

    }
}
