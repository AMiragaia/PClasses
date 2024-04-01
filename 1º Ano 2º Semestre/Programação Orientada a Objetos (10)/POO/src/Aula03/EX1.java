package Aula03;
import java.text.DecimalFormat;
import java.util.Scanner;
public class EX1 {
    public static void main(String[] args){
        //Declaração de variavéis 
        double notaP, notaT;
        Scanner input = new Scanner(System.in);
        DecimalFormat df = new DecimalFormat("0.00");
        //Introdução de dados com verificação (a funcionar mas confuso #REVER)
        do{
           try {
                System.out.print("Qual a nota da componente prática? ");
                notaP = input.nextDouble();
                df.format(notaP);
                System.out.println(notaP);
                if (notaP >= 0 && notaP <= 20){
                    break;
                }
                throw new Exception();
           } catch (Exception e) {
               input.nextLine();
               System.out.println("O valor da componente prática tem que ser positivo e menor que 20!");
           }
        }while(true);
        do{
            try {
              System.out.print("Qual a nota da componente teórica? ");
              notaT = input.nextDouble();
              df.format(notaT);
              if (notaT >= 0 && notaT <= 20){
                break;
              }
              throw new Exception();
            } catch (Exception e) {
                input.nextLine();
                System.out.println("O valor da componente teórica tem que ser positivo e menor que 20!");
            }
        }while(true);
        input.close();
        
         
        //Verificação das notas minimas
        do{
            if (notaP <= 7.0){
                System.out.println("66");
                break;
            }
            else if (notaT <= 7.0);{
                System.out.println("66");
                break;
            }
        }while(true);
        
        double notafinal = 0.4*notaT + 0.6*notaP;
        //Apresentar resultados no formato pretendido
        System.out.println(String.format("A nota final é %.2f", notafinal));
    } 
}
