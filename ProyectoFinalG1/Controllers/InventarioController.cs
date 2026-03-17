using ProyectoFinalG1.EntityFramework;
using System;
using System.Linq;
using System.Web.Mvc;

namespace ProyectoFinalG1.Controllers
{
    public class InventarioController : Controller
    {
        // =========================
        // VER INVENTARIO
        // =========================
        public ActionResult Index()
        {
            using (var context = new WaggyDBEntities2())
            {
                var datos = context.SP_ConsultarStock().ToList();
                return View(datos);
            }
        }

        // =========================
        // ENTRADA INVENTARIO
        // =========================
        [HttpGet]
        public ActionResult Entrada()
        {
            using (var context = new WaggyDBEntities2())
            {
                ViewBag.Productos = context.productos.ToList();
                return View();
            }
        }

        [HttpPost]
        public ActionResult Entrada(int consec_producto, int cantidad)
        {
            using (var context = new WaggyDBEntities2())
            {
                context.SP_EntradaInventario(consec_producto, cantidad);
                return RedirectToAction("Index");
            }
        }

        // =========================
        // SALIDA INVENTARIO
        // =========================
        [HttpGet]
        public ActionResult Salida()
        {
            using (var context = new WaggyDBEntities2())
            {
                ViewBag.Productos = context.productos.ToList();
                return View();
            }
        }

        [HttpPost]
        public ActionResult Salida(int consec_producto, int cantidad)
        {
            using (var context = new WaggyDBEntities2())
            {
                var stock = context.SP_ConsultarStock()
                                   .FirstOrDefault(x => x.cons_producto == consec_producto);

                if (stock != null && stock.existencia >= cantidad)
                {
                    context.SP_SalidaInventario(consec_producto, cantidad);
                }
                else
                {
                    ViewBag.Error = "No hay suficiente inventario";
                    ViewBag.Productos = context.productos.ToList();
                    return View();
                }

                return RedirectToAction("Index");
            }
        }
     
        [HttpPost]
        public ActionResult RegistrarVenta(int productoId, int cantidad)
        {
            try
            {
                using (var context = new WaggyDBEntities2())
                {
                    context.SP_RegistrarVenta(productoId, cantidad);
                }

                TempData["Mensaje"] = "Venta realizada correctamente";
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Stock"))
                {
                    TempData["Error"] = "Stock insuficiente";
                }
                else
                {
                    TempData["Error"] = "Error al registrar la venta";
                }
            }

            return RedirectToAction("Index");
        }
    }


}
