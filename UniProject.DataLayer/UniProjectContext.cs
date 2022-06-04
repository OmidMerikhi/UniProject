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
        public DbSet<Present> Prepresents { set; get; }
        public DbSet<Specialty> Specialtys { set; get; }
        public DbSet<Sickness> Sickness { set; get; }
        public DbSet<DoctorToPresent> DoctorToPresents { set; get; }
        public DbSet<Reservs> Reservs { set; get; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DoctorToPresent>().HasKey(k => new { k.DoctorId, k.PresentId });
            base.OnModelCreating(modelBuilder);
        }

    }
}
