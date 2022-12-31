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
    public partial class JobPostList : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getPostedJobs(string.Empty);
            }
        }
        protected void gvPostedJobs_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvPostedJobs.SelectedRow;
            Label lblId = (Label)row.FindControl("lblId");
            Response.Redirect("/Administrators/PostedJobView.aspx?id=" + lblId.Text);
        }

        private void getPostedJobs(string search)
        {
            try
            {
                WebHelperControllerService webHelperService = new WebHelperControllerService();
                string query = "SELECT * " +
                               "FROM postedjobs a ";

                if (search != string.Empty)
                {
                    query += "WHERE (a.title LIKE '%" + search + "%' OR a.classification LIKE '%" + search + "%' OR a.department LIKE '%" + search + "%' OR a.jobType LIKE '%" + search + "%' OR a.educationalQualification LIKE '%" + search + "%' OR a.jobResponsibilities LIKE '%" + search + "%' OR a.jobType LIKE '%" + search + "%' OR a.generalQualifiacation LIKE '%" + search + "%') ";
                }

                webHelperService.populateGridViewByQuery(gvPostedJobs, query);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getPostedJobs(txtSearch.Text);
        }
    }
}