package Aula07;

public abstract class Forma {
    protected String cor;
    protected double area , perimetro;

    protected abstract void setArea();
    protected abstract void setPerimetro();
    public abstract boolean FigValida();

    public void setCor(String cor) {
        this.cor = cor;
    }
    public String getCor() {
        return cor;
    }
    public double getArea() {
        return area;
    }
    public double getPerimetro() {
        return perimetro;
    }

    public boolean equals(Forma figura) {
        return this.toString().equals(figura.toString());
    }
}
