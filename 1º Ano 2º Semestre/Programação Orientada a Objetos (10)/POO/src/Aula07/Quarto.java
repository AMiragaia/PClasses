package Aula07;

public class Quarto extends Alojamento {

    private String tipoQuarto;

    private void validateTipo(String tipoQuarto) {
        if (!tipoQuarto.toLowerCase().equals("single") &&
            !tipoQuarto.toLowerCase().equals("Double") && 
            !tipoQuarto.toLowerCase().equals("Twin") && 
            !tipoQuarto.toLowerCase().equals("Triple")) {
            throw new IllegalArgumentException("Tipo de quarto inválido");
        }
    }
    
    public Quarto(String codigo, String nome, String localizacao, double precoNoite, boolean disponibilidade, double avaliação, String tipoQuarto) {
        super(codigo, nome, localizacao, precoNoite, disponibilidade, avaliação);
        validateTipo(tipoQuarto);
        this.tipoQuarto = tipoQuarto;
        
    }

    public String getTipoQuarto() {
        return tipoQuarto;
    }

    public void setTipoQuarto(String tipoQuarto) {
        validateTipo(tipoQuarto);
        this.tipoQuarto = tipoQuarto;
    }
    
}