using AutoMapper;
using StudentAdminPortal.API.DomainModels;
using StudentAdminPortal.API.Models;

namespace StudentAdminPortal.API.Profiles
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<StudentDto, Student>().ReverseMap();
            CreateMap<GenderDto, Gender>().ReverseMap();
            CreateMap<AddressDto, Address>().ReverseMap();
        }
    }
}
