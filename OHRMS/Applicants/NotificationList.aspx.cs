using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Applicants
{
    public partial class NotificationList : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        string fullName = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoginProfile loginProfile = new LoginProfile();
                loginProfile = (LoginProfile)Session["ohrms.userProps"];
                fullName = loginProfile.LastName + ", " + loginProfile.FirstName + " " + loginProfile.MiddleName;
                populateNotification();
            }
        }
        private void populateNotification()
        {
            string query = "SELECT * " +
                           "FROM applicantprocessnotification " +
                           "WHERE deliverTo = '" + fullName + "'" +
                           "ORDER BY dateTime DESC ";
            webHelperService.populateGridViewByQuery(gvNotification, query);
        }
        protected void gvNotification_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var id = e.CommandArgument;
            using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            {
                connection.Open();
                string query = "UPDATE applicantprocessnotification " +
                               "SET isRead='TRUE' " +
                               "WHERE id=" + id.ToString() + "";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
            }
            Response.Redirect("NotificationMessage.aspx?notifId=" + id);
        }
    }
}