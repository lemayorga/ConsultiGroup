using AutoMapper;
using StudentAdminPortal.API.DomainModels;
using StudentAdminPortal.API.Models;
using System;

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
            
            CreateMap<AddStudent, Student>()
            .AfterMap<AddStudentRequestAfterMap>();
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

    public class AddStudentRequestAfterMap : IMappingAction<AddStudent, Student>
    {
        public void Process(AddStudent source, Student destination, ResolutionContext context)
        {
            destination.Id = Guid.NewGuid();
            destination.Address = new Address()
            {
                Id = Guid.NewGuid(),
                PhysicalAddress = source.PhysicalAddress,
                PostalAddress = source.PostalAddress
            };
        }
    }
}
