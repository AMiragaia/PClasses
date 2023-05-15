package Aula02;
import java.util.Scanner;
import static java.lang.System.*;
public class EX1 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.print("Qual o numero de km que deseja converter? ");
        double km = sc.nextDouble();
        if (km < 0){
            System.out.println("O número de km tem de ser positivo!");
            exit(1);
        }
        double milhas = km / 1.609;
        System.out.println(km + " km são " + milhas + " milhas. ");
        sc.close();
        
    }
    
}
