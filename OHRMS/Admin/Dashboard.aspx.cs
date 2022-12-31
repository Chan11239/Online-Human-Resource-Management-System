using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

namespace OHRMS.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            getMemorandumtList();
            getAnnouncementList();
        }

        protected void gvAnnouncement_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvAnnouncement.SelectedRow;
            Label lblId = (Label)row.FindControl("lblId");
            Response.Redirect("~/Admin/Announcement/View.aspx?id=" + lblId.Text);
        }

        protected void gvMemorandum_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvMemorandum.SelectedRow;
            Label lblId = (Label)row.FindControl("lblId");
            Response.Redirect("~/Admin/Memorandum/View.aspx?id=" + lblId.Text);
        }

        private void getAnnouncementList()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT id, " +
                                   "CONCAT(SUBSTR(title, 1, 17), IF(LENGTH(title) > 20, '...', '')) title, " +
                                   "CONCAT(SUBSTR(message, 1, 17), IF(LENGTH(message) > 20, '...', '')) message, " +
                                   "endDate " +
                                   "FROM Announcements  " +
                                   "WHERE CAST(now() AS DATE) BETWEEN startDate AND endDate  " +
                                   "ORDER BY startDate DESC, endDate " +
                                   "DESC  LIMIT 5";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);

                    gvAnnouncement.DataSource = dataSet;
                    gvAnnouncement.DataBind();

                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private void getMemorandumtList()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT id, " +
                                   "memoNumber, " +
                                   "CONCAT(SUBSTR(message, 1, 17), IF(LENGTH(message) > 20, '...', '')) message, " +
                                   "asOfDate " +
                                   "FROM Memorandum " +
                                   "ORDER BY asOfDate DESC " +
                                   "LIMIT 5";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);

                    gvMemorandum.DataSource = dataSet;
                    gvMemorandum.DataBind();

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