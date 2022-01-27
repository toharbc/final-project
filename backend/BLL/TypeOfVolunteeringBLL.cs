﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
using BLL.Converters;

namespace BLL
{
    public class TypeOfVolunteeringBLL

    {
        TypeOfVolunteeringDAL typeOfVolunteeringDAL = new TypeOfVolunteeringDAL();
        public List<TypeOfVolunteeringDTO> GetAllTypeOfVolunteerings()
        {
            return TypeOfVolunteeringConverter.Map(typeOfVolunteeringDAL.GetAllTypeOfVolunteering());
        }

        public void AddTypeOfVolunteering(TypeOfVolunteeringDTO typeOfVolunteering)
        {
            TypeOfVolunteeringDAL.AddTypeOfVolunteering(TypeOfVolunteeringConverter.Map(typeOfVolunteering));
        }
    }
}
