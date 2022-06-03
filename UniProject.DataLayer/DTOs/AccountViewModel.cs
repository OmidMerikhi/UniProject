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
        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "ایمیل")]
        public string Email { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "پسوورد")]
        [DataType(DataType.Password)]
        public string Password { set; get; }

        [Display(Name = "مرا بخاطر بسپار")]
        public bool RememberMe { set; get; }
    }

    public class EditViewModel
    {
        public int Id { set; get; }


        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "نام")]
        public string Name { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "نام خانوادگی")]
        public string Family { set; get; }

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
        [Display(Name = "شهر محل سکونت")]
        public string City { set; get; }
    }

    public class ResetPasswordViewModel
    {
        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = " پسوورد فعلی")]
        [DataType(DataType.Password)]
        public string CurrentPassword { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "پسوورد جدید")]
        [DataType(DataType.Password)]
        public string NewPassword { set; get; }

        [Required(ErrorMessage = "لطفا {0} را تکمیل کنید")]
        [Display(Name = "تکرار پسوورد جدید")]
        [DataType(DataType.Password)]
        [Compare("NewPassword",ErrorMessage ="تکرار پسوورد جدید اشتباه است")]
        public string ReNewPassword { set; get; }
    }
}
