using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class SignatoryOfficerService : AbstractService
    {

        public SignatoryOfficer find(string abbrPosition)
        {
            try
            {
                SignatoryOfficer entity = null;
                string query = "SELECT * " +
                               "FROM SignatoryOfficers " +
                               "WHERE abbrPosition = @abbrPosition ";

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@abbrPosition", abbrPosition);
                    using (MySqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            dataReader.Read();
                            entity = new SignatoryOfficer();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
                            entity.abbrPosition = dataReader["abbrPosition"].ToString();
                            entity.officerName = dataReader["officerName"].ToString();
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