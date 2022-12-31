using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class ResignationApplicationService : AbstractService
    {
        public bool save(ResignationApplication entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO ResignationApplications " +
                                   "(employeeNo, employeeName, deliverTo, message, effectivityDate, status, approver, fileName) " +
                                   "VALUES " +
                                   "(@employeeNo, @employeeName, @deliverTo, @message, @effectivityDate, @status, @approver, @fileName) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNo", entity.employeeNo);
                    command.Parameters.AddWithValue("@employeeName", entity.employeeName);
                    command.Parameters.AddWithValue("@deliverTo", entity.deliverTo);
                    command.Parameters.AddWithValue("@message", entity.message);
                    command.Parameters.AddWithValue("@effectivityDate", entity.effectivityDate);
                    command.Parameters.AddWithValue("@status", "PENDING");
                    command.Parameters.AddWithValue("@approver", string.Empty);
                    command.Parameters.AddWithValue("@fileName", string.Empty);
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

        public bool update(ResignationApplication entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE ResignationApplications " +
                                   "SET lastModifiedDate = @lastModifiedDate, " +
                                   "isActive = @isActive, " +
                                   "employeeNo = @employeeNo, " +
                                   "employeeName = @employeeName, " +
                                   "deliverTo = @deliverTo, " +
                                   "message = @message, " +
                                   "effectivityDate = @effectivityDate, " +
                                   "status = @status, " +
                                   "approver = @approver, " +
                                   "fileName = @fileName " +
                                   "WHERE id = @id ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@lastModifiedDate", DateTime.Now);
                    command.Parameters.AddWithValue("@isActive", entity.isActive == true ? 1 : 0);
                    command.Parameters.AddWithValue("@employeeNo", entity.employeeNo);
                    command.Parameters.AddWithValue("@employeeName", entity.employeeName);
                    command.Parameters.AddWithValue("@deliverTo", entity.deliverTo);
                    command.Parameters.AddWithValue("@message", entity.message);
                    command.Parameters.AddWithValue("@effectivityDate", entity.effectivityDate);
                    command.Parameters.AddWithValue("@status", entity.status);
                    command.Parameters.AddWithValue("@approver", entity.approver);
                    command.Parameters.AddWithValue("@fileName", entity.fileName);
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

        public ResignationApplication find(int id)
        {
            try
            {
                ResignationApplication entity = null;
                string query = "SELECT * " +
                               "FROM ResignationApplications " +
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
                            entity = new ResignationApplication();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
                            entity.employeeNo = dataReader["employeeNo"].ToString();
                            entity.employeeName = dataReader["employeeName"].ToString();
                            entity.deliverTo = dataReader["deliverTo"].ToString();
                            entity.message = dataReader["message"].ToString();
                            entity.effectivityDate = DateTime.Parse(dataReader["effectivityDate"].ToString());
                            entity.status = dataReader["status"].ToString();
                            entity.approver = dataReader["approver"].ToString();
                            //entity.fileName = dataReader["fileName"].ToString();

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

        public bool checkExists(string employeeNo)
        {
            bool result = false;

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM ResignationApplications " +
                                   "WHERE employeeNo = '" + employeeNo + "' " +
                                   "AND status IN ('PENDING', 'APPROVED')" +
                                   "LIMIT 1";

                    MySqlCommand command = new MySqlCommand(query, connection);
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