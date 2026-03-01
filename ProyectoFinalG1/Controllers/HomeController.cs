using ProyectoFinalG1.EntityFramework;
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
            using (var context = new WaggyEntities())
            {
                var result = context.sp_IniciarSesion(modelo.Correo, modelo.Password)
                                    .FirstOrDefault();

                if (result == null)
                {
                    ViewBag.Mensaje = "Su información no se autenticó correctamente.";
                    return View(modelo);
                }

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
            using (var context = new WaggyEntities())
            {
                var resultado = context.sp_RegistroUsuario(
                                    model.Identificacion,
                                    model.Nombre,
                                    model.Correo,
                                    model.Password
                                ).FirstOrDefault() ?? 0;

                if (resultado == 0)
                {
                    ViewBag.Mensaje = "La identificación ya está registrada.";
                    return View(model);
                }

                return RedirectToAction("InicioSesion", "Home");
            }
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
    }
}