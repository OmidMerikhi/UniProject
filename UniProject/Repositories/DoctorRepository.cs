using UniProject.DataLayer.Entites;
using UniProject.DataLayer;

namespace UniProject.Repositories
{
    public class DoctorRepository : IDoctorRepository
    {
        private UniProjectContext _context;
        public DoctorRepository(UniProjectContext context)
        {
            _context = context;
        }

        public void AddDoctor(Doctor doctor)
        {
            _context.Doctors.Add(doctor);
            _context.SaveChanges();
        }

        public void DeleteDoctor(int id)
        {
            var doctor = GetDoctorById(id);
            _context.Doctors.Remove(doctor);
            _context.SaveChanges();
        }

        public void EditDoctor(Doctor doctor)
        {
            _context.Update(doctor);
            _context.SaveChanges();
        }

        public List<Doctor> GetAllDoctor()
        {
            return _context.Doctors.ToList();
        }

        public Doctor GetDoctorById(int id)
        {
            return _context.Doctors.Find(id);
        }

        public List<Doctor> SearchDoctor(string search)
        {
            return _context.Doctors.Where(d => d.Name.Contains(search) || d.Family.Contains(search) || d.City.Contains(search) || d.Email.Contains(search) || d.MedicalCode.Contains(search) || d.SpecialtyTitle.Contains(search) || d.OfficeName.Contains(search)).ToList();
        }
    }
}
