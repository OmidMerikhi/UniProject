using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using UniProject.DataLayer.Entites;

namespace UniProject.DataLayer
{
    public class UniProjectContext:DbContext
    {
        public UniProjectContext(DbContextOptions<UniProjectContext> option):base(option)
        {

        }

        public DbSet<User> Users { set; get; }
        public DbSet<Doctor> Doctors { set; get; }
        public DbSet<DiseaseCategory> Diseases { set; get; }

    }
}
