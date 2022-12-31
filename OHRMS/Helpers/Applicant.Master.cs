using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace OHRMS.Helpers
{
    public partial class Applicant : MasterPage
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        string fullName = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoginProfile loginProfile = new LoginProfile();
                if (Session["ohrms.userProps"] != null)
                {
                    loginProfile = (LoginProfile)Session["ohrms.userProps"];
                    fullName = loginProfile.LastName + ", " + loginProfile.FirstName + " " + loginProfile.MiddleName;
                    lnkLogIn.Visible = false;
                    lnkRegister.Visible = false;
                    lnkLogOut.Visible = true;
                    lnkResume.Visible = true;
                }
                else
                {
                    lnkLogIn.Visible = true;
                    lnkRegister.Visible = true;
                    lnkLogOut.Visible = false;
                    lnkResume.Visible = false;
                }
                numberOfNotification();
                populateNotificationDetails();
            }

        } 

        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            lnkLogIn.Visible = true;
            lnkRegister.Visible = true;
            lnkLogOut.Visible = false;
            Session.Remove("ohrms.userProps");
            Response.Redirect("~/DefaultPage.aspx", false);
        }

        private void numberOfNotification()
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) " +
                               "FROM applicantprocessnotification " +
                               "WHERE isRead = 'FALSE' " +
                               "AND deliverTo = '" + fullName + "'";
                MySqlCommand command = new MySqlCommand(query, connection);
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    lblNotif.Text = reader["COUNT(*)"].ToString();
                }
            }
        }

        private void populateNotificationDetails()
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * " +
                               "FROM applicantprocessnotification " +
                               "WHERE deliverTo = '" + fullName + "'"+
                               "ORDER BY dateTime DESC " +
                               "LIMIT 2";
                MySqlCommand command = new MySqlCommand(query, connection);
                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                command.ExecuteNonQuery();
                rptrNotif.DataSource = ds;
                rptrNotif.DataBind();
                connection.Close();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            numberOfNotification();
            populateNotificationDetails();
        }

        protected void rptrNotif_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE applicantprocessnotification " +
                                   "SET isRead='TRUE' " +
                                   "WHERE id=" + e.CommandArgument.ToString() + "";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                var id = e.CommandArgument;
                Response.Redirect("NotificationMessage.aspx?notifId=" + id);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        protected void lnkView_Click(object sender, EventArgs e)
        {
            Response.Redirect("NotificationList.aspx");
        }
    }
}