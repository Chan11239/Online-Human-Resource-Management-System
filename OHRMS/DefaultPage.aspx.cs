using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using System;

namespace OHRMS
{
    public partial class DefaultPage : AbstractWebPage
    {
        MySqlConnection conn;
        MySqlCommand cmd;
        MySqlDataReader reader;
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();

        string emp_id = null;
        string name = null;
        string level = null;

        public void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPassword.Text == "" && txtUsername.Text =="")
                {
                    Messagebox("Please Enter Your Employee ID or Password!");
                    txtUsername.Focus();
                }
                conn = new MySqlConnection(connstring);
                
                string query = "Select Emp_ID, Emp_Password from Emp_Accounts where Emp_ID = '" +txtUsername.Text+ "' And Emp_Password = '" + txtPassword.Text + "'";

                cmd = new MySqlCommand(query);
                cmd.Connection = conn;
                conn.Open();
                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    conn.Close();
                    Messagebox("Successfully Logged In");

                    string query2 = "Select Emp_ID, Emp_Name, Emp_Level from Emp_Accounts where Emp_ID = '" + txtUsername.Text + "' And Emp_Password = '" + txtPassword.Text + "'";

                    cmd = new MySqlCommand(query2);
                    cmd.Connection = conn;
                    conn.Open();
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        emp_id = reader["Emp_ID"].ToString();
                        name = reader["Emp_Name"].ToString();
                        level = reader["Emp_Level"].ToString();
                    }
                    if (level.Equals("Admin"))
                    {
                        Session["Emp_name"] = name.Trim();
                        Session["Emp_ID"] = emp_id.Trim();
                        Response.Redirect("~/Admin/Dashboard.aspx");
                    }
                    if (level.Equals("Employee"))
                    {
                        Session["Emp_name"] = name.Trim();
                        Session["Emp_ID"] = emp_id.Trim();
                        Response.Redirect("~/Employee/EmployeeDashboard.aspx");
                    }

                }

            } catch (Exception ex)
            {
                Messagebox(ex.Message);
            }
        }
    }
}