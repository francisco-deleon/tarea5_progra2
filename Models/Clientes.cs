namespace ApiEmpresa.Models;

public class Clientes
{
    public Int32 Id { get; set; }
    public string? Nombres { get; set; }
    public string? Apellidos { get; set; }
    public string? Direccion { get; set; }
    public string? Telefono { get; set; }
    public DateTime? FechaNacimiento { get; set; }
}