using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UniProject.DataLayer.Entites;

namespace UniProject.DataLayer.DTOs
{
    public class RegisterViewModel
    {
        [Required(ErrorMessage ="لطفا {0} را تکمیل کنید")]
        [Display(Name="نام")]

        public string Name { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "نام خانوادگی")]
        public string Family { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "کد ملی")]
        public string MeliCode { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "سن")]
        public int Age { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "تلفن")]
        public string Phone { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "ایمیل")]
        public string Email { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "استان محل سکونت")]
        public string City { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "پسوورد")]
        [DataType(DataType.Password)]
        public string Password { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "تکرار پسوورد")]
        [Compare("Password", ErrorMessage ="تکرار پسوورد اشتباه است")]
        [DataType(DataType.Password)]
        public string RePassword { set; get; }




    }

    public class LoginViewModel
    {
    }
}
