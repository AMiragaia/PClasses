package Teste;

import java.util.Collection;
import java.util.Set;
import java.util.TreeSet;

public class PasseioBicicleta extends Atividade  {
    private Set<String> locais = new TreeSet<>();

    public PasseioBicicleta(int numero, String nome, String[] locais) {
        super(numero, nome);
        for (String local : locais) {
            this.locais.add(local);
        }
    }
    public PasseioBicicleta(int numero, String nome) {
        super(numero, nome);  
    }

    public Set<String> getRestaurantes() {
        return locais;
    }
    public void setRestaurantes(Set<String> locais) {
        this.locais = locais;
    }

    
    @Override
    public Collection<String> locais() {
        return locais;
    }

    public void addLocal(String local){
        locais.add(local); 
        
    }
    
}
