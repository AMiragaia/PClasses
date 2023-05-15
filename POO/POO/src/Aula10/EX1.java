package Aula10;
import java.util.Map;
import java.util.HashMap;
import java.util.Scanner;

public class EX1 {
    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();
        Scanner sc = new Scanner(System.in);
        int opçao = 0;
        while(opçao != 7){
            System.out.println("1 - Adicionar");
            System.out.println("2 - Remover");
            System.out.println("3 - Modificar");
            System.out.println("4 - Imprimir");
            System.out.println("5 - Apenas termos");
            System.out.println("6 - Apenas significado");
            System.out.println("7 - Sair");
            System.out.println("Digite uma opção: ");
            opçao = sc.nextInt();
            switch(opçao){
                case 1:
                    System.out.println("Digite o termo: ");
                    String termo = sc.next();
                    String lixoString = sc.nextLine();
                    System.out.println("Digite a significado: ");
                    String significado = sc.nextLine();
                    map.put(termo, significado);
                    break;
                case 2:
                    System.out.println("Digite o termo: ");
                    termo = sc.next();
                    map.remove(termo);
                    break;
                case 3:
                if(map.isEmpty()){
                    System.out.println("Não há termos para modificar");
                }else{
                    System.out.println("Digite o termo: ");
                    String termo1 = sc.next();
                    String lixoString1 = sc.nextLine();
                    System.out.println("Digite a significado: ");
                    String significado2 = sc.nextLine();
                    map.replace(termo1, significado2);
                }
                    break;
                case 4:
                    System.out.println(map.toString());
                    break;

                case 5:
                    System.out.println(map.keySet());
                    break;
                    
                case 6:
                    System.out.println(map.values());
                    
                    break;
                case 7:
                    System.out.println("Saindo...");
                    sc.close();
                    break;
           }
        }   
    }
}


