using ProyectoFinalG1.EntityFramework;
using ProyectoFinalG1.Filters;
using ProyectoFinalG1.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace ProyectoFinalG1.Controllers
{
    public class ExistenciasController : Controller
    {
        [SesionActiva]
        [PerfilAdmin]
        [HttpGet]
        public ActionResult Index(int pagina = 1)
        {
            int registrosPorPagina = 5;

            using (var context = new WaggyDBEntities())
            {
                var resultado = context.sp_ConsultarExistencias(null).ToList();

                var totalRegistros = resultado.Count();
                var totalPaginas = (int)Math.Ceiling((double)totalRegistros / registrosPorPagina);

                var datos = resultado
                    .Select(p => new ExistenciasModel
                    {
                        ConsecutivoProducto = p.cons_producto,
                        NombreProducto = p.nombre_producto,
                        Existencia = p.existencia,
                        ExistenciaMin = p.existenciamin,
                        ExistenciaMax = p.existenciamax
                    })
                    .Skip((pagina - 1) * registrosPorPagina)
                    .Take(registrosPorPagina)
                    .ToList();

                ViewBag.PaginaActual = pagina;
                ViewBag.TotalPaginas = totalPaginas;

                return View(datos);
            }
        }

        [HttpPost]
        public ActionResult Index(bool? BajoMinimo, int pagina = 1)
        {
            int registrosPorPagina = 5;

            using (var context = new WaggyDBEntities())
            {
                var resultado = context.sp_ConsultarExistencias(BajoMinimo).ToList();

                var totalRegistros = resultado.Count();
                var totalPaginas = (int)Math.Ceiling((double)totalRegistros / registrosPorPagina);

                var datos = resultado
                    .Select(p => new ExistenciasModel
                    {
                        ConsecutivoProducto = p.cons_producto,
                        NombreProducto = p.nombre_producto,
                        Existencia = p.existencia,
                        ExistenciaMin = p.existenciamin,
                        ExistenciaMax = p.existenciamax
                    })
                    .Skip((pagina - 1) * registrosPorPagina)
                    .Take(registrosPorPagina)
                    .ToList();

                ViewBag.PaginaActual = pagina;
                ViewBag.TotalPaginas = totalPaginas;

                return View(datos);
            }
        }
    }
}