public class Reserva {
    private PacoteTuristico pacote;
    private int pessoas;
    public Reserva(PacoteTuristico pacote, int pessoas){
        this.pacote = pacote;
        this.pessoas = pessoas;
    }
    public PacoteTuristico getPacote() {
        return pacote;
    }
    public int getPessoas() {
        return pessoas;
    }
    public String toString() {
        return "Reserva: " + pacote + " - " + pessoas + " pessoas";
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Reserva reserva = (Reserva) o;
        return pessoas == reserva.pessoas &&
                Objects.equals(pacote, reserva.pacote);
    }
    
}
