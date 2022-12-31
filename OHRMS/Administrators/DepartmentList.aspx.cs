using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class DepartmentList : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)

                this.recordUserActivity("Department modified");
            {
                populateDepartments();
            }
        }

        private void populateDepartments()
        {
            string query = "SELECT * " +
                           "FROM departments ORDER by lastModifiedDate DESC";

            WebHelperControllerService webHelperService = new WebHelperControllerService();
            webHelperService.populateGridViewByQuery(gvDepartment, query);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {           
            Response.Redirect("~/Administrators/DepartmentType.aspx");

            this.recordUserActivity("New Department added");
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                var id = e.CommandArgument;
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "DELETE FROM departments " +
                                   "WHERE id = @id ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@id", id);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
                populateDepartments();
                this.showMessage("Department Deleted");

                this.recordUserActivity("Department deleted");
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            var id = e.CommandArgument;
            Response.Redirect("~/Administrators/DepartmentType.aspx?id=" + id);
        }
    }
}