using UniProject.DataLayer.Entites;

namespace UniProject.Repositories
{
    public interface IUserRepository
    {
        void AddUser(User user);
        bool ExistUser(string email,string phone);
    }
}
