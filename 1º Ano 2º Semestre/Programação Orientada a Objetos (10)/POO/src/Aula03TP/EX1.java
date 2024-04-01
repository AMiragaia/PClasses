package Aula03TP;
import java.util.Scanner;
public class EX1 {
    //Escreva uma função estática para imprimir uma mensagem no écran, precedida da palavra “Aviso!!:”. A mensagem deverá ser passada como argumento da função.
    public static void main(String args[]) {
        
        System.out.println("Aviso!!: " + aviso());
    }
    public static String aviso() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual a mensagem que deseja imprimir?");
        String msg = sc.nextLine();
        sc.close();
        return msg;   
    }
}
