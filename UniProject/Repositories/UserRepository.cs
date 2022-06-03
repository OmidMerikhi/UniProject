using UniProject.DataLayer.Entites;
using UniProject.DataLayer;

namespace UniProject.Repositories
{
    public class UserRepository : IUserRepository
    {
        private UniProjectContext _context;
        public UserRepository(UniProjectContext context)
        {
            _context = context;
        }
        public void AddUser(User user)
        {
            _context.Users.Add(user);
            _context.SaveChanges();
        }

        public void EditUser(User user)
        {
            _context.Update(user);
            _context.SaveChanges();
        }

        public bool ExistUser(string email, string phone)
        {
            return _context.Users.Any(u=> u.Email==email || u.Phone==phone);
        }

        public bool ExistUserByPassword(string password)
        {
            return _context.Users.Any(u => u.Password == password);
        }

        public User GetUserByEmail(string email)
        {
            return _context.Users.FirstOrDefault(u => u.Email == email);
        }

        public User GetUserById(int id)
        {
            return _context.Users.Find(id);
        }

        public bool MatchLoginInfo(string email, string password)
        {
            return _context.Users.Any(u => u.Email == email && u.Password == password);
        }
    }
}
