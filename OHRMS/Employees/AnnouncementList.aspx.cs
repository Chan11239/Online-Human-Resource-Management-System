using OHRMS.Helpers;
using OHRMS.Services;
using System;

namespace OHRMS.Employees
{
    public partial class AnnouncementList : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateAnnouncement();
            }
        }

        private void populateAnnouncement()
        {
            string query = "SELECT title, message, DATE_FORMAT(startDate,'%d-%b-%Y') startDate, DATE_FORMAT(endDate,'%d-%b-%Y') endDate " +
                           "FROM Announcements " +
                           "ORDER BY startDate DESC, endDate DESC";

            WebHelperControllerService webHelperService = new WebHelperControllerService();
            webHelperService.populateGridViewByQuery(gvAnnouncement, query);
        }
    }
}