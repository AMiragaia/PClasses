package Aula02;
import java.util.Scanner;

public class EX5 {
    public static void main(String[] args){
        //Introdução de dados
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual a velocidade 1? (m/s) ");
        double v1 = sc.nextDouble();
        System.out.println("Distancia percorrida no primeiro trajeto? (m) ");
        double d1 = sc.nextDouble();
        System.out.println("Qual a velocidade 2? (m/s) ");
        double v2 = sc.nextDouble();
        System.out.println("Distancia percorrida no segunda trajeto? (m) ");
        double d2 = sc.nextDouble();
        sc.close(); 
        
        // Cálculo da velocidade média final (distancia total / tempo total)
        double vm = (d1+d2) / ((d1/v1) + (d2/v2));
        
        // Apresentar o resultado obtido
        System.out.println("Velocidade média final (m/s): " + vm);
    }
    
}
