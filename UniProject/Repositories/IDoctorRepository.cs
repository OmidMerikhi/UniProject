using UniProject.DataLayer.Entites;

namespace UniProject.Repositories
{
    public interface IDoctorRepository
    {
        List<Doctor> GetAllDoctor();
        void AddDoctor(Doctor doctor);
        void EditDoctor(Doctor doctor);
        Doctor GetDoctorById(int id);
        void DeleteDoctor(int id);
        List<Doctor> SearchDoctor(string search);
    }
}
