using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using UniProject.Repositories;

namespace UniProject.Controllers
{
    
    public class ReservController : Controller
    {
        private IReservRepository _repository;
        public ReservController(IReservRepository repository)
        {
            _repository = repository;
        }
        public IActionResult Index()
        {
            var allSpeciality = _repository.GetAllSpecialty();
            return View(allSpeciality);
        }

        public IActionResult ReservDetail(int id)
        {
            var speciality = _repository.GetSpecialtyById(id);
            if(speciality == null)
            {
                return NotFound();
            }
            return View(speciality);
        }
    }
}
