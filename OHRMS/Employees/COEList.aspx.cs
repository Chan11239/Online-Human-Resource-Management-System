using System;
using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Services;
using System.Data;
using System.Web.UI.WebControls;
using OHRMS.Models;

namespace OHRMS.Employees
{
    public partial class COEList : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService(); string department = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateCOEList();
            }
        }

        private void populateDepartment()
        {
            LoginProfile profile = this.getUserProfile();
            string query = "SELECT department FROM employeeDetails WHERE employeeNo = '" + profile.UserName + "' ";
            DataRow drDepartment = webHelperService.getByDataRow(query);
            if (drDepartment != null)
            {
                department = drDepartment["department"].ToString();
            }
        }
        private void populateCOEList()
        {
            populateDepartment();
            using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            {
                connection.Open();
                string query = "SELECT * " +
                               "FROM certificateemploymentrequest " +
                               "WHERE department = '" + department + "' ";
                MySqlCommand command = new MySqlCommand(query, connection);
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet);

                gvRequestCOE.DataSource = dataSet;
                gvRequestCOE.DataBind();
                connection.Close();
            }
        }
        protected void lnkView_Command(object sender, CommandEventArgs e)
        {
            var id = e.CommandArgument;
            Response.Redirect("~/Employees/COEApprove.aspx?id=" + id);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Resignation application searched");

            populateCOE(txtSearch.Text);
        }

        private void populateCOE(string searchField)
        {

            string query = "SELECT a.id, a.employeeNo, a.employeeName, a.deliverTo, a.message, DATE_FORMAT(a.effectivityDate,'%d-%b-%Y') effectivityDate, a.status " +
                           "FROM certificateemploymentrequest a " +
                           "WHERE department = '" + department + "' ";

            if (searchField != string.Empty)
            {
                query += "OR a.employeeNo LIKE '%" + searchField + "%' " +
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