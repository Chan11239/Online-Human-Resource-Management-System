using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class ApplicantService : AbstractService
    {
        public Applicant find(int id)
        {
            try
            {
                Applicant entity = null;
                string query = "SELECT * " +
                               "FROM Applicants " +
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
                            entity = new Applicant();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;

                            entity.firstName = dataReader["firstName"].ToString();
                            entity.lastName = dataReader["lastName"].ToString();
                            entity.middleName = dataReader["middleName"].ToString();
                            entity.fullName = dataReader["fullName"].ToString();
                            entity.appliedPosition = dataReader["appliedPosition"].ToString();
                            entity.attachedResume = dataReader["attachedResume"].ToString();
                            
                            entity.intialInterview = dataReader["intialInterview"].ToString();
                            entity.intialInterviewDate = DateTime.Parse(dataReader["intialInterviewDate"].ToString());
                            entity.intialInterviewTime = TimeSpan.Parse(dataReader["intialInterviewTime"].ToString());
                            entity.intialInterviewPlace = dataReader["intialInterviewPlace"].ToString();

                            entity.hiredDate = DateTime.Parse(dataReader["hiredDate"].ToString());
                            entity.postedJobReferenceId = int.Parse(dataReader["postedJobReferenceId"].ToString());
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




        public bool update(Applicant entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO CertificateEmploymentRequest " +
                                   "(employeeNo, employeeName, purpose, prescribeAquireDate, coeType, status) " +
                                   "VALUES " +
                                   "(@employeeNo, @employeeName, @purpose, @prescribeAquireDate, @coeType, @status) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@status", entity.id);
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

        public bool updateStatus(Applicant entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO CertificateEmploymentRequest " +
                                   "(employeeNo, employeeName, purpose, prescribeAquireDate, coeType, status) " +
                                   "VALUES " +
                                   "(@employeeNo, @employeeName, @purpose, @prescribeAquireDate, @coeType, @status) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@status", entity.id);
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

        public bool updateAppointment(string fieldPrefix, int id, DateTime date, TimeSpan time, string place)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE Applicants " +
                                   "SET " + fieldPrefix + "Date = @date, " +
                                   fieldPrefix + "Time = @time, " +
                                   fieldPrefix + "Place = @place " +
                                   "WHERE id = @id ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@date", date);
                    command.Parameters.AddWithValue("@time", time);
                    command.Parameters.AddWithValue("@place", place);
                    command.Parameters.AddWithValue("@id", id);
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