public class Roles
{
    public int RoleId { get; set; }
    public string RoleDescription { get; set; } = string.Empty; // Inicialização com valor padrão
    public int Coach_CCNumber { get; set; }
    public int Contract_ID { get; set; }
    public DateTime Data_Inicio { get; set; }
    public DateTime Data_Fim { get; set; }
}
