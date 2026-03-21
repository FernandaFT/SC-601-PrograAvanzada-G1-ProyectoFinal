using ProyectoFinalG1.EntityFramework;
using ProyectoFinalG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ProyectoFinalG1.Controllers
{
    #region ConsultaVentas
    public class VentasController : Controller
    {
        [HttpGet]
        public ActionResult Index(int pagina = 1)
        {
            int registrosPorPagina = 5;

            using (var context = new WaggyDBEntities())
            {
                var resultado = context.sp_ConsultarVentas(null, null, null, null).ToList();

                var totalRegistros = resultado.Count();
                var totalPaginas = (int)Math.Ceiling((double)totalRegistros / registrosPorPagina);

                var datos = resultado
                    .Select(v => new VentasModel
                    {
                        ConsecutivoVenta = v.cons_venta.Value,
                        FechaVenta = v.fec_venta.Value,
                        NombreCliente = v.nombre,
                        NombreProducto = v.nombre_producto,
                        Cantidad = v.cantidad.Value,
                        MontoLinea = v.monto_neto_linea.Value,
                        MontoTotal = v.monto_venta_net.Value
                    })
                    .Skip((pagina - 1) * registrosPorPagina)
                    .Take(registrosPorPagina)
                    .ToList();

                ViewBag.PaginaActual = pagina;
                ViewBag.TotalPaginas = totalPaginas;

                CargarProductos();
                CargarUsuarios();

                return View(datos);
            }
        }

        [HttpPost]
        public ActionResult Index(DateTime? FechaInicio, DateTime? FechaFin, int? IdUsuario, int? IdProducto, int pagina = 1)
        {
            int registrosPorPagina = 5;

            using (var context = new WaggyDBEntities())
            {
                var resultado = context.sp_ConsultarVentas(
                    FechaInicio,
                    FechaFin,
                    IdUsuario,
                    IdProducto
                ).ToList();

                var totalRegistros = resultado.Count();
                var totalPaginas = (int)Math.Ceiling((double)totalRegistros / registrosPorPagina);

                var datos = resultado
                    .Select(v => new VentasModel
                    {
                        ConsecutivoVenta = v.cons_venta.Value,
                        FechaVenta = v.fec_venta.Value,
                        NombreCliente = v.nombre,
                        NombreProducto = v.nombre_producto,
                        Cantidad = v.cantidad.Value,
                        MontoLinea = v.monto_neto_linea.Value,
                        MontoTotal = v.monto_venta_net.Value
                    })
                    .Skip((pagina - 1) * registrosPorPagina)
                    .Take(registrosPorPagina)
                    .ToList();

                ViewBag.PaginaActual = pagina;
                ViewBag.TotalPaginas = totalPaginas;

                CargarProductos();
                CargarUsuarios();

                return View(datos);
            }
        }

        private void CargarProductos()
        {
            using (var context = new WaggyDBEntities())
            {
                var datos = context.productos
                    .Where(p => p.estado == true)
                    .Select(p => new SelectListItem
                    {
                        Text = p.nombre_producto,
                        Value = p.cons_producto.ToString()
                    }).ToList();

                ViewBag.Productos = datos;
            }
        }

        private void CargarUsuarios()
        {
            using (var context = new WaggyDBEntities())
            {
                var datos = context.usuario
                    .Where(u => u.estado == true)
                    .Select(u => new SelectListItem
                    {
                        Text = u.nombre,
                        Value = u.consecutivo.ToString()
                    }).ToList();

                ViewBag.Usuarios = datos;
            }
        }
    }
}
    #endregion