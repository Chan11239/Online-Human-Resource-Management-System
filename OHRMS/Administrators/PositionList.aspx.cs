using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OHRMS.Administrators
{
    public partial class PositionList : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populatePosition();
            }
        }

        private void populatePosition()
        {
            string query = "SELECT * " +
                           "FROM position ORDER by positionName ASC";

            WebHelperControllerService webHelperService = new WebHelperControllerService();
            webHelperService.populateGridViewByQuery(gvPosition, query);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                var id = e.CommandArgument;
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "DELETE FROM position " +
                                   "WHERE id = @id ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@id", id);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
                populatePosition();
                this.showMessage("Department Deleted");
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            var id = e.CommandArgument;
            Response.Redirect("~/Administrators/PositionType.aspx?id=" + id);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrators/PositionType.aspx");
        }
    }
}