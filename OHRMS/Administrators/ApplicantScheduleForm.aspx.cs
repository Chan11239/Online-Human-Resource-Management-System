using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OHRMS.Helpers;

namespace OHRMS.Administrators
{
    public partial class ApplicantScheduleForm : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                lblId.Text = id.ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            showMessage("Hello");
        }
    }
}