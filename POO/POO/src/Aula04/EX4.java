package Aula04;
import java.util.Scanner;

public class EX4 {
    public static void main(String[] args) {
        int[] calendario = leituradevalores();
        fazercalendario(calendario[0], calendario[1], calendario[2]);
        
    }
    public static int[] leituradevalores() {
        Scanner sc = new Scanner(System.in);
        int mes, ano, dia_semana;
        System.out.print("Qual o mês?");
        mes = sc.nextInt();
        System.out.print("Qual o ano?");
        ano = sc.nextInt();
        System.out.print("Qual o dia da semana por qual o mês começa?");
        dia_semana = sc.nextInt();
        sc.close();
        return new int[] { mes, ano, dia_semana};
    }
    public static int NumeroDeDiasNoMes(int mes, int ano) {
        if (mes == 2){
            if (anobissexto(ano)) return 29;
            return 28;
        }
        if (mes ==4 || mes == 6 || mes == 9 || mes == 11) return 30;
        return 31;
    }
    public static boolean anobissexto(int ano){
        return (ano % 4 == 0 && ano % 100 != 0) || ano % 400 == 0;
    }
    public static void fazercalendario(int mes, int ano, int dia_semana){
        int days = NumeroDeDiasNoMes(mes, ano);
        String mesnome = getmesnome(mes);

        int mesnomeLength = mesnome.length();
        int anoLength = String.valueOf(ano).length();
        int borda = (20 - mesnomeLength - anoLength) / 2;
        String bordaString = "";
        for (int i = 0; i < borda; i++) bordaString += " ";
        
        System.out.println(bordaString + mesnome + " " + ano + bordaString);
        System.out.println("Su Mo Tu We Th Fr Sa");

        for (int i = 0; i < dia_semana; i++) System.out.print("   ");

        for (int i = 1; i <= days; i++) {
            System.out.printf("%2d ", i);
            if ((i + dia_semana) % 7 == 0 || i == days) System.out.println();
        }
    }

    public static String getmesnome(int mes) {
        switch (mes) {
            case 1: return "January";
            case 2: return "February";
            case 3: return "March";
            case 4: return "April";
            case 5: return "May";
            case 6: return "June";
            case 7: return "July";
            case 8: return "August";
            case 9: return "September";
            case 10: return "October";
            case 11: return "November";
            case 12: return "December";
            default: return "";
        }
    }


}
 
