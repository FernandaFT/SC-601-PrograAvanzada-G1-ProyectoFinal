using System;
using System.Collections.Generic;

namespace ProyectoFinalG1.Models
{
    public class FacturaViewModel
    {
        public int NumeroCompra { get; set; }
        public DateTime Fecha { get; set; }
        public string UsuarioNombre { get; set; }
        public List<CarritoItemModel> Items { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Impuesto { get; set; }
        public decimal Total { get; set; }
    }
}
