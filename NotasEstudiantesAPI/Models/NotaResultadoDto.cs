using System;
using System.Web;

namespace NotasEstudiantesAPI.Models
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
