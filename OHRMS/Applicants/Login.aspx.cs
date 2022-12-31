using OHRMS.Models;
using OHRMS.Services;
using OHRMS.Helpers;
using System;

namespace OHRMS.Applicants
{
    public partial class Login : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserService userService = new UserService();
            LoginProfile profile = userService.getApplicantProfile(txtEmail.Text);
            if (profile == null)
            {
                this.showMessage("Invalid applicant email credentials.");
                return;
            }

            Session["ohrms.userProps"] = profile;
            Response.Redirect("JobListing.aspx");
        }
    }
}