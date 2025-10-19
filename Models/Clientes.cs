namespace ApiEmpresa.Models;

using System.ComponentModel.DataAnnotations; // Agregar esta directiva de Entity Framework para usar [Key]

public class Clientes
{
    [Key]
    public Int32 IdCliente { get; set; }
    public string? Nombres { get; set; }
    public string? Apellidos { get; set; }
    public string? Direccion { get; set; }
    public string? Telefono { get; set; }
    public DateTime? FechaNacimiento { get; set; }
}