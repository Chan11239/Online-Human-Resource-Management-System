using OHRMS.Helpers;
using OHRMS.Services;
using System;

namespace OHRMS
{
    public partial class FAQ : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                WebHelperControllerService webHelperService = new WebHelperControllerService();
                webHelperService.populateGridViewByQuery(gvEmployee, "SELECT * FROM FAQMaintenance WHERE groupFaq = 'Employee Help' ");
                webHelperService.populateGridViewByQuery(gvApplicant, "SELECT * FROM FAQMaintenance WHERE groupFaq = 'Applicant Help' ");
            }
            
        }
    }
}