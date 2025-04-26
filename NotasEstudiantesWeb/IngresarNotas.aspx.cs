using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using NotasEstudiantesWeb.Models;
using System.Web.Script.Services;

namespace NotasEstudiantesWeb
{
    public partial class IngresarNotas : System.Web.UI.Page
    {
        private static readonly string ApiUrl = ConfigurationManager.AppSettings["ApiUrl"];
        private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // La mayoría de la funcionalidad se maneja en el cliente con jQuery
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string ObtenerCarreras()
        {
            var carreras = new List<Carrera>();
            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT id, nombre_carrera FROM Carrera", conn))
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                carreras.Add(new Carrera
                                {
                                    id = Convert.ToInt32(reader["id"]),
                                    nombre_carrera = reader["nombre_carrera"].ToString()
                                });
                            }
                        }
                    }
                }

                return JsonConvert.SerializeObject(carreras);
            }
            catch (SqlException sqlEx)
            {
                // Error específico de SQL Server
                return JsonConvert.SerializeObject(new { Error = "Error de base de datos", Detalle = sqlEx.Message });
            }
            catch (Exception ex)
            {
                // Cualquier otro tipo de error
                return JsonConvert.SerializeObject(new { Error = "Error general", Detalle = ex.Message });
            }
        }

        [WebMethod]
        public static string ObtenerEstudiantesPorCarrera(int idCarrera)
        {
            var estudiantes = new List<Estudiante>();

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT id, nombre, apellido, carnet FROM Estudiante WHERE id_carrera = @idCarrera", conn))
                {
                    cmd.Parameters.AddWithValue("@idCarrera", idCarrera);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            estudiantes.Add(new Estudiante
                            {
                                id = Convert.ToInt32(reader["id"]),
                                nombre = reader["nombre"].ToString(),
                                apellido = reader["apellido"].ToString(),
                                carnet = reader["carnet"].ToString()
                            });
                        }
                    }
                }
            }

            return JsonConvert.SerializeObject(estudiantes);
        }

        [WebMethod]
        public static string ObtenerMateriasPorCarrera(int idCarrera)
        {
            var materias = new List<Materia>();

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT id, nombre_materia FROM Materia WHERE id_carrera = @idCarrera", conn))
                {
                    cmd.Parameters.AddWithValue("@idCarrera", idCarrera);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            materias.Add(new Materia
                            {
                                id = Convert.ToInt32(reader["id"]),
                                nombre_materia = reader["nombre_materia"].ToString()
                            });
                        }
                    }
                }
            }

            return JsonConvert.SerializeObject(materias);
        }

        [WebMethod]
        public static string GuardarNota(NotaDto nota)
        {
            using (HttpClient client = new HttpClient())
            {
                var content = new StringContent(
                    JsonConvert.SerializeObject(nota),
                    Encoding.UTF8,
                    "application/json");

                var response = client.PostAsync($"{ApiUrl}/api/nota/insertar", content).Result;

                if (response.IsSuccessStatusCode)
                {
                    return "Nota guardada exitosamente";
                }
                else
                {
                    return $"Error: {response.StatusCode} - {response.ReasonPhrase}";
                }
            }
        }
    }
}