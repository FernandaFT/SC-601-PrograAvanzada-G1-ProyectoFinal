using System;
using System.ComponentModel.DataAnnotations;

namespace ProyectoFinalG1.Models
{
    public class InventarioEncViewModel
    {
        public int ConsInventario { get; set; }

        [Required(ErrorMessage = "La fecha es requerida.")]
        public DateTime? FecInventario { get; set; }

        [Required(ErrorMessage = "La observación es requerida.")]
        public string Observaciones { get; set; }
        public string EstadoInv { get; set; }
    }
}
