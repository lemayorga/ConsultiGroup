using StudentAdminPortal.API.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace StudentAdminPortal.API.Repositories
{
    public interface IGenderRepository
    {
        Task<List<Gender>> GetAsync();
        Task<Gender> GetAsync(Guid id);
    }
}
