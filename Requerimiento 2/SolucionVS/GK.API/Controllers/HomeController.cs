using GK.API.DAO;
using GK.API.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GK.API.Controllers
{
    public class HomeController : Controller
    {
        TraerDatosReporte traerDatosReporte = new TraerDatosReporte();

        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            ReporteModel model = new ReporteModel();
            this.AsignarListado(model);

            

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(ReporteModel model)
        {
            this.AsignarListado(model);
            List<ListaOpcionesReporteModel> listaOpciones = traerDatosReporte.TraerOpcionReporte();

            string[] formats = { "MM/dd/yyyy" };
            DateTime fechaInicial = DateTime.ParseExact(model.FechaInicial, formats, new CultureInfo("en-US"), DateTimeStyles.None);
            DateTime fechaFinal = DateTime.ParseExact(model.FechaFinal, formats, new CultureInfo("en-US"), DateTimeStyles.None);

            string Query = string.Format(
                listaOpciones.Find(x => x.OpcionReporte_Id == long.Parse(model.OpcionReporte_Id)).ComandoSql
                , fechaInicial.ToString("dd/MM/yyyy")
                , fechaFinal.ToString("dd/MM/yyyy")
                );

            string nombreInforme = listaOpciones.Find(x => x.OpcionReporte_Id == long.Parse(model.OpcionReporte_Id)).TituloReporte;

            string rutaGeneracion = ConfigurationManager.AppSettings["rutaGeneracionArchivo"];

            if(rutaGeneracion == "GuardarEnDisco")
            {
                traerDatosReporte.GenerarArchivoEnDisco(Query, nombreInforme);
                return View(model);
            }
            else
            {
                string archivoCsv = traerDatosReporte.GenerarArchivo(Query);

                string nombreArchivo = string.Format("AS {0}-{1}-{2}-{3}-{4}-{5}"
                        , nombreInforme
                        , DateTime.Now.Year.ToString()
                        , DateTime.Now.Month.ToString()
                        , DateTime.Now.Day.ToString()
                        , DateTime.Now.Minute.ToString()
                        , DateTime.Now.Second.ToString()
                    );

                var stream = new MemoryStream();
                var writer = new StreamWriter(stream);
                writer.Write(archivoCsv);
                writer.Flush();
                stream.Position = 0;
                string contentType = "application/octet-stream";
                return File(stream, contentType, nombreArchivo + "." + "csv");
            }
            

            
        }


        private void AsignarListado(ReporteModel model)
        {
            model.ListReportes = new List<SelectListItem>();
            //model.ListReportes.Add(new SelectListItem() { Value = string.Empty, Text = "Seleccione" });
            List<ListaOpcionesReporteModel> listaOpciones = traerDatosReporte.TraerOpcionReporte();
            listaOpciones.ForEach(x => {
                model.ListReportes.Add(new SelectListItem() { Value = x.OpcionReporte_Id.ToString(), Text = x.TituloReporte });
            });

        }

    }
}
