﻿using StudentAdminPortal.API.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace StudentAdminPortal.API.Repositories
{
    public interface IStudentRepository
    {
        List<Student> GetStudents();
        Task<List<Student>> GetStudentsAsync();
        Task<Student> GetStudentsAsync(Guid studentId);
        Task<bool> ExistsAsync(Guid studentId);
        Task<Student> UpdateStudentAsync(Guid studentId, Student stuent);
        Task<Student> DeleteStudent(Guid studentId);
        Task<Student> AddStudent(Student request);
        Task<bool> UpdateProfileImage(Guid studentId, string profileImageUrl);

        Task<Gender> GetGendersExistsAsync(Guid genderId);
    }
}
