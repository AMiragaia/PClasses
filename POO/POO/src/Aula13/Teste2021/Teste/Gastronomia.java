package Teste;

import java.util.List;
import java.util.Collection;
import java.util.ArrayList;

public class Gastronomia extends Atividade  {
    private List<Restaurante> restaurantes = new ArrayList<>();
    public Gastronomia(int numero, String nome, List<Restaurante> restaurantes) {
        
        super(numero, nome);
        for (Restaurante restaurante : restaurantes) {
            this.restaurantes.add(restaurante);
        }
    }
    public Gastronomia(int numero, String nome) {
        super(numero, nome);
    }
    
    public List<Restaurante> getLista() {
        return restaurantes;
    }
    public void setLista(List<Restaurante> restaurantes) {
        this.restaurantes = restaurantes;
    }
    
    @Override
    public Collection<String> locais() {
        Collection<String> locais = new ArrayList<>();
        for (Restaurante restaurante : restaurantes) {
            locais.add(restaurante.toString());
        }
        return locais;
    }
    

    public int totalRestaurantes(){
        return restaurantes.size();
    }

    public void add(Restaurante restaurante){
        restaurantes.add(restaurante);
    }

}

    
    
