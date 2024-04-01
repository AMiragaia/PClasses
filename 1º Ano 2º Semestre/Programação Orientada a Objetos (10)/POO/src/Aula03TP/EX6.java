package Aula03TP;
import java.util.Scanner;
public class EX6 {
    //Escreva uma função estática para, dada umaString, conte e retorne o número de ocorrências do caráter ‘Z’
    public static void main(String[] args) {
        System.out.println("O número de ocorrências do caráter Z é: " + contaZ());
    }
    public static int contaZ() {
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual a string?");
        String x = sc.nextLine();
        int conta = 0;
        for (int i = 0; i < x.length(); i++) {
            if ((x.charAt(i) == 'Z') || (x.charAt(i) == 'z')) {
                conta++;
            }
        }
        sc.close();
        return conta;
    }
}
