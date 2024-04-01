package Aula07;

import java.util.Scanner;

public class EX3 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        // Cria a agência
        Agencia agencia = new Agencia("Agencia de Alojamentos", "Rua dos Alojamentos, nº 1");
        // Cria alojamentos e carros por padrão
        Apartamento apA = new Apartamento("A1", "Apartamento A", "Rua dos Alojamentos, nº 1", 100, true, 5, 2);
        Apartamento apB =  new Apartamento("A2", "Apartamento B", "Rua dos Alojamentos, nº 1", 100, true, 5, 2);
        Quarto qdhA = new Quarto("Q1", "Quarto do Dorminhão A", "Rua dos Alojamentos, nº 1", 100, true, 5, "Double");
        Quarto qdhB =  new Quarto("Q2", "Quarto do Dorminhão B", "Rua dos Alojamentos, nº 1", 100, true, 5, "Double");
        Carro carA = new Carro("carro1", 'A', "gasolina",false);
        Carro carB = new Carro("carro2", 'F', "disel", true);
        Carro carC = new Carro("carro3", 'D', "hibrido", false);
        // Adiciona alojamentos e carros à agência
        agencia.adicionarAlojamento(apA);
        agencia.adicionarAlojamento(apB);
        agencia.adicionarAlojamento(qdhA);
        agencia.adicionarAlojamento(qdhB);
        agencia.adicionarCarro(carA);
        agencia.adicionarCarro(carB);
        agencia.adicionarCarro(carC);

        int escolha = 0;
        do {
            System.out.println("============ MENU ============");
            System.out.println("1  - Adicionar apartamento");
            System.out.println("2  - Adicionar quarto de hotel");
            System.out.println("3  - Adicionar carro");
            System.out.println("4  - Remover Alojamento");
            System.out.println("5  - Remover carro");
            System.out.println("6  - Check-in");
            System.out.println("7  - Check-out");
            System.out.println("8  - Levantar carro");
            System.out.println("9  - Entregar carro");
            System.out.println("10 - Listar dados da agência");
            System.out.println("99 - Sair");
            System.out.println("==============================");
            System.out.print(">>> ");
            escolha = scanner.nextInt();
            scanner.nextLine();
            System.out.println("==============================");
            if (escolha == 1)
                addApartamento(agencia, scanner);
            if (escolha == 2)
                addQuartoDeHotel(agencia, scanner);
            if (escolha == 3)
                addCarro(agencia, scanner);
            if (escolha == 4)
                rmvAlojamento(agencia, scanner);
            if (escolha == 5)
                rmvCarro(agencia, scanner);
            if (escolha == 6)
                checkIn(agencia, scanner);
            if (escolha == 7)
                checkOut(agencia, scanner);
            if (escolha == 8)
                levantarCarro(agencia, scanner);
            if (escolha == 9)
                entregarCarro(agencia, scanner);
            if (escolha == 10)
                listarDados(agencia);
        } while (escolha != 99);
        scanner.close();
    }

    private static void addApartamento(Agencia agencia, Scanner scanner) {
        try {
            System.out.print("Código: ");
            String codigo = scanner.nextLine();
            System.out.print("Nome: ");
            String nome = scanner.nextLine();
            System.out.print("Local: ");
            String local = scanner.nextLine();
            System.out.print("Preco: ");
            double preco = scanner.nextDouble();
            scanner.nextLine();
            System.out.print("Disponível [s/n]: ");
            String disponivel = scanner.nextLine();
            System.out.print("Avaliação: ");
            double avaliacao = scanner.nextDouble();
            scanner.nextLine();
            System.out.print("Número de quartos: ");
            int numero_de_quartos = scanner.nextInt();
            scanner.nextLine();
            Apartamento ap = new Apartamento(codigo, nome, local, preco, disponivel.equals("s"), avaliacao, numero_de_quartos);
            agencia.adicionarAlojamento(ap);
            System.out.println("Apartamento adicionado com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private static void addQuartoDeHotel(Agencia agencia, Scanner scanner) {
        try {
            System.out.print("Código: ");
            String codigo = scanner.nextLine();
            System.out.print("Nome: ");
            String nome = scanner.nextLine();
            System.out.print("Local: ");
            String local = scanner.nextLine();
            System.out.print("Preco: ");
            double preco = scanner.nextDouble();
            scanner.nextLine();
            System.out.print("Disponível [s/n]: ");
            String disponivel = scanner.nextLine();
            System.out.print("Avaliação: ");
            double avaliacao = scanner.nextDouble();
            scanner.nextLine();
            System.out.print("Tipo [single, double, twin, triple]: ");
            String tipo = scanner.nextLine();
            Quarto qdh = new Quarto(codigo, nome, local, preco, disponivel.equals("s"), avaliacao, tipo);
            agencia.adicionarAlojamento(qdh);
            System.out.println("Quarto de hotel adicionado com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private static void addCarro(Agencia agencia, Scanner scanner) {
        try {
            System.out.print("Código: ");
            String codigo = scanner.nextLine();
            System.out.print("Classe [A-F]: ");
            char classe = scanner.nextLine().charAt(0);
            System.out.print("Tipo [gasolina, disel, eletrico, hibrido]: ");
            String tipo = scanner.nextLine();
            System.out.print("Disponível [s/n]: ");
            String disponivel = scanner.nextLine();
            Carro car = new Carro(codigo, classe, tipo, disponivel.equals("s"));
            agencia.adicionarCarro(car);
            System.out.println("Carro adicionado com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private static void rmvAlojamento(Agencia agencia, Scanner scanner) {
        try {
            System.out.print("Código: ");
            String codigo = scanner.nextLine();
            agencia.removeAlojamentoPorCodigo(codigo);
            System.out.println("Alojamento removido com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private static void rmvCarro(Agencia agencia, Scanner scanner) {
        try {
            System.out.print("Código: ");
            String codigo = scanner.nextLine();
            agencia.removeCarroPorCodigo(codigo);
            System.out.println("Carro removido com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private static void checkIn(Agencia agencia, Scanner scanner) {
        try {
            System.out.print("Código: ");
            String codigo = scanner.nextLine();
            agencia.checkInPorCodigo(codigo);
            System.out.println("Check-in realizado com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private static void checkOut(Agencia agencia, Scanner scanner) {
        try {
            System.out.print("Código: ");
            String codigo = scanner.nextLine();
            agencia.checkOutPorCodigo(codigo);
            System.out.println("Check-out realizado com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private static void levantarCarro(Agencia agencia, Scanner scanner) {
        try {
            System.out.print("Código: ");
            String codigo = scanner.nextLine();
            agencia.levantarPorCodigo(codigo);
            System.out.println("Carro levantado com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private static void entregarCarro(Agencia agencia, Scanner scanner) {
        try {
            System.out.print("Código: ");
            String codigo = scanner.nextLine();
            agencia.entregarPorCodigo(codigo);
            System.out.println("Carro entregue com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private static void listarDados(Agencia agencia) {
        System.out.println("============ DADOS DA AGÊNCIA ============");
        System.out.println("Nome: " + agencia.getNome());
        System.out.println("Endereço: " + agencia.getMorada());
        System.out.println("=============== ALOJAMENTOS ==============");
        for (Alojamento alojamento : agencia.getAlojamentos()) {
            System.out.println(alojamento.toString());
        }
        System.out.println("================== Frota =================");
        for (Carro carro : agencia.getCarros()) {
            System.out.println(carro.toString());
        }
        System.out.println("==========================================");
    }
}