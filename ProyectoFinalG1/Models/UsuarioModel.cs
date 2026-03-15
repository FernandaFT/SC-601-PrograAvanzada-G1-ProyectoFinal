using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoFinalG1.Models
{
    public class UsuarioModel
    {
        public int Consecutivo { get; set; }
        public string Identificacion { get; set; }
        public string Contrasenna { get; set; }
        public string Nombre { get; set; }
        public string CorreoElectronico { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public int ConsecutivoRol { get; set; }
        public string Descripcion { get; set; }
        public bool Estado { get; set; }
    }
}