using WebApplication1.Models;

namespace WebApplication1.Interfaces
{
    public interface IMovInventarioRepository
    {
        Task<Respuesta<int>> registrarMovInventario(MovInventarioDTO model);
        Task<Respuesta<int>> actualizarMovInventario(MovInventarioDTO model);
        Task<List<MovInventarioDTO>> listarMovInventario(MovInventarioFiltroDTO model);
    }
}
