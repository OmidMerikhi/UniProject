using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniProject.DataLayer.Entites;

namespace UniProject.DataLayer.DTOs
{
    public class PersonReserveViewModel
    {
        public DateTime RequestDate { set; get; }
        public string SpecialityTitle { set; get; }
        public Doctor Doctor { set; get; }
        public string VisitDate { set; get; }
    }
}
