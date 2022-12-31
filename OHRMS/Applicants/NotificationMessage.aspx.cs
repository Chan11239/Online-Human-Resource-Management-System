using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Applicants
{
    public partial class NotificationMessage : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["notifId"] != null)
                {
                    int id = int.Parse(Request.QueryString["notifId"]);
                    this.getNotification(id);
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
                                   "FROM applicantprocessnotification " +
                                   "WHERE id = " + id.ToString() + "";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        while (dataReader.Read())
                        {
                            lblName.Text = dataReader["fullName"].ToString();
                            lblMessage.Text = dataReader["message"].ToString();
                            DateTime date = DateTime.Parse(dataReader["setDate"].ToString());
                            lblDate.Text = date.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                            lblTime.Text = dataReader["setTime"].ToString();
                            lblPlace.Text = dataReader["place"].ToString();
                            DateTime dateSent = DateTime.Parse(dataReader["dateTime"].ToString());
                            lblDateSent.Text = dateSent.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
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

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            this.addToNotification("Applicant Confirm", "", "ADMINISTRATOR", "");
            this.showMessage("Confirm Schedule!");
        }

        protected void btnResched_Click(object sender, EventArgs e)
        {
            this.addToNotification("Applicant Request for Reschedule", "", "ADMINISTRATOR", "");
            this.showMessage("Request Reschedule Sent!");
        }
    }
}