using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;

namespace OHRMS.Administrators
{
    public partial class Dashboard : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateAnnotaion();
                populateMemorandum();
                populateTodo();
            }

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
                           "CONCAT(SUBSTR(message, 1, 20), IF(LENGTH(message) > 20, '...', '')) message, DATE_FORMAT(endDate, '%d-%M-%Y') endDate " +
                           "FROM Announcements WHERE CAST(now() AS DATE) BETWEEN startDate AND endDate " +
                           "ORDER BY startDate DESC, endDate DESC " +
                           "LIMIT 4";
            webHelperService.populateGridViewByQuery(gvAnnouncement, query);
        }

        private void populateMemorandum()
        {
            string query = "SELECT a.*, DATE_FORMAT(asOfDate, '%d-%b-%Y') asOfDateFormated " +
                           "FROM Memorandum a " +
                           "ORDER BY a.asOfDate DESC " +
                           "LIMIT 4";
            webHelperService.populateGridViewByQuery(gvMemorandum, query);
        }
    }
}