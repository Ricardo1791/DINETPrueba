using Microsoft.AspNetCore.Mvc;
using System.Diagnostics.CodeAnalysis;
using WebApplication1.Interfaces;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MovInventarioController: ControllerBase
    {
        private readonly IMovInventarioRepository inventarioRepo;

        public MovInventarioController(IMovInventarioRepository inventarioRepo)
        {
            this.inventarioRepo = inventarioRepo;
        }


        [HttpPost("registrarInventario")]
        public async Task<IActionResult> registrarInventario([FromBody] MovInventarioDTO model)
        {
            var respuesta = await inventarioRepo.registrarMovInventario(model);

            return Ok(respuesta);
        }

        [HttpPost("actualizarInventario")]
        public async Task<IActionResult> actualizarInventario([FromBody] MovInventarioDTO model)
        {
            var respuesta = await inventarioRepo.actualizarMovInventario(model);

            return Ok(respuesta);
        }

        [HttpGet]
        public async Task<IActionResult> listarInventario([FromQuery] MovInventarioFiltroDTO model)
        {
            var lista = await inventarioRepo.listarMovInventario(model);

            return Ok(lista);
        }
    }
}
