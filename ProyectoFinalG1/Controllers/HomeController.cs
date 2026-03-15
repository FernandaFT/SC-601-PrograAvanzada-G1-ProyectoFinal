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
            return View();
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
                    // Verificar si el usuario existe pero está inactivo
                    var usuario = context.usuario
                                         .FirstOrDefault(u => u.correoElectronico == modelo.CorreoElectronico);

                    if (usuario != null && usuario.estado == false)
                    {
                        ViewBag.Mensaje = "Su usuario está inactivo. Comuníquese con el administrador.";
                    }
                    else
                    {
                        ViewBag.Mensaje = "Su información no se autenticó correctamente.";
                    }

                    return View(modelo);
                }


                Session["Nombre"] = result.nombre;
                Session["Rol"] = result.rol;

                // Si autenticó correctamente
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
    }
}