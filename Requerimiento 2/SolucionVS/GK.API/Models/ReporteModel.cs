using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GK.API.Models
{
    public class ReporteModel
    {
        public List<SelectListItem> ListReportes { get; set; }

        public string OpcionReporte_Id { get; set; }
        public string FechaInicial { get; set; }

        public string FechaFinal { get; set; }


    }
}