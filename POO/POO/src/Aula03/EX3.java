package Aula03;
import java.util.Scanner;
import static java.lang.System.*;
public class EX3 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual o número que deseja testar? ");
        int N = sc.nextInt();
        boolean x = false;
        sc.close();
        
        if (N < 0){
            System.out.println("O número tem que ser positivo!");
            exit(1);
        }
        for (int i = 2; i * i  <= N ; ++i) {
            if (N % i == 0){
                x = true;
                break; 
            }
        }
        
        
        if (x)
            System.out.println("O número não é primo");
            System.out.println("O número é primo");
        }
    }

