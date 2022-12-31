using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class NotifiacationList : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!Page.IsPostBack)
            {
                populateNotification();
            }
        }

        private void populateNotification()
        {
            string query = "SELECT * " +
                           "FROM notification " +
                           "WHERE userType = 'ADMINISTRATOR' " +
                           "ORDER BY dateTime DESC";
            webHelperService.populateGridViewByQuery(gvNotification, query);

            //DataRow drNotification = webHelperService.getByDataRow(query);
            //string isRead = string.Empty;
            //if (drNotification != null)
            //{
            //    isRead = drNotification["isRead"].ToString();
            //}

            //if (isRead == "FALSE")
            //{

            //}
        }

        protected void gvNotification_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var id = e.CommandArgument;
            using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            {
                connection.Open();
                string query = "UPDATE notification " +
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