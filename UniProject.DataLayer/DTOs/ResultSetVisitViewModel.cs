using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniProject.DataLayer.Entites;

namespace UniProject.DataLayer.DTOs
{
    public class ResultSetVisitViewModel
    {
        public string Username { get; set; }
        public Doctor Doctor { set; get; }
        public string VisitDate { set; get; }
        public DateTime FinalDate { set; get; }
    }
}
