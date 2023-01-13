using StudentAdminPortal.API.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace StudentAdminPortal.API.Repositories
{
    public interface IStudentRepository
    {
        List<Student> GetStudents();
        Task<List<Student>> GetStudentsAsync();
    }
}
