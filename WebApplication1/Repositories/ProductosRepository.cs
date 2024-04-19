using Dapper;
using System.Data.SqlClient;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Repositories
{
    public class ProductosRepository : IProductosRepository
    {
        private readonly IConfiguration configuration;

        public ProductosRepository(IConfiguration configuration)
        {
            this.configuration = configuration;
        }


        public async Task<List<ProductosDTO>> listarProductos()
        {
            var sql = "select * from productos";

            using var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));

            var respuesta = await connection.QueryAsync<ProductosDTO>(sql);

            return respuesta.ToList();
        }

        public async Task<Respuesta<int>> registrarProducto(ProductosDTO model)
        {
            var sql = "EXEC USP_INS_PRODUCTO @nombre, @precio";

            var parametros = new
            {
                model.nombre,
                model.precio
            };

            using var connection = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));

            var respuesta =  await connection.QueryAsync<Respuesta<int>>(sql, parametros);

            return respuesta.First();
        }
    }
}
