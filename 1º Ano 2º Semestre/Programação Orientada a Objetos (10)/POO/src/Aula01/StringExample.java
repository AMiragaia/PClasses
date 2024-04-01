package Aula01;

public class StringExample {
	public static void main(String[] args) {
		String s1 = "programar em Java.";
		System.out.println(s1.split(" ")[0] + " é engraçado!! :)"); //adicionar "programar a "é engraçado"
		System.out.println("É giro " + s1); // "É giro + "programar em Java."
		for (int i=0; i<14; i++) // for loop começando em 0 até 14 
			System.out.println("vamos " + s1 + " na aula " + i);// vamos + string s1 + na aula + numero em que está o for loop
	}
}
