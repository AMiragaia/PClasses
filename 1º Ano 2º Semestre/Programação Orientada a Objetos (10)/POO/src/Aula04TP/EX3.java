package Aula04TP;

public class EX3 {
    //Escreva código para criar 2 instâncias de Complexo, 2 de Point3D e um vetor com 10 referências para Point3D.
    //Imprima os atributos de um dos objetos.
    public class ComplexoEPontosDemo {
        public static void main(String[] args) {
            Complexo c1 = new Complexo(1, 2);
            Complexo c2 = new Complexo(3, 4);
            Point3D p1 = new Point3D(1, 2, 3);
            Point3D p2 = new Point3D(4, 5, 6);
            Point3D[] p = new Point3D[10];
            p[0] = p1;
            p[1] = p2;
            System.out.println("O valor de c1 é: " + c1.getReal() + " + " + c1.getImag() + "i");
            System.out.println("O valor de c2 é: " + c2.getReal() + " + " + c2.getImag() + "i");
            System.out.println("O valor de p1 é: " + p1.getX() + " + " + p1.getY() + " + " + p1.getZ());
            System.out.println("O valor de p2 é: " + p2.getX() + " + " + p2.getY() + " + " + p2.getZ());
            System.out.println("O valor de p é: " + p[0].getX() + " + " + p[0].getY() + " + " + p[0].getZ());
            System.out.println("O valor de p é: " + p[1].getX() + " + " + p[1].getY() + " + " + p[1].getZ());
        }
    }
}
