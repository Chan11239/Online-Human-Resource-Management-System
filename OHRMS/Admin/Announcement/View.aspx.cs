using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace OHRMS.Admin.Announcement
{
    public partial class View : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        private static readonly string pageBaseUrl = "~/Admin/Announcement";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    this.getAnnouncementDetails(id);
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(pageBaseUrl + "/List.aspx");
        }

        private void getAnnouncementDetails(int id)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM Announcements " +
                                   "WHERE id = " + id.ToString() + "";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        while (dataReader.Read())
                        {
                            lblType.Text = dataReader["announcementType"].ToString();
                            lblTitle.Text = dataReader["title"].ToString();
                            lblDescription.Text = dataReader["message"].ToString();
                            lblStartDate.Text = Convert.ToDateTime(dataReader["startDate"]).ToString("dd/MM/yyyy");
                            lblEndDate.Text = Convert.ToDateTime(dataReader["endDate"]).ToString("dd/MM/yyyy");
                            dataReader.NextResult();
                        }
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}