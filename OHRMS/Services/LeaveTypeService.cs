using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;
using System.Configuration;

namespace OHRMS.Services
{
    public class LeaveTypeService
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();

        public bool save(LeaveType entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO LeaveTypes " +
                                   "(leaveTypeCode, leaveTypeName, leaveTypeDescription, maximumAllottedDays) " +
                                   "VALUES " +
                                   "(@leaveTypeCode, @leaveTypeName, @leaveTypeDescription, @maximumAllottedDays)";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@leaveTypeCode", entity.leaveTypeCode);
                    command.Parameters.AddWithValue("@leaveTypeName", entity.leaveTypeName);
                    command.Parameters.AddWithValue("@leaveTypeDescription", entity.leaveTypeDescription);
                    command.Parameters.AddWithValue("@maximumAllottedDays", entity.maximumAllottedDays);

                    command.ExecuteNonQuery();
                    connection.Close();
                    return true;
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }

        public bool update(LeaveType entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE LeaveTypes " +
                                   "SET leaveTypeCode = @leaveTypeCode, " +
                                   "leaveTypeName = @leaveTypeName, " +
                                   "leaveTypeDescription = @leaveTypeDescription, " +
                                   "maximumAllottedDays = @maximumAllottedDays " +
                                   "WHERE id = @id;";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@id", entity.id);
                    command.Parameters.AddWithValue("@leaveTypeCode", entity.leaveTypeCode);
                    command.Parameters.AddWithValue("@leaveTypeName", entity.leaveTypeName);
                    command.Parameters.AddWithValue("@leaveTypeDescription", entity.leaveTypeDescription);
                    command.Parameters.AddWithValue("@maximumAllottedDays", entity.maximumAllottedDays);

                    command.ExecuteNonQuery();
                    connection.Close();
                    return true;
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }

        public bool delete(int id)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "DELETE FROM LeaveTypes " +
                                   "WHERE id = @id ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@id", id);

                    command.ExecuteNonQuery();
                    connection.Close();
                    return true;
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }
    }
}