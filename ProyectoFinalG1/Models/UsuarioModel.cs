using System;

namespace ProyectoFinalG1.Models
{
    public class UsuarioModel
    {
        public long IdUsuario { get; set; }

        public string Identificacion { get; set; }

        public string Nombre { get; set; }

        public string Correo { get; set; }

        public string Password { get; set; }

        public string Estado { get; set; }

        public string Rol { get; set; }
    }
}