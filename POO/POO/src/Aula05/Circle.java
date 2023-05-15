package Aula05;

public class Circle {
    //Implemente classes que permitam modelar um circulo caracterizado por um raio.
    //adicione todos os métodos especiais importantes (toString(), equals(), get...(),set...(), ...);
    //nos construtores e métodos modificadores (set...), verifique pré-condições adequadas:

    private double raio;

    public Circle(double raio) {
        this.raio = raio;
    }

    public double getraio() {
        return raio;
    }

    public void setraio(double raio) {
        
        if ( raio > 0 ) {
            this.raio = raio;
        } else {
            System.out.println("Raio invalido");
        }
       
    }

    public double area() {
        return Math.PI * Math.pow(raio, 2);
    }

    public double perimetro() {
        return 2 * Math.PI * raio;
    }

    public String toString() {
        return "Circulo{" +
                "raio=" + raio +
                '}';
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Circle circle = (Circle) o;

        return Double.compare(circle.raio, raio) == 0;
    }


    

}
