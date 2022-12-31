using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;

namespace OHRMS.Employees
{
    public partial class MemorandumList : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateMemorandum();
            }
        }

        private void populateMemorandum()
        {
            LoginProfile profile = this.getUserProfile();
            string fullName = profile.LastName +", "+ profile.FirstName;
            string query = "SELECT memoNumber, issuedFrom, DATE_FORMAT(asOfDate,'%d-%M-%Y') asOfDate, subject, message, attachedFileName " +
                           "FROM Memorandum " +
                           "WHERE deliverTo = '" + fullName + "' OR deliverTo LIKE '%All%' " +
                           "ORDER BY asOfDate DESC ";

            WebHelperControllerService webHelperService = new WebHelperControllerService();
            webHelperService.populateGridViewByQuery(gvMemorandum, query);
        }
    }
}