package Aula03;
import java.util.Scanner;
public class EX6 {
    public static void main(String[] args){
        //Declaração de variavéis
        int ano, mes, dias;
        Scanner sc = new Scanner(System.in);

       
       // Leitura dos dados
       do{
        try {
            System.out.print("Ano: ");
            ano = sc.nextInt();
            break;
        } catch (Exception e) {
            sc.nextLine();
            System.out.println("O valor introduzido tem de ser um número inteiro!");
        }
        }while(true);
        do{
            try {
                System.out.print("Mês: ");
                mes = sc.nextInt();
                if (mes >= 1 && mes <= 12) {
                    break;
                } else {
                    System.out.println("O valor introduzido tem de estar entre 1 e 12");
                }
            } catch (Exception e) {
                sc.nextLine();
                System.out.println("O valor introduzido tem de ser um número inteiro!");
            }
    }while(true);
    sc.close();

    // Determinação dos dias no mês de fevereiro verificando também se o ano é bissexto (fixed)
    if (mes == 2){
        if (ano % 400 == 0) {
            dias = 29;
        } else if (ano % 100 == 0) {
            dias = 28;
        } if (ano % 4 == 0) {
            dias = 29;
        } else {
            dias = 28;
        }
    } else {
        // meses com numero de dias fixo (fixed)
        if (mes==4 || mes==6 || mes==9 || mes==11) {
            dias = 30;
        } else {
            dias = 31;
        }
    }

    // Apresentação do resultado
    System.out.printf("O mês %02d do ano %d tem %02d dias.", mes, ano, dias);
}
}


