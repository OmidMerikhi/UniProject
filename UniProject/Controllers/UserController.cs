using Microsoft.AspNetCore.Mvc;
using UniProject.DataLayer.DTOs;
using UniProject.Repositories;
using UniProject.DataLayer.Entites;
using System.Security.Claims;
using System.Security;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;

namespace UniProject.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        private IUserRepository _repository;
        public UserController(IUserRepository repository)
        {
            _repository = repository;
        }


        #region Login
        [AllowAnonymous]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult Login(LoginViewModel login)
        {
            if(!ModelState.IsValid)
            {
                return View(login);
            }
            if(_repository.MatchLoginInfo(login.Email,login.Password)==false)
            {
                ModelState.AddModelError("Email", "اطلاعات وارد شده اشتباه است");
                return View(login);
            }

            var user=_repository.GetUserByEmail(login.Email);
            if(user!=null)
            {
                var claims = new List<Claim>()
                {
                    new Claim("UserId",user.Id.ToString()),
                    new Claim("Email",user.Email),
                    new Claim("FullName",user.Name+" "+user.Family),
                    new Claim("IsAdmin",user.IsAdmin.ToString())
                    

                };

                var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme); 
                var principal=new ClaimsPrincipal(identity);
                var properties = new AuthenticationProperties()
                {
                    IsPersistent = login.RememberMe
                };

                HttpContext.SignInAsync(principal, properties);
                return Redirect("/");
            }
            return BadRequest();
        }

        public IActionResult Logout()
        {
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return Redirect("/User/Login");
        }



        #endregion

        #region Register
        [AllowAnonymous]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(RegisterViewModel register)
        {
            if (!ModelState.IsValid)
            {
                return View(register);
            }

            if (_repository.ExistUser(register.Email, register.Phone))
            {
                ModelState.AddModelError("Name", "کاربری با چنین مشخصات قبلا ثبت نام کرده است");
                return View(register);
            }

            var user = new User()
            {
                Email = register.Email,
                Name = register.Name,
                Family = register.Family,
                Phone = register.Phone,
                Age = register.Age,
                City = register.City,
                IsAdmin = false,
                JoinDate = DateTime.Now,
                MeliCode = register.MeliCode,
                Password = register.Password
            };
            _repository.AddUser(user);
            return RedirectToAction("SuccessRegister");
        }
        #endregion

        #region UserPage
        public IActionResult UserPage()
        {
            var userEmail = User.FindFirstValue("Email");
            var user = _repository.GetUserByEmail(userEmail);
            return View(user);
        }
        #endregion

        #region EditUserPage
        public IActionResult EditUserPage(int id)
        {
            var user = _repository.GetUserById(id);
            var editUser = new EditViewModel()
            {
                Id = user.Id,
                Name = user.Name,
                Family = user.Family,
                Age = user.Age,
                City = user.City,
                Email = user.Email,
                Phone = user.Phone
            };
            return View(editUser);
        }

        [HttpPost]
        public IActionResult EditUserPage(EditViewModel edit)
        {
            if(!ModelState.IsValid)
            {
                return View(edit);
            }

            var user = _repository.GetUserById(edit.Id);
            user.Name = edit.Name;
            user.Family = edit.Family;
            user.Age = edit.Age;
            user.City = edit.City;
            user.Email = edit.Email;
            user.Phone = edit.Phone;
            _repository.EditUser(user);
            return RedirectToAction("UserPage");

        }
        #endregion

        #region ResetPassword
        public IActionResult ResetPassword()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ResetPassword(ResetPasswordViewModel reset)
        {
            if(!ModelState.IsValid)
            {
                return View(reset);
            }

            if(!_repository.ExistUserByPassword(reset.CurrentPassword))
            {
                ModelState.AddModelError("CurrentPassword", "پسوورد فعلی اشتباه است");
                return View(reset);
            }
            var user = _repository.GetUserByEmail(User.FindFirstValue("Email"));
            user.Password = reset.NewPassword;
            _repository.EditUser(user);
            return RedirectToAction("UserPage");
        }
        #endregion





    }
}
