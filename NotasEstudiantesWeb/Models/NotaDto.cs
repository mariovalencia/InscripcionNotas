using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NotasEstudiantesWeb.Models
{
    public class NotaDto
    {
        public int id_estudiante { get; set; }
        public int id_materia { get; set; }
        public int id_carrera { get; set; }
        public decimal nota1 { get; set; }
        public decimal nota2 { get; set; }
        public decimal nota3 { get; set; }
    }
}