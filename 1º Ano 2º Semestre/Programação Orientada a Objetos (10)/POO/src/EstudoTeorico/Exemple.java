import java.util.Scanner;
import java.io.File;
import java.io.FileWriter;
public class Exemple {
    
    public static void main(String[] args) throws Exception {
        Scanner input = new Scanner(new File("POO/src/EstudoTeorico/words.txt"));
        while (input.hasNextLine()) 
            System.out.println(input.nextLine());
        input.close();
        FileWriter carFile = new FileWriter("Cars.txt", true);
        carFile.write("\nBMW");
}
}
