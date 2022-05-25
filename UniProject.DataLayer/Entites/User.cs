using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniProject.DataLayer.Entites
{
    public class User
    {
        [Key]
        public int Id { set; get; }
        public string Name { set; get; }
        public string Family { set; get; }
        public string Password { set; get; }
        public bool IsAdmin { set; get; }
        public string MeliCode { set; get; }
        public int Age { set; get; }
        public string Phone { set; get; }
        public string Email { set; get; }
        public string City { set; get; }
        public DateTime JoinDate { set; get; }
        public List<Doctor> FavoriteDoctors { set; get; }


    }
}
