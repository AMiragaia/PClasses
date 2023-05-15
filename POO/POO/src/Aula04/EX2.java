package Aula04;
import java.util.Scanner;
import java.lang.String;

public class EX2 {
     public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Qual a frase que deseja ler? ");
        String s;
        s = sc.nextLine();
        sc.close();
        countDigits(s);
        countspaces(s);
        checklower(s);
        subspaces(s);
        palindromecheck(s);
    }
    public static int countDigits(String s){
        int digitos;
        digitos = 0;
        int x = 0;
        char y;
        //System.out.print(s.length());
        for (int i = 0; i < s.length(); i++){
            y = s.charAt(x);
            //System.out.println(y);
            if (Character.isDigit(y) == true){
                digitos +=1;
            }
            x += 1;       
        }
        System.out.println(digitos);
        return digitos;    
    }
    public static int countspaces(String s){
        int countspaces = 0;
        int x = 0;
        char y;
        for (int i = 0; i < s.length(); i++){
            y = s.charAt(x);
            if (Character.isWhitespace(y) == true){
                countspaces +=1;
            }
            x += 1;
        }
        System.out.println(countspaces);
        return countspaces;
    }
    public static String checklower(String s){
        
        String s1;
        s1 = s.toLowerCase();
        if (s1.equals(s) == true){
            System.out.println("A frase tem todas as suas letras minusculas!");    
        }
        else System.out.println("Nem todas as letras da frase são minusculas!");
        return s1;

    }
    public static String subspaces(String s){
        String s2;
        s2 = s.replaceAll(" +", " ").trim();
        System.out.println(s2);
        return s2;        
    }
    public static String palindromecheck(String s){
        String sreverse;
        sreverse ="";
        for (int i = s.length()-1; i >= 0; i--){
            sreverse = sreverse + s.charAt(i);
        }
        //System.out.println(sreverse);
        if (sreverse.equals(s) == true){
            System.out.println("A frase é um palindromo!");
        }else System.out.println ("A frase não é um palindromo");
        return sreverse;
    }
}
