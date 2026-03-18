using ProyectoFinalG1.EntityFramework;
using ProyectoFinalG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace ProyectoFinalG1.Controllers
{
    public class ProductoController : Controller
    {
        [HttpGet]
        public ActionResult Index(int pagina = 1)
        {
            int registrosPorPagina = 5;

            using (var context = new WaggyDBEntities())
            {
                var resultado = context.sp_ListarProductos().ToList();

                var totalRegistros = resultado.Count();
                var totalPaginas = (int)Math.Ceiling((double)totalRegistros / registrosPorPagina);

                var datos = resultado
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
                        NombreCategoria = p.nombre_categoria,
                        TipoMascota = p.tipo_mascota
                    })
                    .Skip((pagina - 1) * registrosPorPagina)
                    .Take(registrosPorPagina)
                    .ToList();

                ViewBag.PaginaActual = pagina;
                ViewBag.TotalPaginas = totalPaginas;

                return View(datos);
            }
        }

        #region CrearProducto

        [HttpGet]
        public ActionResult Crear()
        {
            CargarCategorias();
            CargarTiposMascota();
            return View();
        }

        [HttpPost]
        public ActionResult Crear(ProductoModel modelo)
        {
            try
            {
                using (var context = new WaggyDBEntities())
                {
                    context.sp_CrearProducto(
                        modelo.NombreProducto,
                        modelo.DescripcionProducto,
                        modelo.Imagen,
                        modelo.Precio,
                        modelo.UnidadMedida,
                        modelo.Existencia,
                        modelo.ExistenciaMin,
                        modelo.ExistenciaMax,
                        modelo.ConsCategoria,
                        modelo.TipoMascota
                    );

                    return RedirectToAction("Index", "Producto");
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                CargarCategorias();
                CargarTiposMascota();
                return View(modelo);
            }
        }

        #endregion

        #region Categoría
        [HttpGet]
        public ActionResult Categoria(int id, int pagina = 1)
        {
            int registrosPorPagina = 16;

            using (var context = new WaggyDBEntities())
            {
                var resultado = context.sp_ObtenerProductosHomePorCategoria(id, 1000).ToList();

                var totalRegistros = resultado.Count();
                var totalPaginas = (int)Math.Ceiling((double)totalRegistros / registrosPorPagina);

                var datos = resultado
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
                    })
                    .Skip((pagina - 1) * registrosPorPagina)
                    .Take(registrosPorPagina)
                    .ToList();

                ViewBag.CategoriaId = id;
                ViewBag.PaginaActual = pagina;
                ViewBag.TotalPaginas = totalPaginas;

                ViewBag.NombreCategoria =
                    id == 1 ? "Alimentos" :
                    id == 2 ? "Ropa" :
                    id == 3 ? "Accesorios" : "Productos";

                return View(datos);
            }
        }
        #endregion

        #region EditarProducto

        [HttpGet]
        public ActionResult Editar(int id)
        {
            using (var context = new WaggyDBEntities())
            {
                var resultado = context.sp_ObtenerProductoPorId(id).FirstOrDefault();

                if (resultado == null)
                    return HttpNotFound();

                var modelo = new ProductoModel
                {
                    ConsecutivoProducto = resultado.cons_producto,
                    NombreProducto = resultado.nombre_producto,
                    DescripcionProducto = resultado.descripcion_producto,
                    Imagen = resultado.imagen,
                    Precio = resultado.precio ?? 0,
                    UnidadMedida = resultado.unidad_medida,
                    Existencia = resultado.existencia,
                    ExistenciaMin = resultado.existenciamin,
                    ExistenciaMax = resultado.existenciamax,
                    Estado = resultado.estado,
                    RegistroProd = resultado.registro_prod,
                    ConsCategoria = resultado.cons_categoria,
                    TipoMascota = resultado.tipo_mascota
                };

                CargarCategorias();
                CargarTiposMascota();
                return View(modelo);
            }
        }

        [HttpPost]
        public ActionResult Editar(ProductoModel modelo)
        {
            try
            {
                using (var context = new WaggyDBEntities())
                {
                    context.sp_EditarProducto(
                        modelo.ConsecutivoProducto,
                        modelo.NombreProducto,
                        modelo.DescripcionProducto,
                        modelo.Imagen,
                        modelo.Precio,
                        modelo.UnidadMedida,
                        modelo.Existencia,
                        modelo.ExistenciaMin,
                        modelo.ExistenciaMax,
                        modelo.ConsCategoria,
                        modelo.TipoMascota
                    );

                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Error al actualizar el producto: " + ex.Message;
                CargarCategorias();
                CargarTiposMascota();
                return View(modelo);
            }
        }

        #endregion

        #region CambiarEstado

        [HttpGet]
        public ActionResult CambiarEstado(int id)
        {
            using (var context = new WaggyDBEntities())
            {
                context.sp_AlternarEstadoProducto(id);
                return RedirectToAction("Index");
            }
        }

        #endregion

        private void CargarCategorias()
        {
            using (var context = new WaggyDBEntities())
            {
                var categorias = context.categoria
                    .Where(c => c.estado == true)
                    .Select(c => new SelectListItem
                    {
                        Text = c.nombre_categoria,
                        Value = c.cons_categoria.ToString()
                    }).ToList();

                ViewBag.Categorias = categorias;
            }
        }

        private void CargarTiposMascota()
        {
            var tipos = new List<SelectListItem>()
            {
                new SelectListItem { Text = "Perro", Value = "Perro" },
                new SelectListItem { Text = "Gato", Value = "Gato" },
                new SelectListItem { Text = "General", Value = "General" }
            };

            ViewBag.TiposMascota = tipos;
        }

    }
}