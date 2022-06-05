using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniProject.DataLayer.Entites
{
    public class Doctor
    {
        [Key]
        public int Id { set; get; }
        public int SpecialtyId { set; get; }
        public string Name { set; get; }
        public string Family { set; get; }
        public string MedicalCode { set; get; }
        public string SpecialtyTitle { set; get; }
        public bool Gender { set; get; }
        public string OfficePhone { set; get; }
        public string OfficeAddress { set; get; }
        public string OfficeName { set; get; }
        public string Email { set; get; }
        public string City { set; get; }

        [ForeignKey("SpecialtyId")]
        public  Specialty Specialty { set; get; }
        public List<DoctorToPresent> DoctorToPresents { set; get; }
    }
}
