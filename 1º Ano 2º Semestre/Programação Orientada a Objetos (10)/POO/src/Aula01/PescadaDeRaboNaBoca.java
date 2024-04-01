package Aula01;

public class PescadaDeRaboNaBoca {

	public static void main(String[] args) {
		recursivoSimples(100); // chama a função recursivosimples com o argumento 100
	}

	public static void recursivoSimples(int x) {
		System.out.println(x); // da print a x 
		x++; //soma 1 a x
		if (x<200) //enquanto x for menor que 200 a função irá chamar a propria função
			recursivoSimples(x);
	}

}
