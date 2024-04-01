package Aula03TP;
import java.util.Scanner;
public class EX4 {
    //Escreva uma função estática para ler do teclado um número inteiro positivo
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual o valor de x?");
        int x = sc.nextInt();
        while (x < 0) {
            System.out.println("O valor de x deve ser positivo!");
            System.out.println("Qual o valor de x?");
            x = sc.nextInt();
            
        }
        System.out.println("O valor de x é: " + x);
        sc.close();
    }
    
}
