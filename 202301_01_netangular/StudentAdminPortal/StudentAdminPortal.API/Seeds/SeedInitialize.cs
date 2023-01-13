using Microsoft.EntityFrameworkCore;
using StudentAdminPortal.API.Models;
using System;

namespace StudentAdminPortal.API.Seeds
{
    public static class SeedInitialize
    {
        public static void Seed(ModelBuilder modelBuilder)
        {
            /*  var idMasculino = Guid.NewGuid();
              var idStudent = Guid.NewGuid();

              modelBuilder.Entity<Gender>().HasData
              (
                  new Gender { Id = idMasculino, Description = "Masculino" },
                  new Gender { Id = Guid.NewGuid(), Description = "Femenino" }
              );

              modelBuilder.Entity<Student>().HasData(
                  new Student 
                  {
                      Id = idStudent,
                      FirstName = "Alex Jhon",
                      LastName = "Mendez Ortiz",
                      DateOfBirth = DateTime.Parse("Jan 1, 2009"),
                      Mobile = "88888888",
                  }
              );
              modelBuilder.Entity<Address>().HasData(
                  new Address
                  {
                      PhysicalAddress = "Colon street",
                      PortalAddress = "yyyy",
                      StudentId = idStudent
                  }
              );

              idStudent = Guid.NewGuid();
              modelBuilder.Entity<Student>().HasData(
                  new Student
                  {
                      Id = idStudent,
                      FirstName = "Rose Amelia",
                      LastName = "Ulloa Noguera",
                      DateOfBirth = DateTime.Parse("Jan 1, 2010"),
                      Mobile = "454546",
                  }
              );

              modelBuilder.Entity<Address>().HasData(
                  new Address
                  {
                      PhysicalAddress = "Bo. Enrique Smith",
                      PortalAddress = "***",
                      StudentId = idStudent
                  }
              );
              */

        }
    }
}
