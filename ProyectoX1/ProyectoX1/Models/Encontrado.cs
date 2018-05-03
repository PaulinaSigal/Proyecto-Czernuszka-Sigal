using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ProyectoX1.Models
{
    public class Encontrado
    {
        public string IdUsuario { get; set; }
        public string IdCategoria { get; set; }
        public string NombreEncontrado { get; set; }
        public DateTime FechaEncontrado { get; set; }
        public string LugarEncontrado { get; set; }

        [Required(ErrorMessage = "Es obligatorio subir foto del objeto encontrado") ]
        public HttpPostedFileBase ImagenEncontrado { get; set; }
        public string DescripcionEncontrado { get; set; }
        public bool Activo { get; set; }
    }
}