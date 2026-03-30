using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ProyectoFinalG1.Models
{
    public class UsuarioModel
    {
        public int Consecutivo { get; set; }

        [Required(ErrorMessage = "La identificación es requerida.")]
        public string Identificacion { get; set; }

        [Required(ErrorMessage = "La contraseña es requerida.")]
        public string Contrasenna { get; set; }

        [Required(ErrorMessage = "El nombre es requerido.")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "El correo electrónico es requerido.")]
        [EmailAddress(ErrorMessage = "Debe ingresar un correo electrónico válido.")]
        public string CorreoElectronico { get; set; }

        [Required(ErrorMessage = "El teléfono es requerido.")]
        public string Telefono { get; set; }

        [Required(ErrorMessage = "La dirección es requerida.")]
        public string Direccion { get; set; }

        [Required(ErrorMessage = "El rol es requerido.")]
        [Range(1, int.MaxValue, ErrorMessage = "Debe seleccionar un rol.")]
        public int ConsecutivoRol { get; set; }

        public string Descripcion { get; set; }
        public bool Estado { get; set; }
    }
}