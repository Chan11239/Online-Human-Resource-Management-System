using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class AutoNumberService : AbstractService
    {
        public string getEmployeeNo(string employeeSuffix)
        {
            string employeePrefix = "BLG";
            int employeePadding = 4;
            string employeeGroupType = "EMPLOYEE NO";

            AutoNumber autoNumber = find(employeeGroupType);
            if (autoNumber == null)
            {
                autoNumber = new AutoNumber()
                {
                    prefix = employeePrefix,
                    suffix = employeeSuffix,
                    zeroPadding = employeePadding,
                    groupType = employeeGroupType
                };
                save(autoNumber);
                autoNumber = find(employeeGroupType);
            }

            autoNumber.suffix = employeeSuffix;
            update(autoNumber);
            AutoNumber newAutoNumber = find(autoNumber.id);

            return newAutoNumber.displaySequence;
        }

        public string getNewEmployeeNo(string employeeSuffix)
        {
            string employeePrefix = "BLG";
            int employeePadding = 4;
            string employeeGroupType = "EMPLOYEE NO";

            AutoNumber autoNumber = find(employeeGroupType);
            if (autoNumber == null)
            {
                autoNumber = new AutoNumber()
                {
                    prefix = employeePrefix,
                    suffix = employeeSuffix,
                    zeroPadding = employeePadding,
                    groupType = employeeGroupType,
                    currentSequence = 0
                };
                save(autoNumber);
                autoNumber = find(employeeGroupType);
            }

            string startSequence = (autoNumber.currentSequence + 1).ToString();
            char charPadding = '0';
            string displaySequence = autoNumber.prefix + startSequence.PadLeft(autoNumber.zeroPadding, charPadding) + employeeSuffix;
            return displaySequence;
        }

        public bool updateNewEmployeeNo(string employeeNo)
        {
            string employeePrefix = "BLG";
            int employeePadding = 4;
            string employeeGroupType = "EMPLOYEE NO";
            int sequence = int.Parse(employeeNo.Substring(3, 4)) - 1;

            AutoNumber autoNumber = find(employeePrefix, employeeGroupType, employeePadding, sequence);
            if (autoNumber == null)
            {
                return false;
            }

            update(autoNumber);

            return true;
        }

        public AutoNumber find(int id)
        {
            try
            {
                AutoNumber entity = null;
                string query = "SELECT * " +
                               "FROM AutoNumbers " +
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
                            entity = new AutoNumber();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
                            entity.prefix = dataReader["prefix"].ToString();
                            entity.suffix = dataReader["suffix"].ToString();
                            entity.currentSequence = int.Parse(dataReader["currentSequence"].ToString());
                            entity.zeroPadding = int.Parse(dataReader["zeroPadding"].ToString());
                            entity.displaySequence = dataReader["displaySequence"].ToString();
                            entity.groupType = dataReader["groupType"].ToString();
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

        private AutoNumber find(string groupType)
        {
            try
            {
                AutoNumber entity = null;
                string query = "SELECT * " +
                               "FROM AutoNumbers " +
                               "WHERE groupType = @groupType ";

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@groupType", groupType);
                    
                    using (MySqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            dataReader.Read();
                            entity = new AutoNumber();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
                            entity.prefix = dataReader["prefix"].ToString();
                            entity.suffix = dataReader["suffix"].ToString();
                            entity.currentSequence = int.Parse(dataReader["currentSequence"].ToString());
                            entity.zeroPadding = int.Parse(dataReader["zeroPadding"].ToString());
                            entity.displaySequence = dataReader["displaySequence"].ToString();
                            entity.groupType = dataReader["groupType"].ToString();
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

        private AutoNumber find(string prefix, string groupType, int zeroPadding, int currentSequence)
        {
            try
            {
                AutoNumber entity = null;
                string query = "SELECT * " +
                               "FROM AutoNumbers " +
                               "WHERE groupType = @groupType " +
                               "AND prefix = @prefix " +
                               "AND zeroPadding = @zeroPadding " +
                               "AND currentSequence = @currentSequence ";

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@groupType", groupType);
                    command.Parameters.AddWithValue("@prefix", prefix);
                    command.Parameters.AddWithValue("@zeroPadding", zeroPadding);
                    command.Parameters.AddWithValue("@currentSequence", currentSequence);
                    using (MySqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            dataReader.Read();
                            entity = new AutoNumber();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
                            entity.prefix = dataReader["prefix"].ToString();
                            entity.suffix = dataReader["suffix"].ToString();
                            entity.currentSequence = int.Parse(dataReader["currentSequence"].ToString());
                            entity.zeroPadding = int.Parse(dataReader["zeroPadding"].ToString());
                            entity.displaySequence = dataReader["displaySequence"].ToString();
                            entity.groupType = dataReader["groupType"].ToString();
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

        private bool save(AutoNumber entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO AutoNumbers " +
                                   "(prefix, suffix, zeroPadding, displaySequence, groupType) " +
                                   "VALUES " +
                                   "(@prefix, @suffix, @zeroPadding, @displaySequence, @groupType) ";

                    string startSequence = entity.currentSequence.ToString();
                    char charPadding = '0';
                    string displaySequence = entity.prefix + startSequence.PadLeft(entity.zeroPadding, charPadding) + entity.suffix;

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@prefix", entity.prefix);
                    command.Parameters.AddWithValue("@suffix", entity.suffix);
                    command.Parameters.AddWithValue("@zeroPadding", entity.zeroPadding);
                    command.Parameters.AddWithValue("@displaySequence", displaySequence);
                    command.Parameters.AddWithValue("@groupType", entity.groupType);
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

        private bool update(AutoNumber entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE AutoNumbers " +
                                   "SET lastModifiedDate = @lastModifiedDate, " +
                                   "prefix = @prefix, " +
                                   "suffix = @suffix, " +
                                   "currentSequence = @currentSequence, " +
                                   "zeroPadding = @zeroPadding, " +
                                   "displaySequence = @displaySequence, " +
                                   "groupType = @groupType " +
                                   "WHERE id = @id ";

                    string startSequence = (entity.currentSequence + 1).ToString();
                    char charPadding = '0';
                    string displaySequence = entity.prefix + startSequence.PadLeft(entity.zeroPadding, charPadding) + entity.suffix;

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@lastModifiedDate", DateTime.Now);
                    command.Parameters.AddWithValue("@prefix", entity.prefix);
                    command.Parameters.AddWithValue("@suffix", entity.suffix);
                    command.Parameters.AddWithValue("@currentSequence", entity.currentSequence + 1);
                    command.Parameters.AddWithValue("@zeroPadding", entity.zeroPadding);
                    command.Parameters.AddWithValue("@displaySequence", displaySequence);
                    command.Parameters.AddWithValue("@groupType", entity.groupType);
                    command.Parameters.AddWithValue("@id", entity.id);
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

        public string generatePassword(bool alphaNumeric, int size)
        {
            string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
            string numbers = "1234567890";

            string characters = numbers;
            if (alphaNumeric)
            {
                characters += alphabets + small_alphabets + numbers;
            }

            int length = size;
            string otp = string.Empty;
            
            for (int i = 0; i < length; i++)
            {
                string character = string.Empty;
                do
                {
                    int index = new Random().Next(0, characters.Length);
                    character = characters.ToCharArray()[index].ToString();
                } while (otp.IndexOf(character) != -1);
                otp += character;
            }

            return otp;
        }
    }
}