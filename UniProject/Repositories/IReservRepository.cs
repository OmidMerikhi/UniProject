using UniProject.DataLayer.Entites;
using UniProject.DataLayer.DTOs;

namespace UniProject.Repositories
{
    public interface IReservRepository
    {
        List<Specialty> GetAllSpecialty();
        Specialty GetSpecialtyById(int id);
        Doctor GetDoctorById(int id);
        List<Present> GetTimes(int doctorId);
        Present GetPresentById(int id);
        void AddReserve(Reservs reserve);
        List<Reservs> GetPersonReservs(int userId);
    }
}
