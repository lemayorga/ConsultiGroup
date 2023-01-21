using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using StudentAdminPortal.API.DomainModels;
using StudentAdminPortal.API.Models;
using StudentAdminPortal.API.Repositories;
using System;
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

        [HttpGet]
        [Route("[controller]/{studentId:guid}")]
        public async Task<IActionResult> GetAllStudents(Guid studentId)
        {
            var result = await _repoStudent.GetStudentsAsync(studentId);
            if (result == null)
            {
                return NotFound();
            }
            return Ok(_mapper.Map<StudentDto>(result));
        }


        [HttpPut]
        [Route("[controller]/{studentId:guid}")]
        public async Task<IActionResult> UpdateStudent(Guid studentId, [FromBody] UpdateStudent request)
        {
            if (await _repoStudent.ExistsAsync(studentId))
            {
                var model  = _mapper.Map<Student>(request);
                var result = await _repoStudent.UpdateStudentAsync(studentId, model);
                return Ok(_mapper.Map<StudentDto>(result));
            }
          
            return NotFound();
        }
    }
}
