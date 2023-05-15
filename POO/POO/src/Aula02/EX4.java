package Aula02;
import java.util.Scanner;


public class EX4 {
    public static void main(String[] args){
        //Introdução de dados
        Scanner sc = new Scanner(System.in);
        final int nm = 3;
        System.out.println("Montante investido?(€) ");
        double investido = sc.nextDouble();
        System.out.println("Taxa de juro mensal?(%) ");
        double juro = sc.nextDouble();
        sc.close(); 
        
        // Cálculo do valor que estará investido ao fim de 3 meses
        for (int i=1; i<= nm; i++){
            investido +=  (investido * (juro/100));    
        }
        // Apresentar o resultado obtido
        System.out.println("O valor que está investido ao final de 3 meses será de " + investido + " euros" );
    }
    
}
