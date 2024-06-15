public class Product
{
    public int ID { get; set; }
    public string Name { get; set; } = string.Empty; // Inicialização com valor padrão
    public float Price { get; set; }
    public string Sizes { get; set; } = string.Empty; // Inicialização com valor padrão
    public string Types { get; set; } = string.Empty; // Inicialização com valor padrão
    public int Store_ID { get; set; }
}
