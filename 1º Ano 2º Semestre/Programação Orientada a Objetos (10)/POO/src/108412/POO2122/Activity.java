
import java.util.ArrayList;
import java.util.List;

public abstract class Activity  {
    private List<Client> participantes = new ArrayList<>();
    private int preco;
    private Option opcao;
    public Activity(int preco, Option opcao, ArrayList<Client> participantes){
        this.preco = preco;
        this.opcao = opcao;
        this.participantes = participantes;
        
    }
    public int getPreco() {
        return preco;
    }
    public void setPreco(int preco) {
        this.preco = preco;
    }
    public List<Client> getParticipantes(){
        return participantes;
    }
    public void setParticipantes(List<Client> participantes){
        this.participantes = participantes;
    }
    public Option getOpcao(){
        return opcao;
    }
    public void setOpcao(Option opcao){
        this.opcao = opcao;
    }
    
    @Override
    public String toString() {
        return "";
    }

  
    
}
