using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniProject.DataLayer.Entites
{
    public class Doctor
    {
        [Key]
        public int Id { set; get; }
        public string Name { set; get; }
        public string Family { set; get; }
        public string MedicalCode { set; get; }
        public bool Gender { set; get; }
        public string Phone { set; get; }
        public string Email { set; get; }
        public string City { set; get; }
        public string Specialty { set; get; }
    }
}
