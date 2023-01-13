using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using StudentAdminPortal.API.DomainModels;
using StudentAdminPortal.API.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace StudentAdminPortal.API.Controllers
{
    public class StudentController : Controller
    {
        private readonly IStudentRepository _repoStudent;
        private readonly IMapper _mapper;

        public StudentController(IStudentRepository repo,IMapper mapper)
        {
            _repoStudent = repo;
            _mapper = mapper;
        }

        [HttpGet]
        [Route("[controller]")]
        public async Task<IActionResult> GetAllStudents()
        {
            var result =await  _repoStudent.GetStudentsAsync();
            return Ok(_mapper.Map<List<StudentDto>>(result));
        }
    }
}
