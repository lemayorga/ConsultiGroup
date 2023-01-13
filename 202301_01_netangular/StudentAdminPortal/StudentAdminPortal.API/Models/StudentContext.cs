using Microsoft.EntityFrameworkCore;
using StudentAdminPortal.API.Seeds;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentAdminPortal.API.Models
{
    public class StudentContext : DbContext
    {
        public StudentContext(DbContextOptions<StudentContext> options) : base(options)
        {

        }
       /* protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
           // SeedInitialize.Seed(modelBuilder);
        }*/

        public DbSet<Student> Student { get; set; }
        public DbSet<Gender> Gender { get; set; }
        public DbSet<Address> Address { get; set; }
    }
}
