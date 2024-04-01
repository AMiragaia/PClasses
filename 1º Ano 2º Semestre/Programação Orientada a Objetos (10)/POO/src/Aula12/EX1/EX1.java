package Aula12.EX1;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashSet;

import java.util.Scanner;

public class EX1 {

    public static void main(String[] args) throws FileNotFoundException {
        Scanner sc = new Scanner(new FileInputStream("C:\\Users\\andre\\UA\\POO\\POO\\src\\Aula12\\EX1\\text.txt"));
        sc.useDelimiter("[\\t\\n\\r.,:'‘’;?!-*{}=+&/()\\[\\]”“\"\\' ]+");
        HashSet<String> words = new HashSet<>();
        int count = 0;
        while (sc.hasNext()) {
            String word = sc.next();
            words.add(word);
            count++;
            
            
        }
        System.out.println("Número Total de Palavras: " + count);
        System.out.println("Número Total de Diferentes Palavras: " + words.size());
        
    }
}
