using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Data;

namespace OHRMS.Administrators
{
    public partial class COEList : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateCOEList();
            }
        }

        private void populateCOEList()
        {
            using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            {
                connection.Open();
                string query = "SELECT * " +
                               "FROM certificateemploymentrequest";
                MySqlCommand command = new MySqlCommand(query, connection);
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet);

                gvRequestCOE.DataSource = dataSet;
                gvRequestCOE.DataBind();
                connection.Close();
            }
        }

        protected void lnkView_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            var id = e.CommandArgument;
            Response.Redirect("~/Administrators/COEEmployed.aspx?id=" + id);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Resignation application searched");

            populateCOE(txtSearch.Text);
        }

        private void populateCOE(string searchField)
        {

            string query = "SELECT a.id, a.employeeNo, a.employeeName, a.deliverTo, a.message, DATE_FORMAT(a.effectivityDate,'%d-%b-%Y') effectivityDate, a.status " +
                           "FROM certificateemploymentrequest a ";

            if (searchField != string.Empty)
            {
                query += "WHERE a.employeeNo LIKE '%" + searchField + "%' " +
                         "OR a.employeeName LIKE '%" + searchField + "%' " +
                         "OR a.deliverTo LIKE '%" + searchField + "%'  " +
                         "OR DATE_FORMAT(a.effectivityDate,'%d-%b-%Y') LIKE '%" + searchField + "%'  " +
                         "OR a.effectivityDate LIKE '%" + searchField + "%'  " +
                         "OR a.status LIKE '%" + searchField + "%' ";
            }

            query += "ORDER BY a.effectivityDate ASC";
            webHelperService.populateGridViewByQuery(gvRequestCOE, query);
        }
    }
}