using MySql.Data.MySqlClient;

namespace OHRMS.Services
{
    public class ToDoService : AbstractService
    {
        public void save(string employeeNo, string title, string message)
        {

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO EmployeeNotes " +
                               "(EmployeeNumber, title, message) " +
                               "VALUES " +
                               "(@EmployeeNumber, @title, @message)";

                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@EmployeeNumber", employeeNo);
                command.Parameters.AddWithValue("@title", title);
                command.Parameters.AddWithValue("@message", message);;

                command.ExecuteNonQuery();

                connection.Close();
            }
        }
    }
}