using System;

namespace ProyectoFinalG1.Models
{
    public class VentasModel
    {
        public int ConsecutivoVenta { get; set; }
        public DateTime FechaVenta { get; set; }
        public string NombreCliente { get; set; }
        public string NombreProducto { get; set; }
        public int Cantidad { get; set; }
        public decimal MontoLinea { get; set; }
        public decimal MontoTotal { get; set; }
    }
}