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

namespace NotasEstudiantesWeb
{
    public partial class ConsultarNotas : System.Web.UI.Page
    {
        private static readonly string ApiUrl = ConfigurationManager.AppSettings["ApiUrl"];
        private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // La mayoría de la funcionalidad se maneja en el cliente con jQuery
        }

        [WebMethod]
        public static string ObtenerEstudiantes()
        {
            var estudiantes = new List<Estudiante>();

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT e.id, e.nombre, e.apellido, e.carnet, c.nombre_carrera " +
                                                       "FROM Estudiante e " +
                                                       "INNER JOIN Carrera c ON e.id_carrera = c.id " +
                                                       "ORDER BY e.apellido, e.nombre", conn))
                {
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
                                carnet = reader["carnet"].ToString(),
                                carrera = reader["nombre_carrera"].ToString()
                            });
                        }
                    }
                }
            }

            return JsonConvert.SerializeObject(estudiantes);
        }

        [WebMethod]
        public static string ObtenerNotasPorEstudiante(int idEstudiante)
        {
            using (HttpClient client = new HttpClient())
            {
                var response = client.GetAsync($"{ApiUrl}/api/nota/obtener/{idEstudiante}").Result;

                if (response.IsSuccessStatusCode)
                {
                    var content = response.Content.ReadAsStringAsync().Result;
                    return content;
                }
                else
                {
                    return JsonConvert.SerializeObject(new List<NotaResultadoDto>());
                }
            }
        }
    }
}
