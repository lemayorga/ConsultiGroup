using Microsoft.EntityFrameworkCore;
using StudentAdminPortal.API.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace StudentAdminPortal.API.Repositories
{
    public class GenderRepository: IGenderRepository
    {
        private readonly StudentContext context;

        public GenderRepository(StudentContext context)
        {
            this.context = context;
        }

        public async Task<List<Gender>> GetAsync()
        {
            return await context.Gender.ToListAsync();
        }

        public async Task<Gender> GetAsync(Guid id)
        {
            return await context.Gender.FirstOrDefaultAsync(x => x.Id == id);
        }
    }
}
