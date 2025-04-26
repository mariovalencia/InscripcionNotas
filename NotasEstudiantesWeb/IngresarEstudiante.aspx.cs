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

namespace NotasEstudiantesWeb
{
    public partial class IngresarEstudiante : System.Web.UI.Page
    {
        private static readonly string ApiUrl = ConfigurationManager.AppSettings["ApiUrl"];
        private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // La mayoría de la funcionalidad se maneja en el cliente con jQuery
        }

        [WebMethod]
        public static string ObtenerCarreras()
        {
            var carreras = new List<Carrera>();

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

        [WebMethod]
        public static string GuardarEstudiante(EstudianteDto estudiante)
        {
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    var content = new StringContent(
                        JsonConvert.SerializeObject(estudiante),
                        Encoding.UTF8,
                        "application/json");

                    var response = client.PostAsync($"{ApiUrl}/api/estudiante/insertar", content).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        return "Estudiante guardado exitosamente";
                    }
                    else
                    {
                        return $"Error: {response.StatusCode} - {response.ReasonPhrase}";
                    }
                }
            }
            catch (Exception ex)
            {
                return $"Excepción al guardar estudiante: {ex.Message} - {ex.InnerException?.Message}";
            }
        }
    }

    public class Carrera
    {
        public int id { get; set; }
        public string nombre_carrera { get; set; }
    }

    public class EstudianteDto
    {
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string carnet { get; set; }
        public int id_carrera { get; set; }
    }
}