using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;

namespace OHRMS.Admin.Announcement
{
    public partial class Create : AbstractWebPage
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        private static readonly string pageBaseUrl = "~/Admin/Announcement";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Admin created announcement");
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO Announcements " +
                                   "(announcementType, title, message, startDate, endDate) " +
                                   "VALUES " +
                                   "(@announcementType, @title, @message, @startDate, @endDate)";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@announcementType", txtType.Text);
                    command.Parameters.AddWithValue("@title", txtTitle.Text);
                    command.Parameters.AddWithValue("@message", txtDescription.Text);
                    command.Parameters.AddWithValue("@startDate", txtStartDate.Text);
                    command.Parameters.AddWithValue("@endDate", txtEndDate.Text);

                    command.ExecuteNonQuery();
                    
                    connection.Close();
                }
                //Add Notification
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT employeeNo, fullName " +
                                   "FROM employeeDetails ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        getEmployeeNo.Add(reader["employeeNo"].ToString());
                        getEmployeeName.Add(reader["fullName"].ToString());
                    }
                    int i = 0;
                    foreach (string employeeNo in getEmployeeNo)
                    {
                        this.addToNotification(txtDescription.Text, employeeNo, "EMPLOYEE", getEmployeeName[i++]);
                    }

                    connection.Close();
                }
                
                Response.Redirect(pageBaseUrl + "/List.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        List<string> getEmployeeNo = new List<string>();
        List<string> getEmployeeName = new List<string>();

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(pageBaseUrl + "/List.aspx");
        }
    }
}