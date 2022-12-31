using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class CertificateEmploymentRequestService : AbstractService
    {
        public bool save(CertificateEmploymentRequest entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO CertificateEmploymentRequest " +
                                   "(employeeNo, employeeName, department, purpose, salaryRate, prescribeAquireDate, coeType, status) " +
                                   "VALUES " +
                                   "(@employeeNo, @employeeName, @department, @purpose, @salaryRate, @prescribeAquireDate, @coeType, @status) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNo", entity.employeeNo);
                    command.Parameters.AddWithValue("@employeeName", entity.employeeName);
                    command.Parameters.AddWithValue("@department", entity.department);
                    command.Parameters.AddWithValue("@purpose", entity.purpose);
                    command.Parameters.AddWithValue("@salaryRate", entity.salary);
                    command.Parameters.AddWithValue("@prescribeAquireDate", entity.prescribeAquireDate);
                    command.Parameters.AddWithValue("@coeType", entity.coeType);
                    command.Parameters.AddWithValue("@status", entity.status);
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
        public CertificateEmploymentRequest find(int id)
        {
            try
            {
                CertificateEmploymentRequest entity = null;
                string query = "SELECT * " +
                               "FROM certificateemploymentrequest " +
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
                            entity = new CertificateEmploymentRequest();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
                            entity.employeeNo = dataReader["employeeNo"].ToString();
                            entity.employeeName = dataReader["employeeName"].ToString();
                            entity.department = dataReader["department"].ToString();
                            entity.purpose = dataReader["purpose"].ToString();
                            entity.salary = double.Parse(dataReader["salaryRate"].ToString());
                            entity.prescribeAquireDate = DateTime.Parse(dataReader["prescribeAquireDate"].ToString());
                            entity.status = dataReader["status"].ToString();
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
    }
}