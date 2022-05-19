using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniProject.DataLayer.Entites;

namespace UniProject.DataLayer.DTOs
{
    public class RegisterViewModel
    {
        public string Name { set; get; }
        public string Family { set; get; }
        public string Password { set; get; }
        public string MeliCode { set; get; }
        public int Age { set; get; }
        public bool Gender { set; get; }
        public string Phone { set; get; }
        public string Email { set; get; }
        public string City { set; get; }
        public string Address { set; get; }
        public List<DiseaseCategory> BackgroundDiseases { set; get; }
        public IFormFile Picture { set; get; }
    }

    public class LoginViewModel
    {
    }
}
