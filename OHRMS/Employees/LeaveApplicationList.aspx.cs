using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;

namespace OHRMS.Employees
{
    public partial class LeaveApplicationList : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateLeaveApplication();
            }
        }

        private void populateLeaveApplication()
        {
            LoginProfile loginProfile = this.getUserProfile();
            string query = "SELECT deliverTo, reasons, DATE_FORMAT(startDate,'%d-%M-%Y') startDate, DATE_FORMAT(endDate,'%d-%M-%Y') endDate, status, approver " +
                           "FROM LeaveApplications " +
                           "WHERE employeeNo = '" + loginProfile.UserName + "' ";

            WebHelperControllerService webHelperService = new WebHelperControllerService();
            webHelperService.populateGridViewByQuery(gvLeaveApplication, query);
        }
    }
}