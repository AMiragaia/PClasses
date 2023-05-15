package Aula05;

public class Retangle {
     //modelar um Retângulo, caracterizado pela dimensão dos seus lados (comprimento, altura);

    private double comprimento;
    private double altura;
    
    public Retangle(double comprimento, double altura) {
        this.comprimento = comprimento;
        this.altura = altura;
    }

    public double getcomprimento() {
        return comprimento;
    }

    public void setcomprimento(double comprimento) {
        this.comprimento = comprimento;
    }

    public double getaltura() {
        return altura;
    }

    public void setaltura(double altura) {
        if (altura > 0) {
            this.altura = altura;
        } else {
            System.out.println("Altura invalida");
        }
             
    }

    public double area() {
        return comprimento * altura;
    }

    public double perimeter() {
        return 2 * comprimento + 2 * altura;
    }

    public String toString() {
        return "Retangulo{" +
                "comprimento=" + comprimento +
                ", altura=" + altura +
                '}';
    }
    //comparar os Retangulos
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Retangle retangle = (Retangle) o;

        if (Double.compare(retangle.comprimento, comprimento) != 0) return false;
        return Double.compare(retangle.altura, altura) == 0;
        
    }
        
}


