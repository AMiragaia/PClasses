package Aula10;
import java.util.Map;
import java.util.HashMap;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Arrays;

public class EX2 {
    public static String getSignificado(Map<String, ArrayList<String>> mapa, String termo) {
        return mapa.get(termo).get(numeroRandom(0,mapa.get(termo).size()-1));
    }

    public static int numeroRandom(int min, int max) {
        return (int) (Math.random() * (max - min + 1)) + min;
    }
    public static void main(String[] args) {
        Map<String, ArrayList<String>> map = new HashMap<>();
        Scanner sc = new Scanner(System.in);
        int opçao = 0;
        while(opçao != 9){
            System.out.println("1 - Iniciar");
            System.out.println("2 - Adicionar");
            System.out.println("3 - Remover");
            System.out.println("4 - Modificar");
            System.out.println("5 - Imprimir");
            System.out.println("6 - Apenas termos");
            System.out.println("7 - Apenas significado");
            System.out.println("8 - Apenas significado aleatório");
            System.out.println("9 - Sair");
            System.out.println("Digite uma opção: ");
            opçao = sc.nextInt();
            switch(opçao){
                case 1:
                    System.out.println("Digite o termo: ");
                    String termo = sc.next();
                    String lixoString = sc.nextLine();
                    System.out.println("Digite a significado: ");
                    String significado = sc.nextLine();
                    map.put(termo, new ArrayList<String>(Arrays.asList(significado)));
                    break;
                case 2:
                    System.out.println("Digite o termo: ");
                    termo = sc.next();
                    lixoString = sc.nextLine();
                    System.out.println("Digite a significado: ");
                    significado = sc.nextLine();
                    map.get(termo).add(significado);
                    break;
                case 3:
                    System.out.println("Digite o termo: ");
                    termo = sc.next();
                    map.remove(termo);
                    break;
                case 4:
                if(map.isEmpty()){
                    System.out.println("Não há termos para modificar");
                }else{
                    System.out.println("Digite o termo: ");
                    String termo1 = sc.next();
                    String lixoString1 = sc.nextLine();
                    System.out.println("Digite a significado: ");
                    String significado2 = sc.nextLine();
                    map.replace(termo1, new ArrayList<String>(Arrays.asList(significado2)));
                    break;
                }
                    break;
                case 5:
                    System.out.println(map.toString());
                    break;

                case 6:
                    System.out.println(map.keySet());
                    break;
                    
                case 7:
                    System.out.println(map.values());
                    
                    break;
                case 8:
                    System.out.println("Digite o termo: ");
                    termo = sc.next();
                    System.out.println(getSignificado(map, termo));

                    break;
                case 9:
                    System.out.println("Saindo...");
                    sc.close();
                    break;
           }
        }   
    }
}