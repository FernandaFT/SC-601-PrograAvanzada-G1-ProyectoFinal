using ProyectoFinalG1.EntityFramework;
using ProyectoFinalG1.Filters;
using ProyectoFinalG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoFinalG1.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            var modelo = new HomeModel
            {
                ProductosAlimentos = ObtenerProductosPorCategoria(1, 4),
                ProductosRopa = ObtenerProductosPorCategoria(2, 4),
                ProductosAccesorios = ObtenerProductosPorCategoria(3, 4)
            };

            return View(modelo);
        }

        private List<ProductoModel> ObtenerProductosPorCategoria(int categoriaId, int cantidad)
        {
            using (var context = new WaggyDBEntities())
            {
                return context.sp_ObtenerProductosHomePorCategoria(categoriaId, cantidad)
                    .ToList()
                    .Select(p => new ProductoModel
                    {
                        ConsecutivoProducto = p.cons_producto,
                        NombreProducto = p.nombre_producto,
                        DescripcionProducto = p.descripcion_producto,
                        Imagen = p.imagen,
                        Precio = p.precio ?? 0,
                        UnidadMedida = p.unidad_medida,
                        Existencia = p.existencia,
                        ExistenciaMin = p.existenciamin,
                        ExistenciaMax = p.existenciamax,
                        Estado = p.estado,
                        RegistroProd = p.registro_prod,
                        ConsCategoria = p.cons_categoria,
                        TipoMascota = p.tipo_mascota
                    }).ToList();
            }
        }

        #region InicioSesion

        [HttpGet]
        public ActionResult InicioSesion()
        {
            return View();
        }

        [HttpPost]
        public ActionResult InicioSesion(UsuarioModel modelo)
        {
            using (var context = new WaggyDBEntities())
            {
                var result = context.sp_IniciarSesion(modelo.CorreoElectronico, modelo.Contrasenna)
                                    .FirstOrDefault();

                if (result == null)
                {
                    var usuarioInactivo = context.usuario
                                                 .FirstOrDefault(u => u.correoElectronico == modelo.CorreoElectronico);

                    if (usuarioInactivo != null && usuarioInactivo.estado == false)
                    {
                        ViewBag.Mensaje = "Su usuario está inactivo. Comuníquese con el administrador.";
                    }
                    else
                    {
                        ViewBag.Mensaje = "Su información no se autenticó correctamente.";
                    }

                    return View(modelo);
                }

                var usuario = context.usuario
                                     .FirstOrDefault(u => u.correoElectronico == modelo.CorreoElectronico);

                if (usuario != null)
                {
                    Session["Consecutivo"] = usuario.consecutivo;

                    var datos = context.sp_ConsultarCarritoUsuario(usuario.consecutivo).ToList();

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

                    Session["Carrito"] = carrito;
                }

                Session["Nombre"] = result.nombre;
                Session["Rol"] = result.rol;

                return RedirectToAction("Index", "Home");
            }
        }

        #endregion

        #region Registrar Usuario
        [HttpGet]
        public ActionResult Registro()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Registro(UsuarioModel model)
        {
            return View();
        }
        #endregion

        #region Recuperar Contraseña
        [HttpGet]
        public ActionResult RecuperarContrasenna()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RecuperarContrasenna(UsuarioModel modelo)
        {
            return View();
        }
        #endregion

        #region Cerrar Sesión
        [SesionActiva]
        [HttpGet]
        public ActionResult CerrarSesion()
        {
            Session.Clear();
            return RedirectToAction("InicioSesion", "Home");
        }
        #endregion

        public ActionResult SobreNosotros()
        {
            return View();
        }
    }
}