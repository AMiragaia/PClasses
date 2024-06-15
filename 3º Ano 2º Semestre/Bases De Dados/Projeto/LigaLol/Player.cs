public class Player
{
    public int CCNumber { get; set; }
    public string Nickname { get; set; } = string.Empty; // Inicialização com valor padrão
    public string RealName { get; set; } = string.Empty; // Inicialização com valor padrão
    public string Roles { get; set; } = string.Empty; // Inicialização com valor padrão
    public string Ranks { get; set; } = string.Empty; // Inicialização com valor padrão
    public string MainChampion { get; set; } = string.Empty; // Inicialização com valor padrão
    public double Earnings { get; set; }

    public override string ToString()
    {
        return Nickname;
    }
  
}
