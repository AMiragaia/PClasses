public class Team
{
    public int ID { get; set; }
    public string Name { get; set; } = string.Empty; // Inicialização com valor padrão
    public string Region { get; set; } = string.Empty; // Inicialização com valor padrão
    public float Total_Earnings { get; set; }
    public string Sponsors { get; set; } = string.Empty; // Inicialização com valor padrão
    public int? Coach_CCNumber { get; set; }

    public int leagueID { get; set; }
}
