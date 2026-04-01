using System;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace ProyectoFinalG1.Models
{
    public class PerfilModel
    {
        [Required(ErrorMessage = "La identificación es requerida.")]
        public string Identificacion { get; set; }

        [Required(ErrorMessage = "El nombre es requerido.")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "El correo electrónico es requerido.")]
        [EmailAddress(ErrorMessage = "Debe ingresar un correo electrónico válido.")]
        public string CorreoElectronico { get; set; }

        [Required(ErrorMessage = "El teléfono es requerido.")]
        public string Telefono { get; set; }

        [Required(ErrorMessage = "La dirección es requerida.")]
        public string Direccion { get; set; }
    }
}
