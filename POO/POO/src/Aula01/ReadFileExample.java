package Aula01;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


public class ReadFileExample {

	public static void main(String[] args) {
		Path fich = Paths.get("major.txt"); // obter o ficheiro major.txt 
		try {
			Files.readAllLines(fich).stream().forEach(System.out::println); // da read de todas as linhas e depois da print de cada uma delas
		} catch (IOException e) {
			System.out.println("Certifique-se que o ficheiro \"major.txt\" está na raiz da pasta do projeto"); // se o ficheiro não estiver na raiz da pasta do projeto esta mensagem será exibida
		}
	}
	
}
