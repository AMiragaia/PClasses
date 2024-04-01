package Aula04;
import java.util.Scanner;
public class EX3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String input, acronim = "";
        String[] frase;
        System.out.println("Escreva uma frase:");
        input = sc.nextLine();
        sc.close();
        frase = input.split(" ");
        for(int i = 0; i < frase.length; i++){
            if(frase[i].length() > 3){
                acronim += frase[i].charAt(0);
            }
        }
        System.out.printf("Acrónimo: %s\n", acronim);
    
    }
    
}
