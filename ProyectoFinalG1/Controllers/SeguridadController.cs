using ProyectoFinalG1.EntityFramework;
using ProyectoFinalG1.Filters;
using ProyectoFinalG1.Models;
using ProyectoFinalG1.Services;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace ProyectoFinalG1.Controllers
{
    [SesionActiva]
    public class SeguridadController : Controller
    {
        readonly Generales generales = new Generales();

        #region Cambiar Perfil
        [SesionActiva]
        [HttpGet]
        public ActionResult CambiarPerfil()
        {
            try
            {
                using (var context = new WaggyDBEntities())
                {
                    int consecutivo = int.Parse(Session["Consecutivo"].ToString());

                    var result = context.usuario.FirstOrDefault(u => u.consecutivo == consecutivo);

                    if (result == null)
                    {
                        ViewBag.Error = "No se encontró la información del usuario.";
                        return View(new PerfilModel());
                    }

                    var modelo = new PerfilModel
                    {
                        Identificacion = result.identificacion,
                        Nombre = result.nombre,
                        CorreoElectronico = result.correoElectronico,
                        Telefono = result.telefono,
                        Direccion = result.direccion
                    };

                    return View(modelo);
                }

            }
            catch (Exception ex)
            {
                ViewBag.Error = "Ocurrió un error al cargar el perfil: " + ex.Message;
                return View(new PerfilModel());
            }
        }

        [SesionActiva]
        [HttpPost]
        public ActionResult CambiarPerfil(PerfilModel modelo)
        {
            try
            {
                using (var context = new WaggyDBEntities())
                {
                    int consecutivo = int.Parse(Session["Consecutivo"].ToString());

                    var result = context.usuario.FirstOrDefault(u => u.consecutivo == consecutivo);

                    if (result == null)
                    {
                        ViewBag.Error = "No se encontró el usuario a actualizar.";
                        return View(modelo);
                    }

                    // Estos no se editan
                    modelo.Identificacion = result.identificacion;
                    modelo.CorreoElectronico = result.correoElectronico;

                    ModelState.Remove("Identificacion");
                    ModelState.Remove("CorreoElectronico");

                    if (!ModelState.IsValid)
                    {
                        var errores = ModelState.Values
                                        .SelectMany(v => v.Errors)
                                        .Select(e => e.ErrorMessage)
                                        .ToList();

                        ViewBag.Error = string.Join(" | ", errores);
                        return View(modelo);
                    }

                    result.nombre = modelo.Nombre;
                    result.telefono = modelo.Telefono;
                    result.direccion = modelo.Direccion;

                    context.SaveChanges();

                    Session["Nombre"] = result.nombre;
                    Session["CorreoElectronico"] = result.correoElectronico;

                    return RedirectToAction("Index", "Home");
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Ocurrió un error al actualizar el perfil: " + ex.Message;
                return View(modelo);
            }
        }
        #endregion

        #region Cambiar Contraseña
        [HttpGet]
        public ActionResult CambiarAcceso()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CambiarAcceso(SeguridadModel modelo)
        {
            if (!ModelState.IsValid)
                return View(modelo);

            using (var context = new WaggyDBEntities())
            {
                var consecutivoSesion = int.Parse(Session["Consecutivo"].ToString());
                var actualizacion = context.sp_ActualizarContrasenna(modelo.ContrasennaNueva, consecutivoSesion);

                if (actualizacion <= 0)
                {
                    ViewBag.Mensaje = "Su información no se actualizó correctamente.";
                    return View();
                }

                //Se envía un correo electrónico al usuario con la nueva contraseña
                string rutaHtml = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Template", "NotificarContrasenna.html");
                string contenidoHtml = System.IO.File.ReadAllText(rutaHtml);

                string htmlFinal = contenidoHtml
                    .Replace("{{NOMBRE_USUARIO}}", Session["Nombre"].ToString());

                generales.EnviarCorreo(Session["CorreoElectronico"].ToString(), "Notificación de Acceso", htmlFinal);

                return RedirectToAction("CerrarSesion", "Home");
            }

        }
        #endregion
    }
}