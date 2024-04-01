package Aula11.EX1;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;
import java.io.File;


//depois dar fix aos acentos
public class LerTexto{
    public static void main(String[] args) throws IOException {
        //reads a file and prints it's content
        ArrayList<String> palavras = new ArrayList<>();
        Map<String, Map<String, Integer>> map = new TreeMap<>();
        loadFile(palavras, "POO/POO/src/Aula11/EX1/major.txt");

        
        for (int i = 0; i < palavras.size() - 1; i++) {
            String word = palavras.get(i);
            String nextWord = palavras.get(i + 1);
            if (map.containsKey(word)) {
                Map<String, Integer> map_temporario = map.get(word);
                if (map_temporario.containsKey(nextWord)) {
                    map_temporario.put(nextWord, map_temporario.get(nextWord) + 1);
                } else {
                    map_temporario.put(nextWord, 1);
                }
            } else {
                Map<String, Integer> map_temporario = new TreeMap<>();
                map_temporario.put(nextWord, 1);
                map.put(word, map_temporario);
            }
        }
        

        for(String key : map.keySet()) {
            System.out.print(key + "={");
            for(String key2 : map.get(key).keySet()) {
                System.out.print(key2 + "=" + map.get(key).get(key2));
                if(!key2.equals(map.get(key).keySet().toArray()[map.get(key).keySet().size() - 1])) {
                    System.out.print(", ");
                }
        }
        System.out.println("}");

    }
    }
    public static void loadFile(ArrayList<String> file, String caminho) throws IOException {
        Scanner input = new Scanner(new File(caminho), "UTF-8").useDelimiter("[\\t\\n\\.\\,\\:\\'\\‘\\’\\;\\?\\!\\-\\*\\{\\}\\=\\+\\&\\/\\\\(\\)\\[\\]\\”\\“\\\"\\']");
            String palavras = "";
            while (input.hasNext()) {
                palavras = palavras + " " + input.next();

        }
        
        for (String palavra : palavras.toLowerCase().split(" ")) {
            if (palavra.length() > 2) {
                file.add(palavra);
            }
        }
    }
}

