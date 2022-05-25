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

        public bool ExistUser(string email, string phone)
        {
            return _context.Users.Any(u=> u.Email==email || u.Phone==phone);
        }
    }
}
