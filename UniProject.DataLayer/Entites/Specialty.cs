using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniProject.DataLayer.Entites
{
    public class Specialty
    {
        public int Id { set; get; }
        public string Title { set; get; }
        public string Description { set; get; }
        

        public List<Doctor> Doctors { set; get; }
        public List<Sickness> Sickness { set; get; }
    }
}
