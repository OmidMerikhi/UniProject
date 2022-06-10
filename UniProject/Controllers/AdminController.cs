using Microsoft.AspNetCore.Mvc;
using UniProject.Repositories;
using UniProject.DataLayer.Entites;

namespace UniProject.Controllers
{
    public class AdminController : Controller
    {
        private IUserRepository _userRepository;
        private IDoctorRepository _doctorRepository;
        public AdminController(IUserRepository userRepository, IDoctorRepository doctorRepository)
        {
            _userRepository = userRepository;
            _doctorRepository = doctorRepository;
        }
        public IActionResult Index()
        {
            return View();
        }



        #region UserManagement

        #region ShowUsers
        public IActionResult UserManagement()
        {
            var allUser = _userRepository.GetAllUsers();
            return View(allUser);
        }
        #endregion

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
            var user = _userRepository.GetUserById(id);
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

        #region SearchUser
        public IActionResult SearchUser(string search)
        {
            var result = _userRepository.SearchUser(search);
            return View("UserManagement", result);
        }
        #endregion

        #endregion

        #region DoctorManagement

        #region ShowDoctors
        public IActionResult ShowDoctors()
        {
            var allDoctors = _doctorRepository.GetAllDoctor();
            return View(allDoctors);
        }


        #endregion

        #region AddDoctor
        public IActionResult AddDoctor()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddDoctor(Doctor doctor)
        {
            if(doctor.SpecialtyTitle.Contains("پزشک عمومی"))
            {
                doctor.SpecialtyId = 1;
            }
            else if(doctor.SpecialtyTitle.Contains("متخصص گوش و حلق و بینی"))
            {
                doctor.SpecialtyId = 2;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص کودکان"))
            {
                doctor.SpecialtyId = 4;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص بیماری های عفونی"))
            {
                doctor.SpecialtyId = 5;
            }
            else if (doctor.SpecialtyTitle.Contains("روانپزشک"))
            {
                doctor.SpecialtyId = 6;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص چشم"))
            {
                doctor.SpecialtyId = 8;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص زنان و زایمان"))
            {
                doctor.SpecialtyId = 9;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص قلب و عروق"))
            {
                doctor.SpecialtyId = 12;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص  گوارش"))
            {
                doctor.SpecialtyId = 14;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص مغز و اعصاب"))
            {
                doctor.SpecialtyId = 15;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص ارتوپد"))
            {
                doctor.SpecialtyId = 16;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص تغذیه"))
            {
                doctor.SpecialtyId = 17;
            }
            _doctorRepository.AddDoctor(doctor);
            return RedirectToAction("ShowDoctors");
        }
        #endregion

        #region EditDoctor
        public IActionResult EditDoctor(int id)
        {
            var doctor = _doctorRepository.GetDoctorById(id);
            return View(doctor);
        }

        [HttpPost]
        public IActionResult EditDoctor(Doctor doctor)
        {
            if (doctor.SpecialtyTitle.Contains("پزشک عمومی"))
            {
                doctor.SpecialtyId = 1;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص گوش و حلق و بینی"))
            {
                doctor.SpecialtyId = 2;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص کودکان"))
            {
                doctor.SpecialtyId = 4;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص بیماری های عفونی"))
            {
                doctor.SpecialtyId = 5;
            }
            else if (doctor.SpecialtyTitle.Contains("روانپزشک"))
            {
                doctor.SpecialtyId = 6;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص چشم"))
            {
                doctor.SpecialtyId = 8;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص زنان و زایمان"))
            {
                doctor.SpecialtyId = 9;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص قلب و عروق"))
            {
                doctor.SpecialtyId = 12;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص  گوارش"))
            {
                doctor.SpecialtyId = 14;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص مغز و اعصاب"))
            {
                doctor.SpecialtyId = 15;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص ارتوپد"))
            {
                doctor.SpecialtyId = 16;
            }
            else if (doctor.SpecialtyTitle.Contains("متخصص تغذیه"))
            {
                doctor.SpecialtyId = 17;
            }
            _doctorRepository.EditDoctor(doctor);
            return RedirectToAction("ShowDoctors");
        }
        #endregion

        #region DeleteDoctor
        public IActionResult DeleteDoctor(int id)
        {
            _doctorRepository.DeleteDoctor(id);
            return RedirectToAction("ShowDoctors");
        }
        #endregion

        #region SearchDoctor
        public IActionResult SearchDoctor(string search)
        {
            var result = _doctorRepository.SearchDoctor(search);
            return View("ShowDoctors", result);
        }
        #endregion


        #endregion

        #region ReserveManagement
        public IActionResult ShowReserves()
        {
            return View();
        }
        #endregion
    }
}
