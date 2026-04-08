using System;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace ProyectoFinalG1.Models
{
    public class SeguridadModel
    {
        [Required(ErrorMessage = "La contraseña nueva es requerida.")]
        public string ContrasennaNueva { get; set; }

        [Required(ErrorMessage = "La confirmación de contraseña es requerida.")]
        [Compare("ContrasennaNueva", ErrorMessage = "Las contraseñas no coinciden.")]
        public string ConfirmarContrasenna { get; set; }
    }
}
