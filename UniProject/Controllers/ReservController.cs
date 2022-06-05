using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using UniProject.Repositories;
using UniProject.DataLayer.Entites;
using UniProject.DataLayer.DTOs;
using System.Security.Claims;

namespace UniProject.Controllers
{
    [Authorize]
    public class ReservController : Controller
    {
        private IReservRepository _repository;
        public ReservController(IReservRepository repository)
        {
            _repository = repository;
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            var allSpeciality = _repository.GetAllSpecialty();
            return View(allSpeciality);
        }

        [AllowAnonymous]
        public IActionResult ReservDetail(int id)
        {
            var speciality = _repository.GetSpecialtyById(id);
            if(speciality == null)
            {
                return NotFound();
            }
            return View(speciality);
        }

        public IActionResult GetVisit(int doctorId)
        {
            var doctor=_repository.GetDoctorById(doctorId);
            var times = _repository.GetTimes(doctorId);
            var result = new GetVisitViewModel()
            {
                Doctor = doctor,
                PresentOptions = times
            };
            return View(result);
            
        }

        public IActionResult SetVisit(int doctorId,int presentId)
        {
            var userId = int.Parse(User.FindFirstValue("UserId"));
            var present=_repository.GetPresentById(presentId);
            var doctor = _repository.GetDoctorById(doctorId);
            var reservationCode = Guid.NewGuid().ToString().GetHashCode().ToString("X");
            var reserv = new Reservs()
            {
                DoctorId = doctorId,
                UserId = userId,
                VisitDate = present.DayPresent + "  " + present.HoursPresent,
                ReservationCode=reservationCode,
                RequestDate=DateTime.Now
            };
            _repository.AddReserve(reserv);
            var result = new ResultSetVisitViewModel()
            {
                Doctor = doctor,
                Username = User.FindFirstValue("FullName"),
                VisitDate = reserv.VisitDate
            };
            ViewBag.code = reservationCode;
            ViewData["userId"] = userId;

            return View(result);
        }

        public IActionResult PersonReservs()
        {
            var userId = int.Parse(User.FindFirstValue("UserId"));
            var reservs = _repository.GetPersonReservs(userId);
            var res = reservs.Select(p => new PersonReserveViewModel()
            {
                RequestDate=p.RequestDate,
                Doctor=p.Doctor,
                SpecialityTitle=p.Doctor.SpecialtyTitle,
                VisitDate=p.VisitDate
            });
            ViewData["Username"] = User.FindFirstValue("FullName");
            ViewData["userId"] = userId;
            return View(res);

        }
    }
}
