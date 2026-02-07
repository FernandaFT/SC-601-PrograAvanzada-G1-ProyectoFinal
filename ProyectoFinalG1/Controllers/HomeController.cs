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

        #region Iniciar Sesión
        [HttpGet]
        public ActionResult InicioSesion()
        {
            return View();
        }
        [HttpPost]
        public ActionResult InicioSesion(UsuarioModel modelo)
        {
            return View();
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
    }
}