using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;
using System.IO;
using System.Web.UI;

namespace OHRMS.Admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            getListEmployee();
        }
        private void getListEmployee()
        {
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT * " +
                    "FROM employeeDetails a " +
                    "INNER JOIN persons b " +
                    "ON a.employeeNo = b.employeeNo";

                MySqlCommand cmd = new MySqlCommand(query, conn);
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet);

                gvListEmployee.DataSource = dataSet;
                gvListEmployee.DataBind();

                conn.Close();
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }
    }
}