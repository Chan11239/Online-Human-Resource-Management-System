using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class ReportsEmployees : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateEmployee(string.Empty);
            }
        }

        public void populateEmployee(string search)
        {
            WebHelperControllerService webHelperService = new WebHelperControllerService();
            string query = "SELECT a.employeeNo, a.fullName, a.department, a.position, a.classification, a.rankEmployee, a.salaryRate " +
                           "FROM EmployeeDetails a " +
                           "LEFT OUTER JOIN Persons b ON a.employeeNo = b.employeeNo " +
                           "WHERE a.statusOfEmployement IN ('Probationary', 'Regular') ";

            if (search != string.Empty)
            {
                query += "AND (a.employeeNo LIKE '%" + search + "%' OR a.fullName LIKE '%" + search + "%' OR a.department LIKE '%" + search + "%' OR a.position LIKE '%" + search + "%' OR a.classification LIKE '%" + search + "%' OR a.rankEmployee LIKE '%" + search + "%' OR a.salaryRate LIKE '%" + search + "%') ";
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