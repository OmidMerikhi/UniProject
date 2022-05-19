using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniProject.DataLayer.Entites
{
    public class DiseaseCategory
    {
        [Key]
        public int Id { set; get; }
        public int Title { set; get; }
        public string Description { set; get; }


    }
}
