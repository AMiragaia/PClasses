package Aula03;
import java.util.Scanner;
import java.util.Random;
public class EX7 {
    public static void main(String[] args) {
        //Declaração de variáveis
        Random generator = new Random();
        Scanner sc = new Scanner(System.in);
        String resposta;
        int valor_random, valor_recebido, num_tentativas;
        boolean continuar = true;
        do{
            valor_random = generator.nextInt(100)+1;
            valor_recebido = num_tentativas = 0;
            do{
                do{
                    try{
                        System.out.print("Adivinhe o número [1;100]: ");
                        valor_recebido = sc.nextInt();
                        if (valor_recebido >= 1 && valor_recebido <= 100){
                            num_tentativas++;
                            break;
                        }else {
                            System.out.println("O valor introduzido tém de estar no intervalo [1,100]");
                        }
                    } catch (Exception e) {
                        sc.nextLine();
                        System.out.println("O valor introduzido tem de ser um número inteiro");
                    }
                }while(true);
                if (valor_recebido > valor_random){
                    System.out.println("O valor gerado é inferior.");
                }
                if (valor_recebido < valor_random){
                    System.out.println("O valor gerado é superior");
                }
            }while(valor_recebido!=valor_random);
            System.out.println(String.format("Tentativas: %d", num_tentativas));
            sc.nextLine();
            System.out.println("Deseja Continuar (S/N)");
            resposta = sc.nextLine().toLowerCase();
            if (!(resposta.equals("s")) && !(resposta.equals("sim"))) {
                continuar = false;
            };
        }while (continuar);
        sc.close();
        }
    }

