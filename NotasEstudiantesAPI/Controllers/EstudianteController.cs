using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using NotasEstudiantesAPI.Models;

namespace NotasEstudiantesAPI.Controllers
{
    [RoutePrefix("api/estudiante")]
    public class EstudianteController : ApiController
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        [HttpPost]
        [Route("insertar")]
        public IHttpActionResult InsertarEstudiante(EstudianteDto estudiante)
        {
            if (estudiante.id_carrera <= 0)
            {
                return BadRequest("El ID de la carrera no es válido.");
            }
            Console.WriteLine($"Nombre: {estudiante.nombre}");
            Console.WriteLine($"Apellido: {estudiante.apellido}");
            Console.WriteLine($"Carnet: {estudiante.carnet}");
            Console.WriteLine($"ID Carrera: {estudiante.id_carrera}");

            using (SqlConnection conn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand("sp_InsertarEstudiante", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombre", estudiante.nombre);
                cmd.Parameters.AddWithValue("@apellido", estudiante.apellido);
                cmd.Parameters.AddWithValue("@carnet", estudiante.carnet);
                cmd.Parameters.AddWithValue("@id_carrera", estudiante.id_carrera);
                conn.Open();
                cmd.ExecuteNonQuery();

            }

            return Ok("Estudiante agregado exitosamente");
        }
    }
}
