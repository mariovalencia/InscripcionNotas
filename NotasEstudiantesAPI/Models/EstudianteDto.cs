using System;
using System.Web;

namespace NotasEstudiantesAPI.Models
{
    public class EstudianteDto
    {
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string carnet { get; set; }
        public int id_carrera { get; set; }
    }
}
