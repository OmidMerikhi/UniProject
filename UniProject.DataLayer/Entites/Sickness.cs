using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniProject.DataLayer.Entites
{
    public class Sickness
    {
        public int Id { set; get; }
        public int SpecialityId { set; get; }
        public string Title { set; get; }
        public string Description { set; get; }


        [ForeignKey("SpecialityId")]
        public Specialty Specialty { set; get; }
    }
}
