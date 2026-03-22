using ProyectoFinalG1.EntityFramework;
using ProyectoFinalG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ProyectoFinalG1.Controllers
{
    public class CarritoController : Controller
    {
        private const decimal IMPUESTO = 0.13m;

        #region Métodos Privados

        private List<CarritoItemModel> ObtenerCarrito()
        {
            var carrito = Session["Carrito"] as List<CarritoItemModel>;

            if (carrito == null)
            {
                carrito = new List<CarritoItemModel>();
            }

            return carrito;
        }

        private void GuardarCarrito(List<CarritoItemModel> carrito)
        {
            Session["Carrito"] = carrito;
        }

        private int ObtenerConsecutivoUsuario()
        {
            if (Session["Consecutivo"] == null)
            {
                return 0;
            }

            return Convert.ToInt32(Session["Consecutivo"]);
        }

        private void CargarCarritoDesdeBD()
        {
            int consecutivoUsuario = ObtenerConsecutivoUsuario();

            if (consecutivoUsuario == 0)
            {
                return;
            }

            using (var context = new WaggyDBEntities())
            {
                var datos = context.sp_ConsultarCarritoUsuario(consecutivoUsuario).ToList();

                var carrito = new List<CarritoItemModel>();

                foreach (var p in datos)
                {
                    var item = new CarritoItemModel();

                    item.ConsecutivoProducto = p.cons_producto;
                    item.NombreProducto = p.nombre_producto;
                    item.Imagen = p.imagen;

                    if (p.precio == null)
                    {
                        item.Precio = 0;
                    }
                    else
                    {
                        item.Precio = p.precio.Value;
                    }

                    item.Cantidad = p.cantidad;
                    item.Existencia = p.existencia;

                    carrito.Add(item);
                }

                GuardarCarrito(carrito);
            }
        }

        #endregion

        #region Consultar Carrito

        [HttpGet]
        public ActionResult Index()
        {
            if (Session["Consecutivo"] != null)
            {
                if (Session["Carrito"] == null)
                {
                    CargarCarritoDesdeBD();
                }
            }

            var carrito = ObtenerCarrito();

            decimal subtotal = 0;

            foreach (var item in carrito)
            {
                subtotal += item.Subtotal;
            }

            decimal impuesto = subtotal * IMPUESTO;
            decimal total = subtotal + impuesto;

            ViewBag.Subtotal = subtotal;
            ViewBag.Impuesto = impuesto;
            ViewBag.Total = total;

            return View(carrito);
        }

        #endregion

        #region Agregar Producto al Carrito

        [HttpGet]
        public ActionResult Agregar(int idProducto, int cantidad = 1)
        {
            int consecutivoUsuario = ObtenerConsecutivoUsuario();

            if (consecutivoUsuario == 0)
            {
                TempData["MensajeCarrito"] = "Debe iniciar sesión.";
                return RedirectToAction("InicioSesion", "Home");
            }

            using (var context = new WaggyDBEntities())
            {
                var producto = context.sp_ObtenerProductoPorId(idProducto).FirstOrDefault();

                if (producto == null || producto.estado == false)
                {
                    TempData["MensajeCarrito"] = "Producto no disponible.";
                    return RedirectToAction("Index");
                }

                var carrito = ObtenerCarrito();
                var existente = carrito.FirstOrDefault(p => p.ConsecutivoProducto == idProducto);

                if (existente != null)
                {
                    if ((existente.Cantidad + cantidad) > producto.existencia)
                    {
                        TempData["MensajeCarrito"] = "Sin inventario.";
                        return RedirectToAction("Index");
                    }

                    existente.Cantidad += cantidad;
                }
                else
                {
                    if (cantidad > producto.existencia)
                    {
                        TempData["MensajeCarrito"] = "Sin inventario.";
                        return RedirectToAction("Index");
                    }

                    var nuevo = new CarritoItemModel();

                    nuevo.ConsecutivoProducto = producto.cons_producto;
                    nuevo.NombreProducto = producto.nombre_producto;
                    nuevo.Imagen = producto.imagen;

                    if (producto.precio == null)
                    {
                        nuevo.Precio = 0;
                    }
                    else
                    {
                        nuevo.Precio = producto.precio.Value;
                    }

                    nuevo.Cantidad = cantidad;
                    nuevo.Existencia = producto.existencia;

                    carrito.Add(nuevo);
                }

                GuardarCarrito(carrito);

                context.sp_AgregarProductoCarrito(consecutivoUsuario, idProducto, cantidad);
            }

            return RedirectToAction("Index");
        }

        #endregion

        #region Actualizar Cantidad

        [HttpPost]
        public ActionResult Actualizar(int idProducto, int cantidad)
        {
            int consecutivoUsuario = ObtenerConsecutivoUsuario();

            if (consecutivoUsuario == 0)
            {
                return RedirectToAction("InicioSesion", "Home");
            }

            using (var context = new WaggyDBEntities())
            {
                var carrito = ObtenerCarrito();
                var item = carrito.FirstOrDefault(p => p.ConsecutivoProducto == idProducto);

                if (item == null)
                {
                    return RedirectToAction("Index");
                }

                var producto = context.sp_ObtenerProductoPorId(idProducto).FirstOrDefault();

                if (producto == null || producto.estado == false)
                {
                    return RedirectToAction("Index");
                }

                if (cantidad <= 0)
                {
                    carrito.RemoveAll(p => p.ConsecutivoProducto == idProducto);
                    context.sp_EliminarProductoCarrito(consecutivoUsuario, idProducto);
                }
                else
                {
                    if (cantidad > producto.existencia)
                    {
                        return RedirectToAction("Index");
                    }

                    item.Cantidad = cantidad;

                    context.sp_ActualizarCantidadCarrito(consecutivoUsuario, idProducto, cantidad);
                }

                GuardarCarrito(carrito);
            }

            return RedirectToAction("Index");
        }

        #endregion

        #region Eliminar Producto del Carrito

        [HttpGet]
        public ActionResult Eliminar(int idProducto)
        {
            int consecutivoUsuario = ObtenerConsecutivoUsuario();

            if (consecutivoUsuario == 0)
            {
                return RedirectToAction("InicioSesion", "Home");
            }

            var carrito = ObtenerCarrito();
            carrito.RemoveAll(p => p.ConsecutivoProducto == idProducto);
            GuardarCarrito(carrito);

            using (var context = new WaggyDBEntities())
            {
                context.sp_EliminarProductoCarrito(consecutivoUsuario, idProducto);
            }

            return RedirectToAction("Index");
        }

        #endregion

        #region Confirmar Compra

        [HttpPost]
        public ActionResult ConfirmarCompra()
        {
            int consecutivoUsuario = ObtenerConsecutivoUsuario();

            if (consecutivoUsuario == 0)
            {
                TempData["MensajeCarrito"] = "Debe iniciar sesión para completar la compra.";
                return RedirectToAction("InicioSesion", "Home");
            }

            var carrito = ObtenerCarrito();

            if (carrito.Count == 0)
            {
                TempData["MensajeCarrito"] = "El carrito está vacío.";
                return RedirectToAction("Index");
            }

            using (var context = new WaggyDBEntities())
            {
                decimal subtotal = 0;

                foreach (var item in carrito)
                {
                    var producto = context.sp_ObtenerProductoPorId(item.ConsecutivoProducto).FirstOrDefault();

                    if (producto == null || producto.estado == false)
                    {
                        TempData["MensajeCarrito"] = "Uno de los productos ya no está disponible.";
                        return RedirectToAction("Index");
                    }

                    if (item.Cantidad > producto.existencia)
                    {
                        TempData["MensajeCarrito"] = "No hay inventario suficiente para el producto " + item.NombreProducto + ".";
                        return RedirectToAction("Index");
                    }

                    subtotal += item.Subtotal;
                }

                decimal impuesto = subtotal * IMPUESTO;
                decimal total = subtotal + impuesto;

                var venta = context.sp_RegistrarVentaEnc(consecutivoUsuario, subtotal, impuesto, total).FirstOrDefault();
                int consVenta = Convert.ToInt32(venta);

                foreach (var item in carrito)
                {
                    decimal montoLinea = item.Subtotal;
                    decimal impuestoLinea = montoLinea * IMPUESTO;
                    decimal montoNetoLinea = montoLinea + impuestoLinea;

                    context.sp_RegistrarVentaDet(
                        consVenta,
                        item.ConsecutivoProducto,
                        item.Cantidad,
                        montoLinea,
                        impuestoLinea,
                        montoNetoLinea
                    );

                    context.sp_ActualizarExistenciaProducto(
                        item.ConsecutivoProducto,
                        item.Cantidad
                    );
                }

                context.sp_LimpiarCarrito(consecutivoUsuario);

                Session["Carrito"] = null;
                TempData["MensajeCarrito"] = "Compra realizada con éxito.";
            }

            return RedirectToAction("Index");
        }

        #endregion
    }
}