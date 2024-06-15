public class Game
{
    public int ID { get; set; }
    public string Name { get; set; } = string.Empty; // Inicialização com valor padrão
    public int Team_ID { get; set; }
    public DateTime Date { get; set; }
    public string Winner { get; set; } = string.Empty; // Inicialização com valor padrão
}
