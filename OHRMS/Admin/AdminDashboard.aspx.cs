using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;

namespace OHRMS
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        MySqlConnection conn;
        MySqlCommand cmd;
        MySqlDataReader reader;
        MySqlDataAdapter da;
        DataSet ds = new DataSet();
        private static readonly string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            showMemorandom();
            showAnnouncement();
            showEmployee();
        }

        public void ShowMessage(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        public void showMemorandom()
        {
            try
            {
                StringBuilder htmlTable = new StringBuilder();

                conn = new MySqlConnection(connstring);
                string query1 = "SELECT * " +
                                "FROM Emp_Memos " +
                                "ORDER BY Memo_Date DESC";
                
                cmd = new MySqlCommand(query1);
                cmd.Connection = conn;
                conn.Open();
                
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    htmlTable.Append("<ul>");
                    while (reader.Read())
                    {
                        htmlTable.Append("<li style='text-decoration: none; list-style: none; text-align: left; position: relative; display: flex;'>" +
                            "<a href='#' title=" + reader["Memo_Subject"] + " style='text-decoration: none; text-overflow: ellipsis;'> <i class='bx bxs-megaphone'></i> " +
                            " &nbsp &nbsp" + reader["Memo_To"] + "&nbsp &nbsp &nbsp" + reader["Memo_Date"] + "</a>" +
                            "</li>");
                    }
                   
                    htmlTable.Append("</ul>");
                    placeholder1.Controls.Add(new Literal { Text = htmlTable.ToString() });
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }
        }

        private void showAnnouncement()
        {
            try
            {
                StringBuilder htmlTable = new StringBuilder();

                conn = new MySqlConnection(connstring);
                string query = "SELECT Announce_Type " +
                    "FROM Emp_Announcements;";
                cmd = new MySqlCommand(query);
                cmd.Connection = conn;
                conn.Open();
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string type = reader["Announce_Type"].ToString();

                    if (type.Equals("General Announcement"))
                    {
                        conn = new MySqlConnection(connstring);
                        string query1 = "Select Announce_Title, Announce_Descript From Emp_Announcements where Announce_Type='" + type + "';";
                        cmd = new MySqlCommand(query1);
                        cmd.Connection = conn;
                        conn.Open();
                        reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                htmlTable.Append("<li style='text-decoration: none; list-style: none; text-align: left; left: 25px; position: relative; display: flex;'>" +
                                    "<a href='#' title=" + reader["Announce_Title"] + " style='text-decoration: none; text-overflow: ellipsis;'> <i class='bx bxs-megaphone'></i> " +
                                    " &nbsp &nbsp" + reader["Announce_Descript"] + "</a>" +
                                    "</li>");
                            }
                            placeholder2.Controls.Add(new Literal
                            {
                                Text = htmlTable.ToString()
                            });
                        }
                    }
                }
            }
            catch (Exception e)
            {
                ShowMessage(e.Message);
            }
        }

        private void showEmployee()
        {
            try
            {
                conn = new MySqlConnection(connstring);
                string query = "SELECT a.Emp_ID, b.Emp_Name, a.Emp_Position, a.Emp_Department " +
                               "FROM Emp_Information a " +
                               "JOIN emp_personalinfo b on a.Emp_ID = b.Emp_PerosnalID";

                cmd = new MySqlCommand(query, conn);
                conn.Open();

                da = new MySqlDataAdapter(cmd);
                da.Fill(ds);

                gvDashEmp.DataSource = ds;
                gvDashEmp.DataBind();
                conn.Close();
            }
            catch (Exception e)
            {
                ShowMessage(e.Message);
            }
        }
    }
}