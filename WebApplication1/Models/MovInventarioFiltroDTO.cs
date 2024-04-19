using System.Diagnostics.CodeAnalysis;

namespace WebApplication1.Models
{
    public class MovInventarioFiltroDTO
    {
        public string? fechainicio { get; set; }
        public string? fechafin { get; set; }
        public string? tipoMovimiento { get; set; }
        public string? nroDocumento { get; set; }
    }
}
