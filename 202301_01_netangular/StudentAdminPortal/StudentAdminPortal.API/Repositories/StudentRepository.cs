using Microsoft.EntityFrameworkCore;
using StudentAdminPortal.API.Models;
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
    }
}
