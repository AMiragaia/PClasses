package Aula03TP;
import java.util.Scanner;

public class EX2 {
    //Escreva uma função estática para, dado um valor real x, calcular e devolver o valor de 2*x2
    public static void main(String[] args) {
        System.out.println("O valor de 2x^2 é: " + dobroquadrado(2));
    }
    public static double dobroquadrado(double x) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual o valor de x?");
        double x1 = sc.nextDouble();
        sc.close();
        x = 2*x1*x1;
        return x;
    }
}
