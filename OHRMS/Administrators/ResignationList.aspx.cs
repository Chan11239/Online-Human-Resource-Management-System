using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class ResignationList : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateResignationApplication(string.Empty);

                this.recordUserActivity("Resignation record viewed");
            }
        }
        
        private void populateResignationApplication(string searchField)
        {

            string query = "SELECT a.id, a.employeeNo, a.employeeName, a.deliverTo, a.message, DATE_FORMAT(a.effectivityDate,'%d-%b-%Y') effectivityDate, a.status " +
                           "FROM ResignationApplications a ";
                           
            if (searchField != string.Empty)
            {
                query += "WHERE a.employeeNo LIKE '%" + searchField + "%' " +
                         "OR a.employeeName LIKE '%" + searchField + "%' " +
                         "OR a.deliverTo LIKE '%" + searchField + "%'  " +
                         "OR DATE_FORMAT(a.effectivityDate,'%d-%b-%Y') LIKE '%" + searchField + "%'  " +
                         "OR a.effectivityDate LIKE '%" + searchField + "%'  " +
                         "OR a.status LIKE '%" + searchField + "%' ";
            }

            query += "ORDER BY a.effectivityDate ASC";
            webHelperService.populateGridViewByQuery(gvResignationApplication, query);
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Resignation application searched");

            populateResignationApplication(txtSearch.Text);
        }

        protected void lnkView_Command(object sender, CommandEventArgs e)
        {
            var id = e.CommandArgument;
            Response.Redirect("~/Administrators/ResignationProcessingForm.aspx?id=" + id);
        }
    }
}