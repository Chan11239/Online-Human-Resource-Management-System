using OHRMS.Services;
using System;
using System.Web.UI.WebControls;
using OHRMS.Helpers;

namespace OHRMS.Applicants
{
    public partial class JobListing : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WebHelperControllerService webHelperService = new WebHelperControllerService();
                string query = "SELECT * FROM PostedJobs WHERE isActive = 1 AND CAST(postDuration AS DATE) >= CAST(NOW() AS DATE) ORDER BY title ASC ";
                webHelperService.populateGridViewByQuery(gvPostedJobs, query);
            }
        }

        protected void gvPostedJobs_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvPostedJobs.SelectedRow;
            Label lblId = (Label)row.FindControl("lblId");
            Response.Redirect("~/Applicants/JobInformations.aspx?id=" + lblId.Text, true);
        }
    }
}