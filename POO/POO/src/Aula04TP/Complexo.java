package Aula04TP;

public class Complexo {
    //Defina uma classe que permita representar números complexos.
    //Crie construtor(es) e funções de acesso aos atributos(funções get).
    
        private double real;
        private double imag;
        public Complexo(double real, double imag) {
            this.real = real;
            this.imag = imag;
        }
        public double getReal() {
            return real;
        }
        public double getImag() {
            return imag;
        }
    
}
