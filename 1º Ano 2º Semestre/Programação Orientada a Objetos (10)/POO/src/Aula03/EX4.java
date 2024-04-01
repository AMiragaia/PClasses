package Aula03;
import java.util.Scanner;

public class EX4 {
    public static void main(String[] args){
        //Declaração de variaveis
        
        int nT = 1;
        double vmax, vmin, valortotal, N1, N;
        Scanner sc = new Scanner(System.in);
        //Introdução de dados
       System.out.println("Qual o numero que deseja adicionar? ");
       vmax = vmin = valortotal = N1 = sc.nextDouble();
        //Condição de quebra quando um numero igual ao primeiro é introduzido
       while (true) {
           System.out.println("Qual o numero que deseja adicionar? ");
           N = sc.nextDouble();
           if (N < vmin) vmin = N1;
           if (N < vmax) vmax = N1;
           valortotal += N;
           nT += 1;
           if (N == N1) break;
       }
       sc.close();
       // Apresentação dos resultados no formato pretendido
       System.out.printf("Total de numeros introduzidos: %d\nMédia dos valores: %.2f\nValor minimo %.2f\nValor máximo: %.2f" , nT, valortotal/nT, vmin, vmax);
    }
    
}
    

