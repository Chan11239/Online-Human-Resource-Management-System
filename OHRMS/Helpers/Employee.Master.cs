using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;
using System.Configuration;
using System.Data;

namespace OHRMS.Helpers
{
    public partial class Employee : System.Web.UI.MasterPage
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoginProfile loginProfile = new LoginProfile();
                if (Session["ohrms.userProps"] != null)
                {
                    loginProfile = (LoginProfile)Session["ohrms.userProps"];
                    lblEmployeeNo.Text = loginProfile.UserName;
                    lblEmployeeName.Text = loginProfile.LastName + ", " + loginProfile.FirstName;
                }
                if (loginProfile.EmployeeClassification == "Non-Teaching")
                {
                    scheduleForm.Visible = false;
                }
                if (loginProfile.Position != "Program Head")
                {
                    approval.Visible = false;
                }
                if (loginProfile.UserType != "EMPLOYEE")
                {
                    this.logout_Click(null, null);
                }
                numberOfNotification();
                populateNotificationDetails();
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("~/default.aspx");
        }

        private void numberOfNotification()
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) " +
                               "FROM notification " +
                               "WHERE isRead = 'FALSE' " +
                               "AND employeeNo = '" + lblEmployeeNo.Text + "' " +
                               "AND userType = 'EMPLOYEE'";
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
                               "FROM notification " +
                               "WHERE userType = 'EMPLOYEE' "  +
                               "AND employeeNo = '" + lblEmployeeNo.Text + "' " +
                               "AND userType = 'EMPLOYEE'" +
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
                    string query = "UPDATE notification " +
                                   "SET isRead='TRUE' " +
                                   "WHERE employeeNo= '" + e.CommandArgument.ToString() + "'";
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