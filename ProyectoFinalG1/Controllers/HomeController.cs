using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoFinalG1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult InicioSesion()
        {
            ViewBag.Message = "Pagina de Inicio de Sesión";

            return View();
        }
        public ActionResult Registro()
        {
            ViewBag.Message = "Pagina de Registro";

            return View();
        }
    }
}