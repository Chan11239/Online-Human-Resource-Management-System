using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;

namespace OHRMS.Employees
{
    public partial class Dashboard : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ohrms.userProps"] != null)
                {
                    LoginProfile loginProfile = (LoginProfile)Session["ohrms.userProps"];
                    lblEmployeeName.Text = loginProfile.LastName + ", " + loginProfile.FirstName;

                    populateAnnotaion();
                    populateSchedule();
                    populateTodo();
                }
            }

        }

        private void populateSchedule()
        {
            LoginProfile loginProfile = this.getUserProfile();

            string query = "SELECT subjectName, TIME_FORMAT(periodFrom,'%H:%i') periodFrom, TIME_FORMAT(periodTo,'%H:%i') periodTo " +
                           "FROM EmployeeSchedulePlans  " +
                           "WHERE employeeNumber  = '" + loginProfile.UserName + "' " +
                           "AND dayOfWeekNo = " + ((int)DateTime.Now.DayOfWeek) + " " +
                           "AND isActive = 1 " +
                           "AND schoolYear = " + DateTime.Now.Year + " " +
                           "AND semisterStartDate <= '" + DateTime.Now.ToString("yyyy-MM-dd") + "' " +
                           "ORDER BY periodFrom ";
            webHelperService.populateGridViewByQuery(gvSchedule, query);
        }

        private void populateTodo()
        {
            LoginProfile loginProfile = this.getUserProfile();

            string query = "SELECT title, CONCAT(SUBSTR(message, 1, 40), IF(LENGTH(message) > 40, '...', '')) message " +
                           "FROM EmployeeNotes  " +
                           "WHERE EmployeeNumber  = '" + loginProfile.UserName + "' " +
                           "AND isActive = 1 " +
                           "LIMIT 4";
            webHelperService.populateGridViewByQuery(gvToDo, query);
        }

        private void populateAnnotaion()
        {
            string query = "SELECT id, CONCAT(SUBSTR(title, 1, 20), IF(LENGTH(title) > 20, '...', '')) title, " +
                           "CONCAT(SUBSTR(message, 1, 20), IF(LENGTH(message) > 20, '...', '')) message, DATE_FORMAT(endDate, '%d-%b-%Y') endDate " +
                           "FROM Announcements WHERE CAST(now() AS DATE) LIKE startDate AND endDate " +
                           "ORDER BY startDate DESC, endDate " +
                           "DESC LIMIT 4";
            webHelperService.populateGridViewByQuery(gvAnnouncement, query);
        }
    }
}