package Aula02;
import java.util.Scanner;
public class EX3 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Quantidade de agua? ");
        double q = sc.nextDouble();
        System.out.println("Temperatura inicial? ");
        double ti = sc.nextDouble();
        System.out.println("Temperatura final? ");
        double tf = sc.nextDouble();
        double energy = q * (tf - ti) * 4184;
        System.out.println("A energia necessária é " + energy + " Joules.");
        sc.close(); 

    }
    
}
