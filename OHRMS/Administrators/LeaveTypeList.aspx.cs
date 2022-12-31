using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class LeaveTypeList : AbstractWebPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateLeaveType();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Leave classification added");

            Response.Redirect("~/Administrators/LeaveTypeForm.aspx");
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Leave classification print");

            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }

        private void populateLeaveType()
        {
            string query = "SELECT * " +
                           "FROM LeaveTypes ";

            WebHelperControllerService webHelperService = new WebHelperControllerService();
            webHelperService.populateGridViewByQuery(gvLeaveType, query);
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            var id = e.CommandArgument;
            LeaveTypeService leaveTypeService = new LeaveTypeService();
            leaveTypeService.delete(int.Parse(id.ToString()));
            populateLeaveType();

            this.recordUserActivity("Leave classification deleted");
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
            this.recordUserActivity("Leave classification modified");

            var id = e.CommandArgument;
            Response.Redirect("~/Administrators/LeaveTypeForm.aspx?id=" + id);
        }
    }
}