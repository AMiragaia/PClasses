package Aula07;

public class Retangulo extends Forma {
    
    protected double comprimento, altura; 
    public Retangulo(double comprimento, double altura, String cor) {
        this.setComprimento(comprimento);
        this.setAltura(altura);
        this.setCor(cor);
        }
        protected void setArea() {
            this.area = this.getComprimento() * this.getAltura();
        }

        protected void setPerimetro() {
            this.perimetro = 2 * (this.getComprimento() + this.getAltura());
        }

        public void setComprimento(double comprimento) {
            this.comprimento = comprimento;
            this.setArea();
            this.setPerimetro();
        }
        public double getComprimento() {
            return this.comprimento;
        }
        public void setAltura(double altura) {
            this.altura = altura;
            this.setArea();
            this.setPerimetro();
        }        
        public double getAltura() {
            return this.altura;
        }
        public boolean FigValida() {
            return this.getComprimento() > 0 && this.getAltura() > 0;
        }
        public String toString() {
            return "tipo:retangulo,comprimento:" + this.getComprimento() + ",altura:" + this.getAltura() + ",area:" + this.getArea() + ",perimetro:" + this.getPerimetro() + ",cor:" + this.getCor();
        }
}
        


