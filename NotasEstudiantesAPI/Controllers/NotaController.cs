using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using NotasEstudiantesAPI.Models;

namespace NotasEstudiantesAPI.Controllers
{
    [RoutePrefix("api/nota")]
    public class NotaController : ApiController
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        [HttpPost]
        [Route("insertar")]
        public IHttpActionResult InsertarNota(NotaDto nota)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_InsertarNota", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_estudiante", nota.id_estudiante);
                cmd.Parameters.AddWithValue("@id_materia", nota.id_materia);
                cmd.Parameters.AddWithValue("@id_carrera", nota.id_carrera);
                cmd.Parameters.AddWithValue("@nota1", nota.nota1);
                cmd.Parameters.AddWithValue("@nota2", nota.nota2);
                cmd.Parameters.AddWithValue("@nota3", nota.nota3);
                
                conn.Open();
                cmd.ExecuteNonQuery();

            }

            return Ok("Nota registrada correctamente");
        }

        [HttpGet]
        [Route("obtener/{id_estudiante}")]
        public IHttpActionResult ObtenerNotasPorEstudiante(int id_estudiante)
        {
            var resultados = new List<NotaResultadoDto>();
            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_ObtenerNotasPorEstudiante", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_estudiante", id_estudiante);
                conn.Open();
                using (var reader = cmd.ExecuteReader())
                {
                    while(reader.Read())
                    {
                        resultados.Add(new NotaResultadoDto
                        {
                            nombre_materia = reader["nombre_materia"].ToString(),
                            nombre_carrera = reader["nombre_carrera"].ToString(),
                            nota1 = reader.GetDecimal(reader.GetOrdinal("nota1")),
                            nota2 = reader.GetDecimal(reader.GetOrdinal("nota2")),
                            nota3 = reader.GetDecimal(reader.GetOrdinal("nota3")),
                            nota_final = reader.GetDecimal(reader.GetOrdinal("nota_final"))
                        });
                    }
                }
            }
            return Ok(resultados);
        }
    }
    
}
