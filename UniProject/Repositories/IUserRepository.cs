using UniProject.DataLayer.Entites;

namespace UniProject.Repositories
{
    public interface IUserRepository
    {
        void AddUser(User user);
        bool ExistUser(string email,string phone);
        bool MatchLoginInfo(string email, string password);
        User GetUserByEmail(string email);
        User GetUserById(int id);
    }
}
