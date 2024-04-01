package Aula02;
import java.util.Scanner;
public class EX2 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Quantos graus ºC queres converter? ");
        float C = sc.nextFloat();
        double F = 1.8 * C + 32;
        System.out.println(C + " graus celsius são " + F + " graus Fahrenheit. ");
        sc.close();
    }

    
}
