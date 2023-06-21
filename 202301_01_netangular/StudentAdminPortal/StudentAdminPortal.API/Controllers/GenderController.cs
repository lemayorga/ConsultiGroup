using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using StudentAdminPortal.API.DomainModels;
using StudentAdminPortal.API.Repositories;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace StudentAdminPortal.API.Controllers
{
    public class GenderController : Controller
    {
        private readonly IGenderRepository _repo;
        private readonly IMapper _mapper;

        public GenderController(IGenderRepository repo, IMapper mapper)
        {
            _repo = repo;
            _mapper = mapper;
        }

        [HttpGet]
        [Route("[controller]")]
        public async Task<IActionResult> Get()
        {
            var result = await _repo.GetAsync();
            return Ok(_mapper.Map<List<GenderDto>>(result));
        }

        [HttpGet]
        [Route("[controller]/{id:guid}")]
        public async Task<IActionResult> Get(Guid id)
        {
            var result = await _repo.GetAsync(id);
            if (result == null)
            {
                return NotFound();
            }
            return Ok(_mapper.Map<GenderDto>(result));
        }
    }
}
