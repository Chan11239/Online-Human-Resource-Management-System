using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Employees
{
    public partial class NotificationList : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateNotification();
            }
        }
        private void populateNotification()
        {
            LoginProfile profile = this.getUserProfile();
            string query = "SELECT * " +
                           "FROM notification " +
                           "WHERE userType = 'EMPLOYEE' " +
                           "AND employeeNo = '" + profile.UserName + "'" +
                           "ORDER BY dateTime DESC";
            webHelperService.populateGridViewByQuery(gvNotification, query);
        }
        protected void gvNotification_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var id = e.CommandArgument;
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE notification " +
                                   "SET isRead='TRUE' " +
                                   "WHERE id=" + e.CommandArgument.ToString() + "";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                Response.Redirect("NotificationMessage.aspx?notifId=" + id);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
    }
}