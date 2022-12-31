using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;

namespace OHRMS.Services
{
    public class PostedJobService : AbstractService
    {
        public PostedJob find(int id)
        {
            try
            {
                PostedJob entity = null;
                string query = "SELECT * " +
                               "FROM PostedJobs " +
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
                            entity = new PostedJob();
                            entity.id = int.Parse(dataReader["id"].ToString());
                            entity.lastModifiedDate = DateTime.Parse(dataReader["lastModifiedDate"].ToString());
                            entity.isActive = dataReader["isActive"].ToString() == "1" ? true : false;
                            entity.title = dataReader["title"].ToString();
                            entity.classification = dataReader["classification"].ToString();
                            entity.department = dataReader["department"].ToString();
                            entity.jobType = dataReader["jobType"].ToString();
                            entity.postDuration = DateTime.Parse(dataReader["postDuration"].ToString());
                            entity.educationalQualification = dataReader["educationalQualification"].ToString();
                            entity.yearExperience = dataReader["yearExperience"].ToString();
                            entity.generalQualifiacation = dataReader["generalQualifiacation"].ToString();
                            entity.jobResponsibilities = dataReader["jobResponsibilities"].ToString();
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

        public bool save(PostedJob entity)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO PostedJobs " +
                                   "(title, classification, department, jobType, postDuration, educationalQualification, yearExperience, generalQualifiacation, jobResponsibilities) " +
                                   "VALUES " +
                                   "(@title, @classification, @department, @jobType, @postDuration, @educationalQualification, @yearExperience, @generalQualifiacation, @jobResponsibilities) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@title", entity.title);
                    command.Parameters.AddWithValue("@classification", entity.classification);
                    command.Parameters.AddWithValue("@department", entity.department);
                    command.Parameters.AddWithValue("@jobType", entity.jobType);
                    command.Parameters.AddWithValue("@postDuration", entity.postDuration);
                    command.Parameters.AddWithValue("@educationalQualification", entity.educationalQualification);
                    command.Parameters.AddWithValue("@yearExperience", entity.yearExperience);
                    command.Parameters.AddWithValue("@generalQualifiacation", entity.generalQualifiacation);
                    command.Parameters.AddWithValue("@jobResponsibilities", entity.jobResponsibilities);
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
        public bool update(PostedJob entity, int id)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE PostedJobs " +
                                   "SET title = @title, classification = @classification, department = @department, jobType = @jobType, postDuration = @postDuration, educationalQualification = @educationalQualification, yearExperience = @yearExperience, generalQualifiacation = @generalQualifiacation, jobResponsibilities = @jobResponsibilities " +
                                   "WHERE id = @id";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@title", entity.title);
                    command.Parameters.AddWithValue("@classification", entity.classification);
                    command.Parameters.AddWithValue("@department", entity.department);
                    command.Parameters.AddWithValue("@jobType", entity.jobType);
                    command.Parameters.AddWithValue("@postDuration", entity.postDuration.ToLocalTime());
                    command.Parameters.AddWithValue("@educationalQualification", entity.educationalQualification);
                    command.Parameters.AddWithValue("@yearExperience", entity.yearExperience);
                    command.Parameters.AddWithValue("@generalQualifiacation", entity.generalQualifiacation);
                    command.Parameters.AddWithValue("@jobResponsibilities", entity.jobResponsibilities);
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