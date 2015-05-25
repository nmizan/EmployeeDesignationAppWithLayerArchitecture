using EmployeeDesignationWithLayerArchitecture.DAL.DAO;
using EmployeeDesignationWithLayerArchitecture.DAL.Gateway;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeDesignationWithLayerArchitecture.BLL
{
    class DesignationManager
    {

        DesignationGateway gateway = new DesignationGateway();

        public bool Save(Designation aDesignation,out string message)
        { 
          if(aDesignation.Code==string.Empty)
          {
              message="Pls Enter Code !";
              return false ;
          }
            else if(aDesignation.Title==string.Empty)
          {
              message= "Pls Enter Title !";
              return false;
          }
            else if(gateway.HasCodeExist(aDesignation.Code))
          {
            message= "Code is already Exist !";
            return false;
          }
          else if (gateway.HasTitleExist(aDesignation.Title))
          {
             message= "Title is already Exist !";
              return false;
          }

          else
          {
              message = "Designation Has Been Saved !";
              return gateway.SaveDesignation(aDesignation);
              
           }

        }
        public List<Designation> GetAllDesignation()
        {
            return gateway.GetAllDesignation();
        }
    }
}
