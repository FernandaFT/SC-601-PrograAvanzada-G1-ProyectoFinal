using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoFinalG1.Models
{
    public class UsuarioModel
    {
        public string Identificacion { get; set; }
        public string Password { get; set; }
        public string Nombre { get; set; }
        public string Correo { get; set; }

    }
}