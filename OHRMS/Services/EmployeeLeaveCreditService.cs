using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class EmployeeLeaveCreditService : AbstractService
    {
        public EmployeeLeaveCredit find(int id)
        {
            try
            {
                EmployeeLeaveCredit entity = null;
                string query = "SELECT * " +
                               "FROM EmployeeLeaveCredits " +
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
                            entity = new EmployeeLeaveCredit();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.employeeNo = dataReader["employeeNo"].ToString();
                            entity.leaveTypeCode = dataReader["leaveTypeCode"].ToString();
                            entity.usedCredits = int.Parse(dataReader["usedCredits"].ToString());
                            entity.aquiredCredits = int.Parse(dataReader["aquiredCredits"].ToString());
                            entity.lastUsedCreditReset = DateTime.Parse(dataReader["lastUsedCreditReset"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
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

        public EmployeeLeaveCredit find(string employeeNo, string leaveTypeCode)
        {
            try
            {
                EmployeeLeaveCredit entity = null;
                string query = "SELECT * " +
                               "FROM EmployeeLeaveCredits " +
                               "WHERE employeeNo = @employeeNo " +
                               "AND leaveTypeCode = @leaveTypeCode ";

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNo", employeeNo);
                    command.Parameters.AddWithValue("@leaveTypeCode", leaveTypeCode);

                    using (MySqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            dataReader.Read();
                            entity = new EmployeeLeaveCredit();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.employeeNo = dataReader["employeeNo"].ToString();
                            entity.leaveTypeCode = dataReader["leaveTypeCode"].ToString();
                            entity.usedCredits = int.Parse(dataReader["usedCredits"].ToString());
                            entity.aquiredCredits = int.Parse(dataReader["aquiredCredits"].ToString());
                            entity.lastUsedCreditReset = DateTime.Parse(dataReader["lastUsedCreditReset"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
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

        public EmployeeLeaveCredit findActive(string employeeNo, string leaveTypeCode)
        {
            try
            {
                EmployeeLeaveCredit entity = null;
                string query = "SELECT * " +
                               "FROM EmployeeLeaveCredits " +
                               "WHERE employeeNo = '" + employeeNo + "' " +
                               "AND leaveTypeCode = '" + leaveTypeCode + "' " +
                               "AND isActive = 1 ";

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(query, connection);

                    using (MySqlDataReader dataReader = command.ExecuteReader())
                    {
                        if (dataReader.HasRows)
                        {
                            dataReader.Read();
                            entity = new EmployeeLeaveCredit();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.employeeNo = dataReader["employeeNo"].ToString();
                            entity.leaveTypeCode = dataReader["leaveTypeCode"].ToString();
                            entity.usedCredits = int.Parse(dataReader["usedCredits"].ToString());
                            entity.aquiredCredits = int.Parse(dataReader["aquiredCredits"].ToString());
                            entity.lastUsedCreditReset = DateTime.Parse(dataReader["lastUsedCreditReset"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
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

        public bool save(EmployeeLeaveCredit entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO EmployeeLeaveCredits " +
                                   "(employeeNo, leaveTypeCode, usedCredits, aquiredCredits) " +
                                   "VALUES " +
                                   "(@employeeNo, @leaveTypeCode, @usedCredits, @aquiredCredits) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNo", entity.employeeNo);
                    command.Parameters.AddWithValue("@leaveTypeCode", entity.leaveTypeCode);
                    command.Parameters.AddWithValue("@usedCredits", entity.usedCredits);
                    command.Parameters.AddWithValue("@aquiredCredits", entity.aquiredCredits);
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

        public bool update(EmployeeLeaveCredit entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE EmployeeLeaveCredits " +
                                   "SET employeeNo = @employeeNo, " +
                                   "leaveTypeCode = @leaveTypeCode, " +
                                   "usedCredits = @usedCredits, " +
                                   "aquiredCredits = @aquiredCredits, " +
                                   "lastUsedCreditReset = @lastUsedCreditReset, " +
                                   "lastModifiedDate = @lastModifiedDate, " +
                                   "isActive = @isActive " +
                                   "WHERE id = @id ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNo", entity.employeeNo);
                    command.Parameters.AddWithValue("@leaveTypeCode", entity.leaveTypeCode);
                    command.Parameters.AddWithValue("@usedCredits", entity.usedCredits);
                    command.Parameters.AddWithValue("@aquiredCredits", entity.aquiredCredits);
                    command.Parameters.AddWithValue("@lastUsedCreditReset", entity.lastUsedCreditReset);
                    command.Parameters.AddWithValue("@lastModifiedDate", entity.lastModifiedDate);
                    command.Parameters.AddWithValue("@isActive", entity.isActive == true ? 1 : 0);
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
    }
}