package Aula05;

public class Triangle {
    // mo delar um Triângulo, caracterizado pela dimensão dos seus lados (lado1, lado2, lado3);
    private double lado1;
    private double lado2;
    private double lado3;

    public Triangle(double lado1, double lado2, double lado3) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        if ((lado1 > 0) && (lado1 < lado2 + lado3)) {
            this.lado1 = lado1;
        } else {
            System.out.println("Lado invalido");
        }
        
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        if ((lado2 > 0) && (lado2 < lado1 + lado3)) {
            this.lado2 = lado2;
        } else {
            System.out.println("Lado invalido");
        }
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        if ((lado3 > 0) && (lado3 < lado1 + lado2)) {
            this.lado3 = lado3;
        } else {
            System.out.println("Lado invalido");
        }
    }
    //Aplicando o método de Heronw
    public double area() {
        double p = (lado1 + lado2 + lado3) / 2;
        return Math.sqrt(p * (p - lado1) * (p - lado2) * (p - lado3));
    }

    public double perimeter() {
        return lado1 + lado2 + lado3;
    }

    public String toString() {
        return "Triangulo{" +
                "lado1=" + lado1 +
                ", lado2=" + lado2 +
                ", lado3=" + lado3 +
                '}';
    }   

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Triangle triangle = (Triangle) o;

        if (Double.compare(triangle.lado1, lado1) != 0) return false;
        if (Double.compare(triangle.lado2, lado2) != 0) return false;
        return Double.compare(triangle.lado3, lado3) == 0;
    }

}

