using Microsoft.AspNetCore.Mvc;
using UniProject.DataLayer.DTOs;
using UniProject.Repositories;
using UniProject.DataLayer.Entites;

namespace UniProject.Controllers
{
    public class UserController : Controller
    {
        private IUserRepository _repository;
        public UserController(IUserRepository repository)
        {
            _repository = repository;
        }
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(RegisterViewModel register)
        {
            if(!ModelState.IsValid)
            {
                return View(register);
            }

            if(_repository.ExistUser(register.Email,register.Phone))
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

        public IActionResult SuccessRegister()
        {
            return View();
        }
    }
}
