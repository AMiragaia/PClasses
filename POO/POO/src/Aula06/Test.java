package Aula06;
import Aula05.Date;
public class Test {
    public static void main(String[] args) {
        Aluno al = new Aluno("João", 312239393, "01/01/2004", new Date());
        Bolseiro bls = new Bolseiro ("André", 939193932, "21/01/2003", new Date(), 900.00);
        bls.setMontanteMensal(500.00);
        System.out.println("Aluno: " + al.getNome());
        System.out.println(al);
        System.out.println("Bolseiro: " + bls.getNome() + ", NMec: "
        + bls.getNumeroAluno() + ", Bolsa: " + bls.getMontanteMensal());
        System.out.println(bls);
        }
    
}
