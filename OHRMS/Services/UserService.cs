using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class UserService : AbstractService
    {
        public LoginProfile getApplicantProfile(string userName)
        {
            try
            {
                LoginProfile profile = null; new LoginProfile();
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM Users " +
                                   "WHERE userName = '" + userName + "' " +
                                   "AND userType = 'APPLICANT' " +
                                   "AND isActive = 1";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        profile = new LoginProfile();
                        while (dataReader.Read())
                        {
                            profile.id = int.Parse(dataReader["id"].ToString());
                            profile.UserName = dataReader["userName"].ToString();
                            profile.FirstName = dataReader["firstName"].ToString();
                            profile.LastName = dataReader["lastName"].ToString();
                            profile.MiddleName = dataReader["middleName"].ToString();
                            profile.UserType = dataReader["userType"].ToString();
                            profile.Password = dataReader["password"].ToString();
                            dataReader.NextResult();
                        }
                    }

                    dataReader.Close();
                    connection.Close();
                }

                return profile;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return null;
            }
        }

        public LoginProfile getEmployeeProfile(string userName)
        {
            try
            {
                LoginProfile profile = null; new LoginProfile();
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT a.*, b.classification, b.position, b.department " +
                                   "FROM Users a " +
                                   "LEFT JOIN EmployeeDetails b ON a.userName = b.employeeNo " +
                                   "WHERE a.userName = '" + userName + "' " +
                                   "AND a.userType IN ('EMPLOYEE', 'ADMINISTRATOR') " +
                                   "AND a.isActive = 1";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        profile = new LoginProfile();
                        while (dataReader.Read())
                        {
                            profile.id = int.Parse(dataReader["id"].ToString());
                            profile.UserName = dataReader["userName"].ToString();
                            profile.FirstName = dataReader["firstName"].ToString();
                            profile.LastName = dataReader["lastName"].ToString();
                            profile.MiddleName = dataReader["middleName"].ToString();
                            profile.UserType = dataReader["userType"].ToString();
                            profile.Position = dataReader["position"].ToString();
                            profile.Department = dataReader["department"].ToString();
                            profile.Password = dataReader["password"].ToString();
                            profile.EmployeeClassification = dataReader["classification"].ToString();
                            dataReader.NextResult();
                        }
                    }

                    dataReader.Close();
                    connection.Close();
                }

                return profile;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return null;
            }
        }

        public LoginProfile getEmployeeProfile(string userName, string password)
        {
            try
            {
                LoginProfile profile = null; new LoginProfile();
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT a.*, b.classification, b.position, b.department " +
                                   "FROM Users a " +
                                   "LEFT JOIN EmployeeDetails b ON a.userName = b.employeeNo " +
                                   "WHERE a.userName = '" + userName + "' " +
                                   "AND a.password = '" + password + "' " +
                                   "AND a.userType IN ('EMPLOYEE', 'ADMINISTRATOR') " +
                                   "AND a.isActive = 1";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        profile = new LoginProfile();
                        while (dataReader.Read())
                        {
                            profile.id = int.Parse(dataReader["id"].ToString());
                            profile.UserName = dataReader["userName"].ToString();
                            profile.FirstName = dataReader["firstName"].ToString();
                            profile.LastName = dataReader["lastName"].ToString();
                            profile.MiddleName = dataReader["middleName"].ToString();
                            profile.UserType = dataReader["userType"].ToString();
                            profile.Position = dataReader["position"].ToString();
                            profile.Department = dataReader["department"].ToString();
                            profile.Password = dataReader["password"].ToString();
                            profile.EmployeeClassification = dataReader["classification"].ToString();
                            dataReader.NextResult();
                        }
                    }

                    dataReader.Close();
                    connection.Close();
                }

                return profile;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return null;
            }
        }

        public bool createEmployeeUser(string userName, string password, string firstName, string lastName)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO Users " +
                                   "(userName, password, userType, firstName, lastName, isActive) " +
                                   "VALUES " +
                                   "(@userName, @password, @userType, @firstName, @lastName, @isActive) ";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@userName", userName);
                    command.Parameters.AddWithValue("@password", password);
                    command.Parameters.AddWithValue("@userType", "EMPLOYEE");
                    command.Parameters.AddWithValue("@firstName", firstName);
                    command.Parameters.AddWithValue("@lastName", lastName);
                    command.Parameters.AddWithValue("@isActive", 1);

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