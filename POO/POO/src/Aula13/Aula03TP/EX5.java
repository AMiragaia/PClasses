package Aula03TP;
import java.util.Scanner;
public class EX5 {
    //Escreva uma função estática para ler do teclado um número real entre 0 e 10
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual o valor de x?");
        double x = sc.nextDouble();
        while (x < 0 || x > 10) {
            System.out.println("O valor de x deve estar entre 0 e 10!");
            System.out.println("Qual o valor de x?");
            x = sc.nextDouble();
            
        }
        System.out.println("O valor de x é: " + x);
        sc.close();
        
    }
}
