using OHRMS.Helpers;
using OHRMS.Services;
using System;

namespace OHRMS.Administrators
{
    public partial class TimeSheetDetail : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["batchId"] != null)
                {
                    string batchId = Request.QueryString["batchId"].ToString();
                    populateTimeSheet(batchId);
                } else
                {
                    populateTimeSheet(string.Empty);
                }
            }
        }

        private void populateTimeSheet(string batchId)
        {
            string query = "SELECT * " +
                           "FROM TimeKeepingRecords " +
                           "WHERE batchId = '" + batchId + "' " +
                           "ORDER BY recordDateTime ASC";
            webHelperService.populateGridViewByQuery(gvTimeSheet, query);
        }
    }
}