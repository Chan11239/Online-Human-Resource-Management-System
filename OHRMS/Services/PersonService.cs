using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class PersonService : AbstractService
    {
        public Person find(string employeeNo)
        {
            try
            {
                Person entity = null;
                string query = "SELECT * " +
                               "FROM Persons " +
                               "WHERE employeeNo = @employeeNo ";

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNo", employeeNo);
                    using (MySqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            dataReader.Read();
                            entity = new Person();
                            entity.employeeNo = dataReader["employeeNo"].ToString();
                            entity.fullName = dataReader["fullName"].ToString();
                            entity.address = dataReader["address"].ToString();
                            entity.contactNumber = int.Parse(dataReader["contactNumber"].ToString());
                            entity.emailAddress = dataReader["emailAddress"].ToString();
                            entity.birthPlace = dataReader["birthPlace"].ToString();
                            entity.citizenship = dataReader["citizenship"].ToString();
                            entity.civilStatus = dataReader["civilStatus"].ToString();
                            entity.religion = dataReader["religion"].ToString();
                            entity.gender = dataReader["gender"].ToString();
                            entity.height = double.Parse(dataReader["height"].ToString());
                            entity.weight = double.Parse(dataReader["weight"].ToString());
                            entity.tinId = dataReader["tinId"].ToString();
                            entity.philHealthId = dataReader["philHealthId"].ToString();
                            entity.sssId = dataReader["sssId"].ToString();
                            entity.hdmfId = dataReader["hdmfId"].ToString();
                            entity.contactPerson = dataReader["contactPerson"].ToString();
                            entity.relationship = dataReader["relationship"].ToString();
                            entity.contactPersonNumber = int.Parse(dataReader["contactPersonNumber"].ToString());
                            entity.picture = dataReader["picture"].ToString();
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

        public bool save(Person entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO Persons " +
                                   "(employeeNo, fullName, address, contactNumber, emailAddress, birthPlace, birthday, citizenship, civilStatus, religion, gender, height, weight, tinId, philHealthId, sssId, hdmfId, contactPerson, relationship, contactPersonNumber, picture) " +
                                   "VALUES " +
                                   "(@employeeNo, @fullName, @address, @contactNumber, @emailAddress, @birthPlace, @birthday, @citizenship, @civilStatus, @religion, @gender, @height, @weight, @tinId, @philHealthId, @sssId, @hdmfId, @contactPerson, @relationship, @contactPersonNumber, @picture) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNo", entity.employeeNo);
                    command.Parameters.AddWithValue("@fullName", entity.fullName);
                    command.Parameters.AddWithValue("@address", entity.address);
                    command.Parameters.AddWithValue("@contactNumber", entity.contactNumber);
                    command.Parameters.AddWithValue("@emailAddress", entity.emailAddress);
                    command.Parameters.AddWithValue("@birthplace", entity.birthPlace);
                    command.Parameters.AddWithValue("@birthday", entity.birthday);
                    command.Parameters.AddWithValue("@citizenship", entity.citizenship);
                    command.Parameters.AddWithValue("@civilStatus", entity.civilStatus);
                    command.Parameters.AddWithValue("@religion", entity.religion);
                    command.Parameters.AddWithValue("@gender", entity.gender);
                    command.Parameters.AddWithValue("@height", entity.height);
                    command.Parameters.AddWithValue("@weight", entity.weight);
                    command.Parameters.AddWithValue("@tinId", entity.tinId);
                    command.Parameters.AddWithValue("@philHealthId", entity.philHealthId);
                    command.Parameters.AddWithValue("@sssId", entity.sssId);
                    command.Parameters.AddWithValue("@hdmfId", entity.hdmfId);
                    command.Parameters.AddWithValue("@contactPerson", entity.contactPerson);
                    command.Parameters.AddWithValue("@relationship", entity.relationship);
                    command.Parameters.AddWithValue("@contactPersonNumber", entity.contactPersonNumber);
                    command.Parameters.AddWithValue("@picture", entity.picture);
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

        public bool update(Person entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE Persons " +
                                   "SET fullName = @fullName, address = @address, " +
                                   "contactNumber = @contactNumber, emailAddress = @emailAddress, " +
                                   "birthPlace = @birthPlace, birthday = @birthday, " +
                                   "citizenship = @citizenship, civilStatus = @civilStatus, " +
                                   "religion = @religion, gender = @gender, " +
                                   "height = @height, weight = @weight, " +
                                   "tinId = @tinId, philHealthId = @philHealthId, " +
                                   "sssId = @sssId, hdmfId = @hdmfId, " +
                                   "contactPerson = @contactPerson, relationship = @relationship, " +
                                   "contactPersonNumber = @contactPersonNumber, picture = @picture " +
                                   "WHERE employeeNo = @employeeNo";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNo", entity.employeeNo);
                    command.Parameters.AddWithValue("@fullName", entity.fullName);
                    command.Parameters.AddWithValue("@address", entity.address);
                    command.Parameters.AddWithValue("@contactNumber", entity.contactNumber);
                    command.Parameters.AddWithValue("@emailAddress", entity.emailAddress);
                    command.Parameters.AddWithValue("@birthplace", entity.birthPlace);
                    command.Parameters.AddWithValue("@birthday", entity.birthday);
                    command.Parameters.AddWithValue("@citizenship", entity.citizenship);
                    command.Parameters.AddWithValue("@civilStatus", entity.civilStatus);
                    command.Parameters.AddWithValue("@religion", entity.religion);
                    command.Parameters.AddWithValue("@gender", entity.gender);
                    command.Parameters.AddWithValue("@height", entity.height);
                    command.Parameters.AddWithValue("@weight", entity.weight);
                    command.Parameters.AddWithValue("@tinId", entity.tinId);
                    command.Parameters.AddWithValue("@philHealthId", entity.philHealthId);
                    command.Parameters.AddWithValue("@sssId", entity.sssId);
                    command.Parameters.AddWithValue("@hdmfId", entity.hdmfId);
                    command.Parameters.AddWithValue("@contactPerson", entity.contactPerson);
                    command.Parameters.AddWithValue("@relationship", entity.relationship);
                    command.Parameters.AddWithValue("@contactPersonNumber", entity.contactPersonNumber);
                    command.Parameters.AddWithValue("@picture", entity.picture);
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