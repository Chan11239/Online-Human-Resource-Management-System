using OHRMS.Services;
using System;
using System.Web.UI.WebControls;

namespace OHRMS.Admin.Memorandum
{
    public partial class List : System.Web.UI.Page
    {
        private static readonly string PAGE_BASE_URI = "~/Admin/Memorandum/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WebHelperControllerService webHelperService = new WebHelperControllerService();
                webHelperService.populateGridViewByTableName(gvMemorandum, "Memorandum");
            }
        }

        protected void gvMemorandum_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = gvMemorandum.SelectedRow;
            Label lblId = (Label)row.FindControl("lblId");
            Response.Redirect(PAGE_BASE_URI + "View.aspx?id=" + lblId.Text);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_BASE_URI + "Create.aspx");
        }
    }
}