using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS
{
    public partial class WebForm9 : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateEmployee();
            }
        }

        public void populateEmployee()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * FROM " +
                                   "details a ";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);

                    grdview_Employee.DataSource = dataSet;
                    grdview_Employee.DataBind();
                    connection.Close();

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }  
        

        protected void grdview_Employee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                var id = e.CommandArgument;
                Response.Redirect("/Admin/Information.aspx?ID="+id);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}