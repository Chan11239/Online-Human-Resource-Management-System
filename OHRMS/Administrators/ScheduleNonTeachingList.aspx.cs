using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class ScheduleNonTeachingList : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WebHelperControllerService webHelperService = new WebHelperControllerService();
                string query = "SELECT a.*, b.fullName FROM EmployeeSchedulePlans a LEFT JOIN EmployeeDetails b ON a.employeeNumber = b.employeeNo WHERE a.subjectName IS NULL ";
                webHelperService.populateGridViewByQuery(gvSchedule, query);
            }
        }

        protected void gvSchedule_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvSchedule.SelectedRow;
            Label lblId = (Label)row.FindControl("lblId");
            Response.Redirect("ScheduleNonTeachingForm.aspx?id=" + lblId.Text);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ScheduleNonTeachingForm.aspx");
        }
    }
}