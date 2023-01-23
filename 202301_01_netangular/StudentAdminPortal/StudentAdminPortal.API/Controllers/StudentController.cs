using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StudentAdminPortal.API.DomainModels;
using StudentAdminPortal.API.Models;
using StudentAdminPortal.API.Repositories;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace StudentAdminPortal.API.Controllers
{
    [ApiController]
    public class StudentController : Controller
    {
        private readonly IStudentRepository _repoStudent;
        private readonly IMapper _mapper;
        IImageRepository _imageRepository;

        public StudentController(IStudentRepository repo,IMapper mapper,
            IImageRepository imageRepository)
        {
            _repoStudent = repo;
            _mapper = mapper;
            _imageRepository = imageRepository;
        }

        [HttpGet]
        [Route("[controller]")]
        public async Task<IActionResult> GetAllStudents()
        {
            var result =await  _repoStudent.GetStudentsAsync();
            return Ok(_mapper.Map<List<StudentDto>>(result));
        }

        [HttpGet]
        [Route("[controller]/{studentId:guid}"), ActionName("GetStudentAsync")]
        public async Task<IActionResult> GetStudentAsync(Guid studentId)
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
        public async Task<IActionResult> UpdateStudent([FromRoute] Guid studentId, [FromBody] UpdateStudent request)
        {
            if (await _repoStudent.ExistsAsync(studentId))
            {
                var model  = _mapper.Map<Student>(request);
                var result = await _repoStudent.UpdateStudentAsync(studentId, model);
                return Ok(_mapper.Map<StudentDto>(result));
            }
          
            return NotFound();
        }

        [HttpDelete]
        [Route("[controller]/{studentId:guid}")]
        public async Task<IActionResult> DeleteStudentAsync([FromRoute] Guid studentId)
        {
            if (await _repoStudent.ExistsAsync(studentId))
            {
                var student = await _repoStudent.DeleteStudent(studentId);
                return Ok(_mapper.Map<Student>(student));
            }

            return NotFound();
        }

        [HttpPost]
        [Route("[controller]/Add")]
        public async Task<IActionResult> AddStudentAsync([FromBody] AddStudent request)
        {
            try
            {
                var model = _mapper.Map<Student>(request);
                var student = await _repoStudent.AddStudent(model);
                return CreatedAtAction(nameof(GetStudentAsync), new { studentId = student.Id },
                    _mapper.Map<Student>(student));
            }
            catch (Exception ex)
            {
                _ = ex;

                throw;
            }
        }

        [HttpPost]
        [Route("[controller]/{studentId:guid}/upload-image")]
        public async Task<IActionResult> UploadImage([FromRoute] Guid studentId, IFormFile profileImage)
        {
            var validExtensions = new List<string>
            {
               ".jpeg",
               ".png",
               ".gif",
               ".jpg"
            };

            if (profileImage != null && profileImage.Length > 0)
            {
                var extension = Path.GetExtension(profileImage.FileName);
                if (validExtensions.Contains(extension))
                {
                    if (await _repoStudent.ExistsAsync(studentId))
                    {
                        var fileName = Guid.NewGuid() + Path.GetExtension(profileImage.FileName);

                        var fileImagePath = await _imageRepository.Upload(profileImage, fileName);

                        if (await _repoStudent.UpdateProfileImage(studentId, fileImagePath))
                        {
                            return Ok(fileImagePath);
                        }

                        return StatusCode(StatusCodes.Status500InternalServerError, "Error uploading image");
                    }
                }

                return BadRequest("This is not a valid Image format");
            }

            return NotFound();
        }
    }
}
