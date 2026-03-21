using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ProyectoFinalG1.Models
{
    public class InventarioDetViewModel
    {
        public int ConsInventarioDet { get; set; }
        public int ConsInventario { get; set; }
        public int ConsProducto { get; set; }
        public string NombreProducto { get; set; }
        public string Imagen { get; set; }
        public int CantidadInventario { get; set; }
        public int StockActual { get; set; }
    }
}
