package Aula03;
import java.util.Scanner;
public class EX5 {
    public static void main(String[] args){
        //Introdução de dados
        Scanner sc = new Scanner(System.in);
        final int nm = 12;
        double investido, juro;
        //Leitura dos dados
        do{
            try{
                System.out.println("Montante investido?(€) ");
                 investido = sc.nextDouble();
                if (investido % 1000 == 0){
                    break;
                } else{
                    System.out.println("O valor introduzido tem de ser múltiplo de 1000! ");
                }
            } catch (Exception e) {
                sc.nextLine();
                System.out.println("O valor introduzido precisa de ser um número!");

            }
        }while(true);
        do {
            try {
                System.out.println("Taxa de juro mensal?(%) ");
                 juro = sc.nextDouble();
                if ( juro <= 5 && juro >= 0) {
                    break;
                } else {
                    System.out.println("O valor introduzido tem de estar entre 0% e 5%");
                }
            } catch (Exception e) {
                sc.nextLine();
                System.out.println("O valor introduzido precisa de ser um número!");
            }
        }while(true);
        sc.close(); 
        
        // Cálculo do valor que estará investido ao fim de 3 meses
        for (int i=1; i<= nm; i++){
            investido +=  (investido * (juro/100)); 
            System.out.printf("No final do mês %02d (EUR): %.2f\n", i, investido);   
        }
        }
    }
