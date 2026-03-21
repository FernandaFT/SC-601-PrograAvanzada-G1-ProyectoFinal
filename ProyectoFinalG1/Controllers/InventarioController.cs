using ProyectoFinalG1.EntityFramework;
using ProyectoFinalG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ProyectoFinalG1.Controllers
{
    public class InventarioController : Controller
    {
        #region Crear Inventario
        [HttpGet]
        public ActionResult Crear()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Crear(DateTime fecha, string observaciones)
        {
            try
            {
                using (var context = new WaggyDBEntities())
                {
                    var resultado = context.sp_CrearInventarioEnc(fecha, observaciones).FirstOrDefault();
                    int inventarioId = Convert.ToInt32(resultado.Value);

                    return RedirectToAction("Detalle", new { id = inventarioId });
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }
        }
        #endregion

        #region Lista el inventario
        [HttpGet]
        public ActionResult Listar()
        {
            using (var context = new WaggyDBEntities())
            {
                var datos = context.sp_ObtenerInventarios().ToList();

                var modelo = datos.Select(i => new InventarioEncViewModel
                {
                    ConsInventario = i.cons_inventario,
                    FecInventario = i.fec_inventario,
                    Observaciones = i.observaciones,
                    EstadoInv = i.estado_inv
                }).ToList();

                return View(modelo);
            }
        }
        #endregion

        #region Detalles del Inventario
        [HttpGet]
        public ActionResult Detalle(int id)
        {
            using (var context = new WaggyDBEntities())
            {
                var datos = context.sp_ObtenerInventarioDet(id)
                    .Select(d => new InventarioDetViewModel
                    {
                        ConsInventarioDet = (int)d.cons_inventario_det,
                        ConsInventario = (int)d.cons_inventario,
                        ConsProducto = (int)d.cons_producto,
                        NombreProducto = d.nombre_producto,
                        Imagen = d.imagen,
                        CantidadInventario = (int)d.cantidad_inventario,
                        StockActual = (int)d.stock_actual
                    }).ToList();

                ViewBag.InventarioId = id;
                return View(datos);
            }
        }

        [HttpPost]
        public ActionResult GuardarDetalle(int inventarioId)
        {
            try
            {
                using (var context = new WaggyDBEntities())
                {
                    foreach (string key in Request.Form.AllKeys)
                    {
                        if (key.StartsWith("cantidades["))
                        {
                            string productoIdTexto = key.Replace("cantidades[", "").Replace("]", "");
                            int consProducto = Convert.ToInt32(productoIdTexto);

                            string valorTexto = Request.Form[key];
                            int cantidad = Convert.ToInt32(valorTexto);

                            context.sp_GuardarInventarioDet(inventarioId, consProducto, cantidad);
                        }
                    }
                }

                return RedirectToAction("Detalle", new { id = inventarioId });
            }
            catch (Exception ex)
            {
                TempData["Error"] = ex.Message;
                return RedirectToAction("Detalle", new { id = inventarioId });
            }
        }
        #endregion

        #region Eliminar Inventario
        [HttpGet]
        public ActionResult Eliminar(int id)
        {
            using (var context = new WaggyDBEntities())
            {
                context.sp_EliminarInventario(id);
                return RedirectToAction("Listar");
            }
        }
        #endregion

        #region Aplicar el Inventario
        [HttpGet]
        public ActionResult AplicarInventario(int id)
        {
            using (var context = new WaggyDBEntities())
            {
                context.sp_AplicarInventario(id);
                return RedirectToAction("Listar");
            }
        }
        #endregion
    }
}