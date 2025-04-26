using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NotasEstudiantesWeb.Models
{
    public class Estudiante
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string carnet { get; set; }
        public string carrera { get; set; }
    }
}