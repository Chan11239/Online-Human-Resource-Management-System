using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;

namespace OHRMS
{
    public partial class Home : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["actions"] != null)
                {
                    if(Request.QueryString["actions"] == "logout")
                    {
                        Session.Remove("ohrms.userProps");
                    }
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserService userService = new UserService();
            LoginProfile profile = userService.getEmployeeProfile(txtUserName.Text, txtPassword.Text);
            if (profile == null)
            {
                this.showMessage("Invalid employee user credentials.");
                return;
            }

            Session["ohrms.userProps"] = profile;
            if (profile.UserType == "EMPLOYEE")
            {
                this.recordUserActivity("Employee logged-in in the system");
                Response.Redirect("~/Employees/Dashboard.aspx");
                
            }
            else if (profile.UserType == "ADMINISTRATOR")
            {
                this.recordUserActivity("Admin logged-in in the system");
                Response.Redirect("~/Administrators/Dashboard.aspx");
                
            }
            else
            {
                this.showMessage("Not yet configure.");
            }

        }
    }
}