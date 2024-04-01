package Aula04;
import java.util.Scanner;
import java.lang.String;
public class EX1 {
     public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        //Fazer tratamento de inputs(em falta)
        System.out.print("Qual a string desejada para ler? ");
        String s1;
        s1 = sc.nextLine();
        System.out.print("Qual a string desejada para comparação?");
        String s2;
        s2 = sc.nextLine();
        sc.close();
        
        stringminuscula(s1);
        stringprimeiraletra(s1);
        string3letras(s1);
        stringtamanho(s1);
        stringcomparar(s1,s2);
        stringhash(s1);
    }
    public static String stringminuscula(String s1) {
            String s1lower=s1.toLowerCase();  
            System.out.println(s1lower);  
            return s1lower;
    }
    public static char stringprimeiraletra(String s1) {
        char s1first=s1.charAt(0);  
        System.out.println(s1first);  
        return s1first; 
    }
    public static String string3letras(String s1) {
        String s1first3;
        s1first3 = s1.substring(0,3);
        System.out.println(s1first3);
        return s1first3;   
    }
    public static int stringtamanho(String s1){
        int stringtamanho;
        stringtamanho = s1.length();
        System.out.println(stringtamanho);
        return stringtamanho;
    }
    public static int stringcomparar(String s1, String s2){
        //Irá dar return de 0 se as strings forem equivalenteS lexicograficamente(case sensitive)
        int compararstring = s1.compareTo(s2);
        System.out.println(compararstring);
        return compararstring;
    }
    public static int stringhash(String s1){
        int stringhash = s1.hashCode();
        System.out.println(stringhash);
        return stringhash;
    }
}
        

        
        

