using Microsoft.AspNetCore.Mvc;
using System.Diagnostics.CodeAnalysis;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductosController: ControllerBase
    {
        private readonly IProductosRepository _productosRepo;

        public ProductosController(IProductosRepository productosRepo)
        {
            _productosRepo = productosRepo;
        }


        [HttpGet]
        public async Task<IActionResult> obtenerProductos()
        {
            var productos = await _productosRepo.listarProductos();

            return Ok(productos);
        }

        [HttpPost]
        public async Task<IActionResult> registrarProductos([FromBody] ProductosDTO model)
        {
            var respuesta = await _productosRepo.registrarProducto(model);

            return Ok(respuesta);
        }

    }
}
