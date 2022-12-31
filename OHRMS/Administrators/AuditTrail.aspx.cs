using OHRMS.Helpers;
using System;
using OHRMS.Services;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS
{
    public partial class AuditTrail : AbstractWebPage
    {
        private WebHelperControllerService webHelpControl = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            populateUserActivity();
        }

        private void populateUserActivity()
        {
            string query = "SELECT * " +
                           "FROM userActivity " +
                           "ORDER BY dateOfActivity DESC";

            webHelpControl.populateGridViewByQuery(gvAuditTrail, query);
        }

        // TODO: search 
    }
}