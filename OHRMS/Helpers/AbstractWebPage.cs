using System;
using System.Configuration;
using System.Web.UI;
using OHRMS.Models;
using OHRMS.Services;

namespace OHRMS.Helpers
{

    public class AbstractWebPage : Page
    {
        public string getConnetionStrings = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();


        public void showMessage(string message)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        public LoginProfile getUserProfile()
        {
            if (Session["ohrms.userProps"] != null)
            {
                return (LoginProfile)Session["ohrms.userProps"];
            }

            return new LoginProfile();
        }

        public void recordUserActivity(string activity)
        {
            UserLogService userLog = new UserLogService();
            LoginProfile profile = getUserProfile();
            userLog.create(profile.UserName, profile.LastName + ", " + profile.FirstName, activity, DateTime.Now);

        }

        public void addToNotification(string message, string employeeNo, string userType, string deliverTo)
        {
            NotificationService notificationService = new NotificationService();
            LoginProfile profile = getUserProfile();
            notificationService.save(message, employeeNo, profile.LastName + ", " + profile.FirstName + " " + profile.MiddleName, userType, deliverTo, DateTime.Now);

        }
    }
}