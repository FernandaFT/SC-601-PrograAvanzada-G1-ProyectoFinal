using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoFinalG1.Models
{
    public class CarritoItemModel
    {
        public int ConsecutivoProducto { get; set; }
        public string NombreProducto { get; set; }
        public string Imagen { get; set; }
        public decimal Precio { get; set; }
        public int Cantidad { get; set; }
        public int Existencia { get; set; }

        public decimal Subtotal
        {
            get { return Precio * Cantidad; }
        }
    }
}