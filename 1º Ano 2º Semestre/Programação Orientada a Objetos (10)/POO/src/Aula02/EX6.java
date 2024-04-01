package Aula02;
import java.util.Scanner;
import static java.lang.System.*;

public class EX6 {
public static void main(String[] args){
    //Introdução de dados
    Scanner sc = new Scanner(System.in);
    System.out.println("Qual o tempo desejado? (s) ");
    int tempo = sc.nextInt();
    sc.close();
    
    if (tempo < 0){
        System.out.println("O tempo total tem que ser positivo!");
        exit(1);
    }
    //Transformar o tempo introduzido para o formato pretendido

    // Passar os segundos introduzidos a horas
    int h = (tempo / 3600);
    // Calcular o resto da divisão inteira da operação acima feita
    int m1 = (tempo % 3600);
    // Calcular os minutos a partir do valor obtido acima
    int m = m1 / 60;
    // Calcular o resto da divisão inteira da operação acima feita
    int s1 = (m1 % 60);
    // Calcular os segundos a partir do valor obtido acima
    int s = s1* 60;



    //Apresentar resultados no formato pretendido

    System.out.println(String.format("%02d:%02d:%02d",h,m,s));
    
   

    }

}
    
