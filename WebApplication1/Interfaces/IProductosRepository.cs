using WebApplication1.Models;

namespace WebApplication1.Interfaces
{
    public interface IProductosRepository
    {
        Task<Respuesta<int>> registrarProducto(ProductosDTO model);
        Task<List<ProductosDTO>> listarProductos();
    }
}
