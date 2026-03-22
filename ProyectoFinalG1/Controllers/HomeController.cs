using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using ProyectoFinalG1.EntityFramework;
using ProyectoFinalG1.Filters;
using ProyectoFinalG1.Models;

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
			using (var context = new WaggyDBEntities())
			{
				var result = context.sp_ValidarCorreo(modelo.CorreoElectronico).FirstOrDefault();
				if (result == null)
				{
					ViewBag.Mensaje = "Su información no se validó correctamente.";
				}
                //Se generea la nueva contraseña
                var nuevaContrasenna = GenerarContrasena();
				//Se actualiza la contraseña en Base de Datos
				var actualizacion = context.sp_ActualizarContrasenna(nuevaContrasenna, result.consecutivo);
				if (actualizacion <= 0)
				{
					ViewBag.Mensaje = "Su información no se actualizó correctamente.";
					return View();
				}
				//Se envía un correo electrónico al usuario con la nueva contraseña
				EnviarCorreo(modelo.CorreoElectronico,"Recuperación de Contraseña",nuevaContrasenna);

				return RedirectToAction("InicioSesion", "Home");


			}
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

		
		private string GenerarContrasena()
		{
            int longitud = 8;
			const string letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
			StringBuilder resultado = new StringBuilder(longitud);

			using (RandomNumberGenerator rng = RandomNumberGenerator.Create())
			{
				byte[] bytes = new byte[1];
				for (int i = 0; i < longitud; i++)
				{
					rng.GetBytes(bytes);
					int index = bytes[0] % letras.Length;
					resultado.Append(letras[index]);
				}
			}

			return resultado.ToString();
		}

		private void EnviarCorreo(string destinatario, string asunto, string cuerpo)
		{
			var cuentaCorreo = ConfigurationManager.AppSettings["cuentaCorreo"];
			var contrasennaCorreo = ConfigurationManager.AppSettings["contrasennaCorreo"];

			using (MailMessage mail = new MailMessage())
			{
				mail.From = new MailAddress(cuentaCorreo);
				mail.To.Add(destinatario);
				mail.Subject = asunto;
				mail.Body = cuerpo;
				mail.IsBodyHtml = true; 

				using (SmtpClient smtp = new SmtpClient("smtp.office365.com", 587))
				{
					smtp.Credentials = new NetworkCredential(cuentaCorreo, contrasennaCorreo);
					smtp.EnableSsl = true; 
					smtp.Send(mail);
				}
			}
		}

	}
}