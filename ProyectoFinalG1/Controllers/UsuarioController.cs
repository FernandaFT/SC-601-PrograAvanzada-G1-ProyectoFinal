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
    public class UsuarioController : Controller
    {
        [SesionActiva]
        [PerfilAdmin]
        [HttpGet]
        public ActionResult Index(int pagina = 1)
        {
            int registrosPorPagina = 5;

            using (var context = new WaggyDBEntities())
            {
                var consulta = from u in context.usuario
                               join r in context.rol on u.consecutivoRol equals r.consecutivo
                               select new UsuarioModel
                               {
                                   Consecutivo = u.consecutivo,
                                   Identificacion = u.identificacion,
                                   Nombre = u.nombre,
                                   CorreoElectronico = u.correoElectronico,
                                   Telefono = u.telefono,
                                   Descripcion = r.descripcion,
                                   Estado = u.estado
                               };

                var totalRegistros = consulta.Count();
                var totalPaginas = (int)Math.Ceiling((double)totalRegistros / registrosPorPagina);

                // Validar que la página esté en el rango correcto
                pagina = Math.Max(1, Math.Min(pagina, totalPaginas == 0 ? 1 : totalPaginas));

                var datos = consulta
                    .OrderBy(u => u.Consecutivo)
                    .Skip((pagina - 1) * registrosPorPagina)
                    .Take(registrosPorPagina)
                    .ToList();

                ViewBag.PaginaActual = pagina;
                ViewBag.TotalPaginas = totalPaginas;

                return View(datos);
            }
        }

        #region CrearUsuario

        [HttpGet]
        public ActionResult Crear()
        {
            CargarRoles();
            return View();
        }

        [HttpPost]
        public ActionResult Crear(UsuarioModel modelo)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    CargarRoles();
                    return View(modelo);
                }

                using (var context = new WaggyDBEntities())
                {
                    var result = context.sp_CrearUsuario(
                        modelo.Identificacion,
                        modelo.Nombre,
                        modelo.CorreoElectronico,
                        modelo.Contrasenna,
                        modelo.Telefono,
                        modelo.Direccion,
                        modelo.ConsecutivoRol
                    );

                    return RedirectToAction("Index", "Usuario");
                }
            }
            catch (Exception ex)
            {
                string mensaje = ex.InnerException?.InnerException?.Message
                         ?? ex.InnerException?.Message
                         ?? ex.Message;

                if (mensaje.Contains("correo electrónico ya se encuentra registrado"))
                {
                    ModelState.AddModelError("CorreoElectronico", "El correo electrónico ya se encuentra registrado.");
                }
                else if (mensaje.Contains("identificación ya se encuentra registrada"))
                {
                    ModelState.AddModelError("Identificacion", "La identificación ya se encuentra registrada.");
                }
                else
                {
                    ViewBag.Error = mensaje;
                }

                CargarRoles();
                return View(modelo);
            }
        }

        private void CargarRoles()
        {
            using (var context = new WaggyDBEntities())
            {
                var roles = context.rol.Select(r => new SelectListItem
                {
                    Text = r.descripcion,
                    Value = r.consecutivo.ToString()
                }).ToList();

                ViewBag.Roles = roles;
            }
        }

        #endregion

        #region EditarUsuario
        [HttpGet]
        public ActionResult Editar(int id)
        {
            using (var context = new WaggyDBEntities())
            {
                var resultado = context.sp_ObtenerUsuarioPorId(id).FirstOrDefault();

                if (resultado == null) return HttpNotFound();

                var modelo = new UsuarioModel
                {
                    Consecutivo = resultado.consecutivo,
                    Identificacion = resultado.identificacion,
                    Nombre = resultado.nombre,
                    CorreoElectronico = resultado.correoElectronico,
                    Telefono = resultado.telefono,
                    Direccion = resultado.direccion,
                    ConsecutivoRol = resultado.consecutivoRol
                };

                CargarRoles();
                return View(modelo);
            }
        }

        [HttpPost]
        public ActionResult Editar(UsuarioModel modelo)
        {
            try
            {
                using (var context = new WaggyDBEntities())
                {
                    context.sp_EditarUsuario(
                        modelo.Consecutivo,
                        modelo.Nombre,
                        modelo.Telefono,
                        modelo.Direccion,
                        modelo.ConsecutivoRol
                    );

                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Error al actualizar el usuario: " + ex.Message;

                CargarRoles();
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
                context.sp_AlternarEstadoUsuario(id);

                return RedirectToAction("Index");
            }
        }
        #endregion
    }
}