using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class ArchivedUsers : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateUser();
            }
        }

        private void populateUser()
        {
            string query = "SELECT * " +
                           "FROM users " +
                           "WHERE isActive = 0";
            webHelperService.populateGridViewByQuery(gvUsers ,query);
        }
        protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvUsers.SelectedRow;
            Label lblId = (Label)row.FindControl("lblId");

            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE users SET " +
                                   "isActive=1 " +
                                   "WHERE id = @id ";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@id", lblId.Text);

                    command.ExecuteNonQuery();
                    connection.Close();
                    this.showMessage("User Activated");
                    populateUser();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
    }
}