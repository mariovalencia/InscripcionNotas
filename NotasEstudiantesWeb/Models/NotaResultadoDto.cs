using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NotasEstudiantesWeb.Models
{
    public class NotaResultadoDto
    {
        public string nombre_materia { get; set; }
        public string nombre_carrera { get; set; }
        public decimal nota1 { get; set; }
        public decimal nota2 { get; set; }
        public decimal nota3 { get; set; }
        public decimal nota_final { get; set; }
    }
}