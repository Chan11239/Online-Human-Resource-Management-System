using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class LeaveApplicationService : AbstractService
    {
        public LeaveApplication find(int id)
        {
            try
            {
                LeaveApplication entity = null;
                string query = "SELECT * " +
                               "FROM LeaveApplications " +
                               "WHERE id = @id ";

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@id", id.ToString());
                    using (MySqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            dataReader.Read();
                            entity = new LeaveApplication();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.typeOfLeave = dataReader["typeOfLeave"].ToString();
                            entity.employeeNo = dataReader["employeeNo"].ToString();
                            entity.employeeName = dataReader["employeeName"].ToString();
                            entity.department = dataReader["department"].ToString();
                            entity.reasons = dataReader["reasons"].ToString();
                            entity.startDate = DateTime.Parse(dataReader["startDate"].ToString());
                            entity.endDate = DateTime.Parse(dataReader["endDate"].ToString());
                            entity.status = dataReader["status"].ToString();
                            entity.approver = dataReader["approver"].ToString();
                            //entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            //entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
                        }
                        dataReader.Close();
                    }
                    connection.Close();
                }

                return entity;

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return null;
            }
        }
    }
}