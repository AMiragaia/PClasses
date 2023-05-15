package Aula11.EX2;

import java.util.HashMap;
import java.util.Scanner;
import java.io.FileReader;
import java.io.IOException;

public class Voo {
    private String hora;
    private String id;
    private String companhia;
    private String origem;
    private String atraso;
    private String obs;
    private static HashMap<String, String> companhias = new HashMap<>();


    public Voo(String hora, String id, String origem, String atraso) throws IOException {
        this.hora = hora;
        this.id = id;
        this.origem = origem;
        this.atraso = atraso;
        this.companhia = companhias.get(id.substring(0, 2));
        this.obs = "";

    }

    public String getHora() {
        return hora;
    }

    public String getId() {
        return id;
    }

    public String getCompanhia() {
        return companhia;
    }

    public String getOrigem() {
        return origem;
    }

    public String getAtraso() {
        return atraso;
    }

    public String getObs() {
        return obs;
    }
   
    @Override
    public String toString() {
        return String.format(this.hora, this.id, this.companhia, this.origem, this.atraso, this.obs);
    }


}
    
        
   
    
    

    