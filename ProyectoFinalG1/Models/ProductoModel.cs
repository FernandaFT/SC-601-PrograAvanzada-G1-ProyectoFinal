using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoFinalG1.Models
{
    public class ProductoModel
    {
        public int ConsecutivoProducto { get; set; }
        public string NombreProducto { get; set; }
        public string DescripcionProducto { get; set; }
        public string Imagen { get; set; }
        public decimal Precio { get; set; }
        public string UnidadMedida { get; set; }
        public int Existencia { get; set; }
        public int ExistenciaMin { get; set; }
        public int ExistenciaMax { get; set; }
        public bool Estado { get; set; }
        public DateTime RegistroProd { get; set; }
        public int ConsCategoria { get; set; }
        public string NombreCategoria { get; set; }
        public string TipoMascota { get; set; }
    }
}