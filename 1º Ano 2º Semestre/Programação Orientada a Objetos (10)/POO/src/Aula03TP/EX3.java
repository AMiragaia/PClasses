package Aula03TP;
import java.util.Scanner;
public class EX3 {
    //Escreva uma função estática para devolver o maior de dois números reais
    public static void main(String[] args) {
        double x = 0, y = 0;
        System.out.println("O maior número é: " + maior(x, y));
    }
    public static double maior(double x, double y) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual o valor de x?");
        double x1 = sc.nextDouble();
        System.out.println("Qual o valor de y?");
        double y1 = sc.nextDouble();
        sc.close();
        if (x1 > y1) {
            return x1;
        } else {
            return y1;
        }     
}
}
