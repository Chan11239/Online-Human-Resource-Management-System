using MySql.Data.MySqlClient;
using System;

namespace OHRMS.Services
{
    public class UserLogService : AbstractService
    {

        public void create(string userName, string fullName, string activity, DateTime date)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO userActivity " +
                                   "(employeeNo, fullName, activity, dateOfActivity) " +
                                   "VALUES " +
                                   "(@employeeNo, @fullName, @activity, @date)";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@employeeNo", userName);
                    command.Parameters.AddWithValue("@fullName", fullName);
                    command.Parameters.AddWithValue("@activity", activity);
                    command.Parameters.AddWithValue("@date", date);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }

        public void create(string userName, string fullName, string activity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO userActivity " +
                                   "(employeeNo, fullName, activity, dateOfActivity) " +
                                   "VALUES " +
                                   "(@employeeNo, @fullName, @activity, @dateOfActivity)";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@employeeNo", userName);
                    command.Parameters.AddWithValue("@fullName", fullName);
                    command.Parameters.AddWithValue("@activity", activity);
                    command.Parameters.AddWithValue("@dateOfActivity", DateTime.Now);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
    }
}