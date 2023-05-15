package Aula02;
import java.lang.Math;
import java.util.Scanner;

public class EX7 {
    public static void main(String[] args){
        // Declarar os vetores
        double[] ponto1 = new double[2];
        double[] ponto2 = new double[2];
        double[] v = new double[2];
        //Introdução de dados
        Scanner sc = new Scanner(System.in);
        System.out.println("Qual a cordenada x do ponto 1? ");
        ponto1[0] = sc.nextDouble();
        System.out.println("Qual a cordenada y do ponto 1?");
        ponto1[1] = sc.nextDouble();
        System.out.println("Qual a cordenada x do ponto 2? ");
        ponto2[0] = sc.nextDouble();
        System.out.println("Qual a cordenada y do ponto 2? ");
        ponto2[1] = sc.nextDouble();
        sc.close(); 

        //calcular o vetor principal
        v[0] = ponto2[0]-ponto1[0];
        v[1] = ponto2[1]-ponto1[1];
        double distancia = Math.sqrt((Math.pow(v[0], 2))+Math.pow(v[1], 2));
        //Apresentar a distancia obtida
        System.out.println("A distância entre o ponto 1 e 2 é: " + distancia);
    }

    
}
