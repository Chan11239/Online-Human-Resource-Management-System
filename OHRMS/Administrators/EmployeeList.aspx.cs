using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class EmployeeList : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)             
            {
                populateEmployee(string.Empty);
            }
        }

        protected void gvEmployeeRecords_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            this.recordUserActivity("Employee viewed");
            try
            {
                var employeeNo = e.CommandArgument;
                Response.Redirect("EmployeeInformation.aspx?employeeNo=" + employeeNo);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        public void populateEmployee(string search)
        {
            WebHelperControllerService webHelperService = new WebHelperControllerService();
            string query = "SELECT a.employeeNo, a.fullName, a.department, a.position, b.picture " +
                           "FROM EmployeeDetails a " +
                           "LEFT OUTER JOIN Persons b ON a.employeeNo = b.employeeNo " +
                           "WHERE a.statusOfEmployement IN ('Probationary', 'Regular') ";
           
            if (search != string.Empty)
            {
                query += "AND (a.employeeNo LIKE '%" + search + "%' OR a.fullName LIKE '%" + search + "%' OR a.department LIKE '%" + search + "%' OR a.position LIKE '%" + search + "%') ";
            }

            webHelperService.populateGridViewByQuery(gvEmployeeRecords, query);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Employee search");
            populateEmployee(txtSearch.Text);
        }
    }
}