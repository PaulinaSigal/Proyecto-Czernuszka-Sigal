using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace ProyectoX1.Models
{
    public class Perdido
    {
        public string IdUsuario { get; set; }
        public string IdCategoria { get; set; }
        public string NombrePerdido { get; set; }
        public DateTime FechaPerdido { get; set; }
        public string LugarPerdido { get; set; }
              
        public HttpPostedFileBase ImagenPerdido { get; set; }
        public string DescripcionPerdido { get; set; }
        public bool Activo { get; set; }

    }
}