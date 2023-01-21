﻿using Microsoft.EntityFrameworkCore;
using StudentAdminPortal.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentAdminPortal.API.Repositories
{
    public class StudentRepository : IStudentRepository
    {
        private readonly StudentContext context;

        public StudentRepository(StudentContext context)
        {
            this.context = context;
        }
        public List<Student> GetStudents()
        {
           return context.Student.Include(nameof(Gender)).Include(nameof(Address)).ToList();
        }

        public async Task<List<Student>> GetStudentsAsync()
        {
            return await context.Student.Include(nameof(Gender)).Include(nameof(Address)).ToListAsync();
        }

        public async Task<Student> GetStudentsAsync(Guid studentId)
        {
            return await context.Student.Include(nameof(Gender)).Include(nameof(Address)).
                FirstOrDefaultAsync(x => x.Id == studentId);
        }

        public async Task<bool> ExistsAsync(Guid studentId)
        {
            return await context.Student.AnyAsync(x => x.Id == studentId);
        }

        public async Task<Student> UpdateStudentAsync(Guid studentId, Student stuent)
        {
            var extistStudent = await GetStudentsAsync(studentId);
            if (extistStudent != null)
            {

                extistStudent.FirstName = stuent.FirstName;
                extistStudent.LastName = stuent.LastName;
                extistStudent.DateOfBirth = stuent.DateOfBirth;
                extistStudent.Email = stuent.Email;
                extistStudent.Mobile = stuent.Mobile;
                extistStudent.ProfileImageUrl = stuent.ProfileImageUrl;
                extistStudent.GenderId = stuent.GenderId;
                extistStudent.Address.PhysicalAddress = stuent.Address.PhysicalAddress;
                extistStudent.Address.PostalAddress = stuent.Address.PostalAddress;

                await context.SaveChangesAsync();
    
            }
            return extistStudent;
        }
    }
}
