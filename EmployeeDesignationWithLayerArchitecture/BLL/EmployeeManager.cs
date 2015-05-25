using EmployeeDesignationWithLayerArchitecture.DAL.DAO;
using EmployeeDesignationWithLayerArchitecture.DAL.Gateway;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeDesignationWithLayerArchitecture.BLL
{
    class EmployeeManager
    {
        EmployeeGateway employeegateway = new EmployeeGateway();

        public string SaveEmployee(Employee aEmployee)
        {
            if (employeegateway.HasEmailExist(aEmployee.Email))
            {
                return "Email has an already exist !";
            }
            else
            {
                return employeegateway.SaveEmployee(aEmployee);
            }
      }

        public string UpdateEmployee(Employee aEmployee)
        {
          Employee  selectedEmployee = employeegateway.FindEmployee(aEmployee.Email);
          if (selectedEmployee.Id != aEmployee.Id)
          {
              return "Your system already has an employee with this email address.";
          }
          else
          {
          return employeegateway.UpdateEmployee(aEmployee);
          }
        }

        public  string DeleteEmployee(Employee selectedEmployee)
        {
        return employeegateway.DeleteEmployee(selectedEmployee);
        }

        public List<Employee> GetAllEmployees(string nameWord)
        {
            return employeegateway.GetAllEmployee(nameWord);
        }

        public List<Employee> GetAllEmployees()
        {
            return employeegateway.GetAllEmployee();

        }
    }
}
