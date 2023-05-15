package Aula11.extra;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;
import java.io.*;
import java.util.Map;
import java.util.HashMap;

public class RandomBooks {
    private Map<Person, List<Book>> readers = new HashMap<>();
    private List<Book> books = new ArrayList<>();
    //output file should be like this:
    //Reader Name(id):
    //      Book Title, by Author, (Year) (times read)

    public RandomBooks() {
        try {
            Scanner sc = new Scanner(new File("/UA/POO/POO/src/Aula11/extra/books.csv"));
            while (sc.hasNextLine()) {
                String[] line = sc.nextLine().split(";");
                books.add(new Book(line[0], line[1], Integer.parseInt(line[2])));
            }
            sc.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void getRandomBook(Person reader) {
        List<Book> readerBooks = readers.get(reader);
        if (readerBooks == null) {
            readerBooks = new ArrayList<>();
            readers.put(reader, readerBooks);
        }
    }

    public int timesRead(Person reader) {
        List<Book> readerBooks = readers.get(reader);
        if (readerBooks == null) {
            readerBooks = new ArrayList<>();
            readers.put(reader, readerBooks);
        }
        int x = readerBooks.size();
        return x;
    }
    
    public void listReaders() {
        for (Person reader : readers.keySet()) {
            System.out.println(reader.getName() + "(" + reader.getCc() + "):");
            for (Book book : readers.get(reader)) {
                System.out.println("\t" + book.getTitle() + ", by " + book.getAuthor() + ", (" + book.getYear() + ") (" + timesRead(reader) + ")");
            }
        }
    }

    
    
    
}
