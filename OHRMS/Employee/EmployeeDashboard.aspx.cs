using MySql.Data.MySqlClient;
using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace OHRMS.Employee
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        MySqlConnection conn;
        MySqlCommand cmd;
        MySqlDataReader reader;
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ShowAnnounce();
            }
        }
        public void ShowAnnounce()
        {
            try
            {
                StringBuilder htmlTable = new StringBuilder();
                string type = null;

                conn = new MySqlConnection(connstring);
                string query = "Select Announce_Type From Emp_Announcements;";
                cmd = new MySqlCommand(query);
                cmd.Connection = conn;
                conn.Open();
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    type = reader["Announce_Type"].ToString();

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
                                htmlTable.Append("<li style='text-decoration: none; list-style: none; color: black; text-align: left; display: flex;'>" +
                                    "<a href='#' title=" + reader["Announce_Title"] + " style='text-decoration: none; text-overflow: ellipsis;'> <i class='bx bxs-megaphone'></i> " +
                                    " &nbsp &nbsp" + reader["Announce_Descript"] + "</a>" +
                                    "</li>");
                            }
                            placeholder1.Controls.Add(new Literal
                            {
                                Text = htmlTable.ToString()
                            });
                        }

                    }

                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}