using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniProject.DataLayer.Entites
{
    public class Present
    {
        public int Id { set; get; }
        public string DayPresent { set; get; }
        public string HoursPresent { set; get; }
        public string Day { set; get; }

        public List<DoctorToPresent> DoctorToPresents { set; get; }


    }
}
