using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using System;
using System.Web.UI;

namespace OHRMS.Employees
{
    public partial class NotificationMessage : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["notifId"] != null)
                {
                    string id = Request.QueryString["notifId"].ToString();
                    this.getNotification(id);
                }
            }
        }
        private void getNotification(string id)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM notification " +
                                   "WHERE employeeNo = '" + id.ToString() + "'";

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
    }
}