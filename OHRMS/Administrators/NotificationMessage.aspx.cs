using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;
using System.Web.UI;

namespace OHRMS.Administrators
{
    public partial class NotificationMessage : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        private ApplicantService applicantService = new ApplicantService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["notifId"] != null)
                {
                    int id = int.Parse(Request.QueryString["notifId"]);
                    this.getNotification(id);

                    if (lblMessage.Text == "Applicant Request for Reschedule")
                    {
                        resched.Visible = true;
                    }
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("NotificationList.aspx");
        }

        private void getNotification(int id)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM notification " +
                                   "WHERE id = " + id.ToString() + "";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        while (dataReader.Read())
                        {
                            lblName.Text = dataReader["fullName"].ToString();
                            lblMessage.Text = dataReader["message"].ToString();
                            lblDate.Text = dataReader["dateTime"].ToString();
                            dataReader.NextResult();
                        }
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }

        protected void btnResched_Click(object sender, EventArgs e)
        {
            txtDate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            txtTime.Text = "09:00";
            txtPlace.Text = "STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan";

            mpeReschedule.Show();
        }

        protected void btnSubmitAppointment_Click(object sender, EventArgs e)
        {
            try
            {
                string status = string.Empty;
                string query = "SELECT status " +
                               "FROM applicantprocessnotification " +
                               "WHERE deliverTo='" + lblName.Text + "' ";
                DataRow drStatus = webHelperService.getByDataRow(query);
                if (drStatus != null)
                {
                    status = drStatus["status"].ToString();
                }

                updateApplication(lblName.Text, status, 
                                  DateTime.Parse(txtDate.Text), 
                                  TimeSpan.Parse(txtTime.Text), 
                                  txtPlace.Text);
                this.showMessage("New Schedule Sent!");
                updateApplicantProcess(DateTime.Parse(txtDate.Text), TimeSpan.Parse(txtTime.Text), txtPlace.Text);
                
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        private void updateApplication(string name, string status, DateTime date, TimeSpan time, string place)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE Applicants " +
                                   "SET " + status + "Date = @date, " +
                                   status + "Time = @time, " +
                                   status + "Place = @place " +
                                   "WHERE fullName = @fullName ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@date", date);
                    command.Parameters.AddWithValue("@time", time);
                    command.Parameters.AddWithValue("@place", place);
                    command.Parameters.AddWithValue("@fullName", name);
                    command.ExecuteNonQuery();

                    connection.Close();
                }
            }
            catch(Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        private void updateApplicantProcess(DateTime date, TimeSpan time, string place)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE applicantprocessnotification " +
                                   "SET setDate=@date, " +
                                   "setTime=@time, " +
                                   "place=@place, " +
                                   "dateTime=@sentDate," +
                                   "isRead = 'FALSE' " +
                                   "WHERE deliverTo='" + lblName.Text + "' ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@date", date);
                    command.Parameters.AddWithValue("@time", time);
                    command.Parameters.AddWithValue("@place", place);
                    command.Parameters.AddWithValue("@sentDate", DateTime.Now);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
    }
}