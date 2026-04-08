using ProyectoFinalG1.EntityFramework;
using ProyectoFinalG1.Filters;
using ProyectoFinalG1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace ProyectoFinalG1.Controllers
{
    public class SeguridadController : Controller
    {
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

		#region Cambiar Acceso
		
		[HttpGet]
		public ActionResult CambiarAcceso()
		{
			return View();
		}

		[HttpPost]
		public ActionResult CambiarAcceso(CambiarAccesoModel modelo)
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


					if (!ModelState.IsValid)
					{
						var errores = ModelState.Values
										.SelectMany(v => v.Errors)
										.Select(e => e.ErrorMessage)
										.ToList();

						ViewBag.Error = string.Join(" | ", errores);
						return View(modelo);
					}

					result.contrasenna = modelo.ContrasennaNueva;
					
					context.SaveChanges();

					return RedirectToAction("Index", "Home");
				}
			}
			catch (Exception ex)
			{
				ViewBag.Error = "Ocurrió un error al actualizar la contraseña " + ex.Message;
				return View(modelo);
			}
		}
	
		#endregion
	}
}