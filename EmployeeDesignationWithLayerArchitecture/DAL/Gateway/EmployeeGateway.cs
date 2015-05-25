using EmployeeDesignationWithLayerArchitecture.DAL.DAO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeDesignationWithLayerArchitecture.DAL.Gateway
{
    class EmployeeGateway
    {
        DesignationGateway gateway = new DesignationGateway();
        private string connectionString = ConfigurationManager.ConnectionStrings["EmployeeConObj"].ConnectionString;

        public string SaveEmployee(Employee aEmployee)
        {
            string message = "";
            SqlConnection connection = new SqlConnection(connectionString);

            string query = string.Format("INSERT INTO tbl_EmployeeInfo VALUES ('{0}','{1}','{2}','{3}')", aEmployee.Name, aEmployee.Email,aEmployee.Address,aEmployee.DesignationId.Id);
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            message = "Employee : " +aEmployee.Name + " Has been Saved !";
            return message;
        }
        public string UpdateEmployee(Employee aEmployee)
        {
            string message = "";
            SqlConnection connection = new SqlConnection(connectionString);

            string query = string.Format("UPDATE tbl_EmployeeInfo SET Name='{0}',Email='{1}',Address='{2}',DesignationId={3},WHERE Id={4}", aEmployee.Name, aEmployee.Email, aEmployee.Address, aEmployee.DesignationId, aEmployee.Id);
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            message =  " Employee Has been Updated!";
            return message;
        }
        public string DeleteEmployee(Employee selectedEmployee)
        {
            string message = "";
            SqlConnection connection = new SqlConnection(connectionString);

            string query = string.Format("DELETE FROM tbl_EmployeeInfo WHWRE Id='{0}'",selectedEmployee.Id );
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            message = "Employee : " + selectedEmployee.Name + " Has been Deleted !";
            return message;
        }
        public List<Employee> GetAllEmployee(string partOfName)
        {

            List<Employee> employees = new List<Employee>();

            SqlConnection connection = new SqlConnection(connectionString);
            string query = ("SELECT * FROM tbl_EmployeeInfo " );
            if (partOfName != "")
            {
                query +=  String.Format(" WHERE Name LIKE '%{0}%'", partOfName);
            }
            query += " ORDER BY Name";

            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                Employee aEmployee = new Employee();
                aEmployee.Id = int.Parse(reader["Id"].ToString());
                aEmployee.Name=reader["Name"].ToString();
                aEmployee.Email = reader["Email"].ToString();
                aEmployee.Address = reader["Address"].ToString();
                aEmployee.DesignationId=gateway.GetDesignationID(int.Parse(reader["DesignationId"].ToString()));
                employees.Add(aEmployee);
            }
            reader.Close();
            connection.Close();
            return employees;
        }

        public List<Employee> GetAllEmployee()
        {
            string nameOfName = "";
            return GetAllEmployee(nameOfName);
        }

        public Employee FindEmployee(string email)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = string.Format("SELECT * FROM tbl_EmployeeInfo WHERE Email='{0}'",email);
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Employee aEmployee = new Employee();
                aEmployee.Id = int.Parse(reader["Id"].ToString());
                aEmployee.Name=reader["Name"].ToString();
                aEmployee.Address = reader["Address"].ToString();
                aEmployee.DesignationId=gateway.GetDesignationID(int.Parse(reader["DesignationId"].ToString()));
                return aEmployee;
            }
            reader.Close();
            connection.Close();
            return null;
            
          }
        public bool HasEmailExist(string email)
        { 
            if(FindEmployee(email)!= null)
            {
                return true;
            }
        else
            {
                return false;
            }
        }
    }
}
