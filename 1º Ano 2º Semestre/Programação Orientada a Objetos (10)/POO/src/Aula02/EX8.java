package Aula02;
import java.util.Scanner;
import java.lang.Math;
public class EX8 {
    public static void main(String[] args){
        //Introdução de dados
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual o valor do cateto A? ");
        double A = sc.nextDouble();
        System.out.println("Qual o valor do cateto B? ");
        double B = sc.nextDouble();
        sc.close();


        //Calculo da hipotenusa
        double C = Math.sqrt(Math.pow(B, 2)+ Math.pow(A, 2));
        //Calculo do sin do angulo entre o lado A e a hipotenusa
        double angAH1 =  B/C;
        //Calculo do angulo através do arcsin
        double anr = Math.asin(angAH1);

        //Passagem de radianos a graus
        double ang = ((180*anr)/Math.PI);



        //Apresentar os resultados
        System.out.printf("O valor da hipotenusa é: %.4f.\n",  C);
        System.out.printf("O valor do angulo entre A e a hipotenusa é: %.4f.\n", ang);




    }
}
