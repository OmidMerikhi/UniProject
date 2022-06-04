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
        public List<Specialty> GetAllSpecialty()
        {
            return _context.Specialtys.ToList();
        }

        public Specialty GetSpecialtyById(int id)
        {
            return _context.Specialtys.Include(s => s.Doctors).Where(s => s.Id == id).FirstOrDefault();
        }
    }
}
