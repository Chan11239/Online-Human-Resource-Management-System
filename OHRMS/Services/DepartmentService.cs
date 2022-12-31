using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class DepartmentService : AbstractService
    {

        public bool save(Department entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO Departments " +
                                   "(classificationName, departmentName) " +
                                   "VALUES " +
                                   "(@classificationName, @departmentName) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@classificationName", entity.classificationName);
                    command.Parameters.AddWithValue("@departmentName", entity.departmentName);
                    command.ExecuteNonQuery();

                    connection.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }
    }
}