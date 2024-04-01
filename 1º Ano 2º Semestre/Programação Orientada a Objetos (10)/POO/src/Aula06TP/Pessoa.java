package Aula06TP;

public class Pessoa {
    //Indique a diferença entre as duas instruções seguintes:
    public Pessoa(String nome)  {
        Pessoa p1 = new Pessoa("Maria");

        Pessoa p2 = new Pessoa("Maria");

        System.out.println(p1 == p2); //false o == compara o endereço de memória
    
        System.out.println(p1.equals(p2)); //true o equals compara o conteúdo
}
}
