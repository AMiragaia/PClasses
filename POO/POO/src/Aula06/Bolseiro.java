package Aula06;
    import Aula05.Date;
    public class Bolseiro extends Aluno {
        private double montanteMensal;
    
        public Bolseiro(String nome, int cc, String dataNasc, Date anoIngresso, double montanteMensal) {
            super(nome, cc, dataNasc, anoIngresso);
            this.montanteMensal = montanteMensal;
        }
    
        public Bolseiro(String nome, int cc, String dataNasc) {
            super(nome, cc, dataNasc);
            this.montanteMensal = 0;
        }
    
        public double getMontanteMensal() {
            return montanteMensal;
        }
    
        public void setMontanteMensal(double montanteMensal) {
            this.montanteMensal = montanteMensal;
        }
    
        public void acrescentarMontanteMensal(double montanteMensal) {
            this.montanteMensal += montanteMensal;
        }
    
        public void reduzirMontanteMensal(double montanteMensal) {
            this.montanteMensal -= montanteMensal;
        }
    
        //acrescentar metodo toString para a classe Bolseiro.
    
        @Override public String toString() {
            return "Bolseiro{" + "nome=" + getNome() + ", cc=" + getCc() + ", dataNasc=" + getDataNasc() + ", numeroAluno=" + getNumeroAluno() + ", anoIngresso=" + getAnoIngresso() + ", montanteMensal=" + montanteMensal + '}';
        }
    
    }
