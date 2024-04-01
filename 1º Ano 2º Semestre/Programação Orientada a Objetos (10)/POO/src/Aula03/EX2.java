package Aula03;
import java.util.Scanner;
import static java.lang.System.*;
public class EX2 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual o numero em deseja que a sequência comece? ");
        int N = sc.nextInt();
        sc.close();
        
        if (N < 0){
            System.out.println("O número tem que ser positivo!");
            exit(1);
        }
        // duplo start?! (fixed)
        for (int i = N; i>= 0; i--){
            System.out.println(i); 
        }
    }
}
