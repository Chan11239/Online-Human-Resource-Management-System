using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Admin.Announcement
{
    public partial class List : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        private static readonly string pageBaseUrl = "~/Admin/Announcement";

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                this.getAnnouncementList();
            }
        }

        protected void gvAnnouncement_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = gvAnnouncement.SelectedRow;
            Label lblId = (Label)row.FindControl("lblId");
            Response.Redirect(pageBaseUrl + "/View.aspx?id=" + lblId.Text);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(pageBaseUrl + "/Create.aspx");
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }

        private void getAnnouncementList()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM Announcements " +
                                   "ORDER BY endDate DESC";
                    
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
    }
}