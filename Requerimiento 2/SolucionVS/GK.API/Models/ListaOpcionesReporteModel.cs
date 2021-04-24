using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GK.API.Models
{
    public class ListaOpcionesReporteModel
    {
        public long OpcionReporte_Id { get; set; }
        public string TituloReporte { get; set; }
        public string ComandoSql { get; set; }
    }
}