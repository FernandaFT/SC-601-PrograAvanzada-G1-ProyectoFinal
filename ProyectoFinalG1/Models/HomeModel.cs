using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoFinalG1.Models
{
    public class HomeModel
    {
        public List<ProductoModel> ProductosAlimentos { get; set; }
        public List<ProductoModel> ProductosRopa { get; set; }
        public List<ProductoModel> ProductosAccesorios { get; set; }
    }
}