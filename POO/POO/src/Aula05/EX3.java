package Aula05;

public class EX3 {
    //crie um menu que permita ao usuário escolher qual classe de objeto deseja criar.
    //crie um programa que teste todas as classes triângulo, círculo e retângulo.

    public static void main(String[] args) {
        int opcao = 0;
        do {
            System.out.println("Escolha uma opção:");
            System.out.println("1 - Triângulo");
            System.out.println("2 - Círculo");
            System.out.println("3 - Retângulo");
            System.out.println("0 - Sair");
            opcao = Integer.parseInt(System.console().readLine());
            switch (opcao) {
                case 1:
                    System.out.println("Digite os lados do triângulo 1:");
                    double lado1 = Double.parseDouble(System.console().readLine());
                    double lado2 = Double.parseDouble(System.console().readLine());
                    double lado3 = Double.parseDouble(System.console().readLine());
                    Triangle triangulo = new Triangle(lado1, lado2, lado3);

                    System.out.println("Digite os lados do triângulo 2:");
                    double lado1a = Double.parseDouble(System.console().readLine());
                    double lado2a = Double.parseDouble(System.console().readLine());
                    double lado3a = Double.parseDouble(System.console().readLine());
                    Triangle triangulo2 = new Triangle(lado1a, lado2a, lado3a);
                    //use toString() para imprimir os dados do triângulo.´
                    System.out.println(triangulo.toString());
                    System.out.println("Área: " + triangulo.area());
                    System.out.println("Perímetro: " + triangulo.perimeter());
                    System.out.println(triangulo2.toString());
                    System.out.println("Área: " + triangulo2.area());
                    System.out.println("Perímetro: " + triangulo2.perimeter());
                    //use o metodo equals() para verificar se dois triângulos são iguais.
                    System.out.println("Triângulos iguais? " + triangulo.equals(triangulo2));
                    break;
                case 2:
                    System.out.println("Digite o raio do círculo:");
                    double raio = Double.parseDouble(System.console().readLine());
                    Circle circulo = new Circle(raio);
                    System.out.println("Digite o raio do círculo 2:");	
                    double raio2 = Double.parseDouble(System.console().readLine());
                    Circle circulo2 = new Circle(raio2);
                    System.out.println(circulo.toString());
                    System.out.println("Área: " + circulo.area());
                    System.out.println("Perímetro: " + circulo.perimetro());
                    System.out.println(circulo2.toString());
                    System.out.println("Área: " + circulo2.area());
                    System.out.println("Perímetro: " + circulo2.perimetro());
                    System.out.println("Círculos iguais? " + circulo.equals(circulo2));
                    break;
                case 3:
                    System.out.println("Digite os lados do retângulo:");
                    double lado4 = Double.parseDouble(System.console().readLine());
                    double lado5 = Double.parseDouble(System.console().readLine());
                    Retangle retangulo = new Retangle(lado4, lado5);
                    System.out.println("Digite os lados do retângulo 2:");
                    double lado4a = Double.parseDouble(System.console().readLine());
                    double lado5a = Double.parseDouble(System.console().readLine());
                    Retangle retangulo2 = new Retangle(lado4a, lado5a);
                    System.out.println(retangulo.toString());
                    System.out.println("Área: " + retangulo.area());
                    System.out.println("Perímetro: " + retangulo.perimeter());
                    System.out.println(retangulo2.toString());
                    System.out.println("Área: " + retangulo2.area());
                    System.out.println("Perímetro: " + retangulo2.perimeter());
                    System.out.println("Retângulos iguais? " + retangulo.equals(retangulo2));

                    break;
                case 4:
                    System.out.println("Saindo...");
                    break;
                default:
                    System.out.println("Opção inválida");
                    break;
            }
        } while (opcao != 4);
    }
}
