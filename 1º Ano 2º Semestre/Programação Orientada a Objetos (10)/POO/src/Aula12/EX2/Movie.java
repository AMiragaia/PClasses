package Aula12.EX2;

public class Movie {
    private String name;
    private double score;
    private String rating;
    private String genre;
    private int running_time;

    public Movie(String name, double score, String rating, String genre, int running_time) {
        this.name = name;
        this.score = score;
        this.rating = rating;
        this.genre = genre;
        this.running_time = running_time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getRunning_time() {
        return running_time;
    }

    public void setRunning_time(int running_time) {
        this.running_time = running_time;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "name='" + name + '\'' +
                ", score=" + score +
                ", rating='" + rating + '\'' +
                ", genre='" + genre + '\'' +
                ", running_time=" + running_time +
                '}';
    }
}
