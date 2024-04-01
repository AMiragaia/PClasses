package Aula01;
import java.util.Scanner;

public class KmToMiles {
	public static void main(String[] args) {
		double km, miles; // declarar duas variaveis
		Scanner sc = new Scanner(System.in); //pede o input do utilizador 
		System.out.print("Insira distância em km: "); //mensagem que aparece ao utilizador para inserir o seu input
		km = sc.nextDouble(); // a variavel km assume o  valor do input do utilizador
		miles = km / 1.609; // divisão normal da variavel km por 1.609
		System.out.println("A distância em milhas é " + miles); //print da conversão entre km e milhas
		sc.close();
	}
}
