using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace OHRMS.Employees
{
    public partial class ClearanceForm : AbstractWebPage
    {
        WebHelperControllerService webHelperService = new WebHelperControllerService();
        ResignationApplicationService resignationApplicationService = new ResignationApplicationService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                populateOfficeDocument();
            }
        }
        
        protected void lnkClearance_Command(Object sender, CommandEventArgs e)
        {
            if (hidFilename.Value == string.Empty)
            {
                this.showMessage("No file attached.");
                return;
            }

            //LoginProfile loginProfile = this.getUserProfile();
            //if (resignationApplicationService.checkExists(loginProfile.UserName) == false)
            //{
            //    this.showMessage("Printing is not available. Please tender a resignation application to print.");
            //    return;
            //}

            string url = "../UploadFiles/Others/" + hidFilename.Value;
            string s = "window.open('" + url + "', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }

        private void populateOfficeDocument()
        {
            hidFilename.Value = string.Empty;
            string query = "SELECT fileName " +
                           "FROM OfficeDocuments " +
                           "WHERE active = 1 LIMIT 1";

            DataRow officeDocument = webHelperService.getByDataRow(query);
            if (officeDocument != null)
            {
                hidFilename.Value = officeDocument["fileName"].ToString();
            }
        }
    }
}