using UniProject.DataLayer.Entites;
using UniProject.DataLayer;
using Microsoft.EntityFrameworkCore;

namespace UniProject.Repositories
{
    public class ReservRepository : IReservRepository
    {
        private UniProjectContext _context;
        public ReservRepository(UniProjectContext context)
        {
            _context = context;
        }

        public void AddReserve(Reservs reserve)
        {
            _context.Reservs.Add(reserve);
            _context.SaveChanges();
        }

        public List<Specialty> GetAllSpecialty()
        {
            return _context.Specialtys.ToList();
        }

        public Doctor GetDoctorById(int id)
        {
            return _context.Doctors.Where(d => d.Id == id).FirstOrDefault();
        }

        public List<Reservs> GetPersonReservs(int userId)
        {
            return _context.Reservs.Include(d=> d.Doctor).Where(r => r.UserId == userId).ToList();
        }

        public Present GetPresentById(int id)
        {
            return _context.Prepresents.Find(id);
        }

        public Specialty GetSpecialtyById(int id)
        {
            return _context.Specialtys.Include(s => s.Doctors).Where(s => s.Id == id).FirstOrDefault();
        }

        public List<Present> GetTimes(int doctorId)
        {
            return _context.Doctors.Where(i=> i.Id==doctorId).SelectMany(t => t.DoctorToPresents).Select(t => t.Present).ToList();
        }
    }
}
