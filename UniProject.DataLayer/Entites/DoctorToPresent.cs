using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniProject.DataLayer.Entites
{
    public class DoctorToPresent
    {
        public int DoctorId{set;get;}
        public int PresentId { set; get; }
        
        public Doctor Doctor { set; get; }
        public Present Present { set; get; }
    }
}
