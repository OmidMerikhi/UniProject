using Microsoft.AspNetCore.Mvc;
using UniProject.Repositories;
using UniProject.DataLayer.Entites;

namespace UniProject.Controllers
{
    public class AdminController : Controller
    {
        private IUserRepository _userRepository;
        public AdminController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult UserManagement()
        {
            var allUser = _userRepository.GetAllUsers();
            return View(allUser);
        }

        #region AddUser
        public IActionResult AddUser()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddUser(User user)
        {
            user.JoinDate = DateTime.Now;
            _userRepository.AddUser(user);
            return RedirectToAction("UserManagement");
        }
        #endregion

        #region EditUser
        public IActionResult EditUser(int id)
        {
            var user=_userRepository.GetUserById(id);
            return View(user);
        }

        [HttpPost]
        public IActionResult EditUser(User user)
        {
            _userRepository.EditUser(user);
            return RedirectToAction("UserManagement");
        }
        #endregion

        #region DeleteUser
        public IActionResult DeleteUser(int id)
        {
            _userRepository.DeleteUser(id);
            return RedirectToAction("UserManagement");
        }
        #endregion
    }
}
