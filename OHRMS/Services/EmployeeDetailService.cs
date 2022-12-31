using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class EmployeeDetailService : AbstractService
    {

        public EmployeeDetail find(string employeeNo)
        {
            try
            {
                EmployeeDetail entity = null;
                string query = "SELECT * " +
                               "FROM EmployeeDetails " +
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
                            entity = new EmployeeDetail();
                            entity.employeeNo = dataReader["employeeNo"].ToString();
                            entity.lastName = dataReader["lastName"].ToString();
                            entity.firstName = dataReader["firstName"].ToString();
                            entity.middleName = dataReader["middleName"].ToString();
                            entity.fullName = dataReader["fullName"].ToString();
                            entity.department = dataReader["department"].ToString();
                            entity.position = dataReader["position"].ToString();
                            entity.classification = dataReader["classification"].ToString();
                            entity.rankEmployee = dataReader["rankEmployee"].ToString();
                            entity.salaryRate = double.Parse(dataReader["salaryRate"].ToString());
                            entity.dateAppointment = DateTime.Parse(dataReader["dateAppointment"].ToString());
                            entity.statusOfEmployement = dataReader["statusOfEmployement"].ToString();
                            entity.employmentType = dataReader["employmentType"].ToString();
                            entity.newDateAppointment = dataReader["newDateAppointment"].ToString();
                            entity.newDepartment = dataReader["newDepartment"].ToString();
                            entity.newPosition = dataReader["newPosition"].ToString();
                            entity.dateSeparation = DateTime.Parse(dataReader["dateSeparation"].ToString());
                            entity.natureOfSeparation = dataReader["natureOfSeparation"].ToString();
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

        public bool save(EmployeeDetail entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO EmployeeDetails " +
                                   "(employeeNo, lastName, firstName, middleName, fullName, department, position, classification, rankEmployee, salaryRate, points, dateAppointment, statusOfEmployement, employmentType, newDateAppointment, newDepartment, newPosition, dateSeparation, natureOfSeparation) " +
                                   "VALUES " +
                                   "(@employeeNo, @lastName, @firstName, @middleName, @fullName, @department, @position, @classification, @rankEmployee, @salaryRate, @points, @dateAppointment, @statusOfEmployement, @employmentType, @newDateAppointment, @newDepartment, @newPosition, @dateSeparation, @natureOfSeparation) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNo", entity.employeeNo);
                    command.Parameters.AddWithValue("@lastName", entity.lastName);
                    command.Parameters.AddWithValue("@firstName", entity.firstName);
                    command.Parameters.AddWithValue("@middleName", entity.middleName);
                    command.Parameters.AddWithValue("@fullName", entity.fullName);
                    command.Parameters.AddWithValue("@department", entity.department);
                    command.Parameters.AddWithValue("@position", entity.position);
                    command.Parameters.AddWithValue("@classification", entity.classification);
                    command.Parameters.AddWithValue("@rankEmployee", entity.rankEmployee);
                    command.Parameters.AddWithValue("@salaryRate", entity.salaryRate);
                    command.Parameters.AddWithValue("@points", entity.point);
                    command.Parameters.AddWithValue("@dateAppointment", entity.dateAppointment);
                    command.Parameters.AddWithValue("@statusOfEmployement", entity.statusOfEmployement);
                    command.Parameters.AddWithValue("@employmentType", entity.employmentType);
                    command.Parameters.AddWithValue("@newDateAppointment", entity.newDateAppointment);
                    command.Parameters.AddWithValue("@newDepartment", entity.newDepartment);
                    command.Parameters.AddWithValue("@newPosition", entity.newPosition);
                    command.Parameters.AddWithValue("@dateSeparation", entity.dateSeparation);
                    command.Parameters.AddWithValue("@natureOfSeparation", entity.natureOfSeparation);
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

        public bool isExists(string employeeNo)
        {
            bool result = false;

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM EmployeeDetails " +
                                   "WHERE employeeNo = @employeeNo ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNo", employeeNo);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        result = true;
                    }
                    connection.Close();
                }
                return result;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return true;
            }
        }
    }
}