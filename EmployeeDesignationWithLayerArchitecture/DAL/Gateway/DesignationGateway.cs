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
    class DesignationGateway
    {
     private   string connectionStering = ConfigurationManager.ConnectionStrings["EmployeeConObj"].ConnectionString;

        public bool SaveDesignation(Designation aDesignation)
        {
            SqlConnection connection = new SqlConnection(connectionStering);

            string query = string.Format("INSERT INTO tbl_Designation VALUES ('{0}','{1}')", aDesignation.Code,aDesignation.Title);
            SqlCommand cmd = new SqlCommand(query,connection);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            return true;
        }

        public bool HasCodeExist(string Code)
        {

            bool isCodeExist = false;
            SqlConnection connection = new SqlConnection(connectionStering);

            string query = string.Format("SELECT Code  FROM tbl_Designation WHERE Code='{0}'", Code);
            SqlCommand cmd = new SqlCommand(query, connection);
            
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                isCodeExist = true;
                break;
            
            }
            reader.Close();
            connection.Close();
            return isCodeExist;
        }

        public bool HasTitleExist(string Title)
        {

            bool isTitleExist = false;
            SqlConnection connection = new SqlConnection(connectionStering);

            string query = string.Format("SELECT Title  FROM tbl_Designation WHERE Title='{0}'", Title);
            SqlCommand cmd = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                isTitleExist = true;
                break;

            }
            reader.Close();
            connection.Close();
            return isTitleExist;
        }
        public Designation GetDesignationID(int Id)
        {
            SqlConnection connection = new SqlConnection(connectionStering);

            string query = string.Format("SELECT *  FROM tbl_Designation WHERE Id='{0}'", Id);
            SqlCommand cmd = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            Designation aDesignation = new Designation();
            while (reader.Read())
            {
                
                aDesignation.Id = Convert.ToInt32(reader["Id"]);
                aDesignation.Code = reader["Code"].ToString();
                aDesignation.Title = reader["Title"].ToString();
                

             }
            reader.Close();
            connection.Close();
            return aDesignation;
        }

        public List<Designation> GetAllDesignation()
        {
            List<Designation> designations = new List<Designation>();
            SqlConnection connection = new SqlConnection(connectionStering);

            string query = string.Format("SELECT *  FROM tbl_Designation");
            SqlCommand cmd = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            
            while (reader.Read())
            {
                Designation aDesignation = new Designation();
                aDesignation.Id = Convert.ToInt32(reader["Id"]);
                aDesignation.Code = reader["Code"].ToString();
                aDesignation.Title = reader["Title"].ToString();
                designations.Add(aDesignation);
            }
            reader.Close();
            connection.Close();
            return designations;

        }
    }
}
