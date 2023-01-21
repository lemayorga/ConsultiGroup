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

            CreateMap<UpdateStudent, Student>()
                .AfterMap<UpdateStudentAfterMap>();
        }
    }

    public class UpdateStudentAfterMap : IMappingAction<UpdateStudent, Student>
    {
        public void Process(UpdateStudent source, Student destination, ResolutionContext context)
        {
            destination.Address = new Address
            {
                PostalAddress = source.PostalAddress,
                PhysicalAddress = source.PhysicalAddress
            };
        }
    }
}
