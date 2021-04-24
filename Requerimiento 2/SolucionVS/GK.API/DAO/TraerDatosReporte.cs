using GK.API.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace GK.API.DAO
{
    public class TraerDatosReporte
    {
        private string connectionString { get; set; }
        private string rutaSalidaArchivo { get; set; }

        public TraerDatosReporte()
        {
            this.connectionString = ConfigurationManager.ConnectionStrings["BaseDeDatosVentas"].ConnectionString;
            this.rutaSalidaArchivo = ConfigurationManager.AppSettings["PathFileOut"];
        }

        /// <summary>
        /// Obtiene un reader para leer los select que un comando produzca
        /// </summary>
        /// <param name="sqlQuery">Comando a ejecutar</param>
        /// <returns>Data reader con la informacion de los select generados por la ejecucion del SP</returns>
        public void GenerarArchivoEnDisco(string sqlQuery, string nombreInforme)
        {
            StringBuilder stringBuilder = new StringBuilder();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sqlQuery, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                var columnNames = Enumerable.Range(0, reader.FieldCount)
                    .Select(reader.GetName)
                    .ToList();


                string nombreArchivo = string.Format("AS {0}-{1}-{2}-{3}-{4}-{5}"
                    ,nombreInforme
                    ,DateTime.Now.Year.ToString()
                    ,DateTime.Now.Month.ToString()
                    ,DateTime.Now.Day.ToString()
                    ,DateTime.Now.Minute.ToString()
                    ,DateTime.Now.Second.ToString()
                );
                string path = string.Format(
                    rutaSalidaArchivo
                    ,nombreArchivo
                );


                using (System.IO.StreamWriter sw = new System.IO.StreamWriter(path, true))
                {
                    //Crea encabezado
                    sw.WriteLine(string.Join(",", columnNames));
                    List<string> line = new List<string>();


                    while (reader.Read())
                    {
                        line = new List<string>();
                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            line.Add(reader[i].ToString());
                        }
                        sw.WriteLine(String.Format("{0}", string.Join(",", line)));
                    }

                }
            }

        }

        /// <summary>
        /// Obtiene un reader para leer los select que un comando produzca
        /// </summary>
        /// <param name="sqlQuery">Comando a ejecutar</param>
        /// <returns>Data reader con la informacion de los select generados por la ejecucion del SP</returns>
        public string GenerarArchivo(string sqlQuery)
        {
            StringBuilder stringBuilder = new StringBuilder();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sqlQuery, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                var columnNames = Enumerable.Range(0, reader.FieldCount)
                    .Select(reader.GetName)
                    .ToList();


                List<string> line = new List<string>();

                stringBuilder.AppendLine(string.Join(",", columnNames));
                while (reader.Read())
                {
                    line = new List<string>();
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        line.Add(reader[i].ToString());
                    }
                    stringBuilder.AppendLine(String.Format("{0}", string.Join(",", line)));
                }

                return stringBuilder.ToString();

               
            }

        }


        public List<ListaOpcionesReporteModel> TraerOpcionReporte()
        {
            string sqlQuery = "Select * from [dbo].[OpcionReporte]";

            List<ListaOpcionesReporteModel> listaOpciones = new List<ListaOpcionesReporteModel>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sqlQuery, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);

                
                while (reader.Read())
                {
                    ListaOpcionesReporteModel listaOpcionesReporteModel = new ListaOpcionesReporteModel();
                    listaOpcionesReporteModel.OpcionReporte_Id = long.Parse(reader[0].ToString());
                    listaOpcionesReporteModel.TituloReporte = reader[1].ToString();
                    listaOpcionesReporteModel.ComandoSql = reader[2].ToString();
                    listaOpciones.Add(listaOpcionesReporteModel);
                }

                return listaOpciones;
            }
        }

    }
}