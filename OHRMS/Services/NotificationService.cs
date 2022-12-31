using MySql.Data.MySqlClient;
using System;

namespace OHRMS.Services
{
    public class NotificationService : AbstractService
    {
        public bool save(string message, string employeeNo, string fullName, string userType, string deliverTo, DateTime date)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO Notification " +
                                   "(message, dateTime, isRead, employeeNo, fullName, userType, deliverTo) " +
                                   "VALUES " +
                                   "(@message, @dateTime, @isRead, @employeeNo, @fullName, @userType, @deliverTo)";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@message", message);
                    command.Parameters.AddWithValue("@dateTime", date);
                    command.Parameters.AddWithValue("@isRead", "FALSE");
                    command.Parameters.AddWithValue("@employeeNo", employeeNo);
                    command.Parameters.AddWithValue("@fullName", fullName);
                    command.Parameters.AddWithValue("@userType", userType);
                    command.Parameters.AddWithValue("@deliverTo", deliverTo);

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