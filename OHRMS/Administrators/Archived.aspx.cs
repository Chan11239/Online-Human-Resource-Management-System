using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Data;

namespace OHRMS.Administrators
{
    public partial class Archived : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateResignedAndTerminated();
            }
        }
        private void populateResignedAndTerminated()
        {
            try
            {
                string query = "SELECT * " +
                               "FROM employeeDetails " +
                               "WHERE statusOfEmployement = 'Resigned' " +
                               "OR statusOfEmployement = 'Terminated' " +
                               "OR statusOfEmployement = 'Retired' ";
                webHelperService.populateGridViewByQuery(gvArchived, query);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
    }
}