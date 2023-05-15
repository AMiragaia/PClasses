package Aula10TP;
import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;

public class ReadFile {
    public static void main(String[] args) throws FileNotFoundException {
        List<Integer> numeros = new ArrayList<Integer>();
        int x = 0;
        int y = 0;
        try {
            File file = new File("POO/src/Aula10TP/teste.txt");
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] parts = line.split(" ");
                while (x < parts.length) {
                    numeros.add(Integer.parseInt(parts[x])); 
                    x++;
                }
                x = 0;
                for (int i = 0; i < numeros.size(); i++) {
                    y += numeros.get(i);
                }   
            }
            scanner.close();
            Collections.sort(numeros);
            System.out.println(numeros); 
            System.out.println(y/numeros.size());
            System.out.println(numeros.get(0));
            System.out.println(numeros.get(numeros.size()-1));
        } catch (FileNotFoundException e) {
            System.out.println("File not found");
        }
        //write numeros in a file
        try {
            FileWriter fileWriter = new FileWriter("teste1.txt");
            for (int i = 0; i < numeros.size(); i++) {
                fileWriter.write(numeros.get(i) + " ");
            }
            fileWriter.close();
        } catch (Exception e) {
            System.out.println("Error writing file");
        }
    }
}
