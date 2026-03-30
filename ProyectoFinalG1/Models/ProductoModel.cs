using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoFinalG1.Models
{
    public class ProductoModel
    {
        public int ConsecutivoProducto { get; set; }

        [Required(ErrorMessage = "El nombre del producto es requerido.")]
        public string NombreProducto { get; set; }

        [Required(ErrorMessage = "La descripción del producto es requerida.")]
        public string DescripcionProducto { get; set; }

        [Required(ErrorMessage = "La imagen es requerida.")]
        public string Imagen { get; set; }

        [Required(ErrorMessage = "El precio es requerido.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "El precio debe ser mayor a 0.")]
        public decimal Precio { get; set; }

        [Required(ErrorMessage = "La unidad de medida es requerida.")]
        public string UnidadMedida { get; set; }

        [Required(ErrorMessage = "La existencia es requerida.")]
        [Range(0, int.MaxValue, ErrorMessage = "La existencia no puede ser negativa.")]
        public int Existencia { get; set; }

        [Required(ErrorMessage = "La existencia mínima es requerida.")]
        [Range(0, int.MaxValue, ErrorMessage = "La existencia mínima no puede ser negativa.")]
        public int ExistenciaMin { get; set; }

        [Required(ErrorMessage = "La existencia máxima es requerida.")]
        [Range(0, int.MaxValue, ErrorMessage = "La existencia máxima no puede ser negativa.")]
        public int ExistenciaMax { get; set; }

        public bool Estado { get; set; }
        public DateTime RegistroProd { get; set; }

        [Required(ErrorMessage = "La categoría es requerida.")]
        [Range(1, int.MaxValue, ErrorMessage = "Debe seleccionar una categoría.")]
        public int ConsCategoria { get; set; }

        public string NombreCategoria { get; set; }

        [Required(ErrorMessage = "El tipo de mascota es requerido.")]
        public string TipoMascota { get; set; }
    }
}