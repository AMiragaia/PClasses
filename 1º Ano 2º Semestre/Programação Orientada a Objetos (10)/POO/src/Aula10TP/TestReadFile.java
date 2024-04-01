package Aula10TP;
import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;
public class TestReadFile {

	public static void main(String[] args) throws FileNotFoundException {
        try {
            File file = new File("C:\\Users\\User\\Desktop\\teste.txt");
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                System.out.println(line);
            }
            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("File not found");
        }
	}
    
}
