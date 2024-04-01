package Aula05TP.EX1;

public class Book {
    private String title;
    private int pubYear;
    private String isbn;
    public Book(String title, int pubYear) {
        this.title = title;
        this.pubYear = pubYear;
    }
    public Book(String title, int pubYear, String isbn) {
        this.title = title;
        this.pubYear = pubYear;
        this.isbn = isbn;
    }
    public Book(String title) {
        this.title = title;
        
    }
    
    public void setISBN(String isbn) {
        this.isbn = isbn;
    }
    public String getISBN() {
        return isbn;
    }
    public String getTitle() {
        return title;
    }
    @Override
    public String toString() {
        return "Book{" + "title=" + title + ", pubYear=" + pubYear + ", isbn=" + isbn + '}';

        

    }
}
