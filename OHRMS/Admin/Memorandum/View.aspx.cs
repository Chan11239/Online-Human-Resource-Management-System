using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace OHRMS.Admin.Memorandum
{
    public partial class View : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        private static readonly string pageBaseUrl = "~/Admin/Memorandum";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    this.getMemorandaDetails(id);
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(pageBaseUrl + "/List.aspx");
        }

        private void getMemorandaDetails(int id)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM Memorandum " +
                                   "WHERE id = " + id.ToString() + "";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        while (dataReader.Read())
                        {
                            lblMemoNo.Text = dataReader["memoNumber"].ToString();
                            lblTo.Text = dataReader["deliverTo"].ToString();
                            lblCc.Text = dataReader["ccTo"].ToString();
                            lblFrom.Text = dataReader["issuedFrom"].ToString();
                            lblAsOfDate.Text = Convert.ToDateTime(dataReader["asOfDate"]).ToString("dd/MM/yyyy");
                            lblSubject.Text = dataReader["subject"].ToString();
                            lblMessage.Text = dataReader["message"].ToString();
                            lnkAttachment.Text = dataReader["attachedFileName"].ToString();
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