using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniProject.DataLayer.Entites;

namespace UniProject.DataLayer.DTOs
{
    public class GetVisitViewModel
    {
        public Doctor Doctor { set; get; }
        public List<Present> PresentOptions { set; get; }
    }
}
