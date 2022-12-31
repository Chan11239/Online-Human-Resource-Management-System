using OHRMS.Helpers;
using OHRMS.Services;
using System;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class ArchivedJobPostings : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populatePostedJobs();
            }
        }

        private void populatePostedJobs()
        {
            WebHelperControllerService webHelperService = new WebHelperControllerService();
            string query = "SELECT * FROM PostedJobs WHERE isActive = 1 AND CAST(postDuration AS DATE) < CAST(NOW() AS DATE) ORDER BY title ASC ";
            webHelperService.populateGridViewByQuery(gvPostedJobs, query);
        }

        protected void gvPostedJobs_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvPostedJobs.SelectedRow;
            Label lblId = (Label)row.FindControl("lblId");
            Response.Redirect("/Administrators/PostedJobView.aspx?id=" + lblId.Text);
        }
    }
}