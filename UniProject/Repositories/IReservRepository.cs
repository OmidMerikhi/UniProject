using UniProject.DataLayer.Entites;
using UniProject.DataLayer.DTOs;

namespace UniProject.Repositories
{
    public interface IReservRepository
    {
        List<Specialty> GetAllSpecialty();
        Specialty GetSpecialtyById(int id);
    }
}
