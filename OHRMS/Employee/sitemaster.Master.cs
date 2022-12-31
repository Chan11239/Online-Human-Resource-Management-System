using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS
{
    public partial class sitemaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Emp_name"] != null && Session["Emp_ID"] != null)
            {
                //lblName.Text = Session["Emp_name"].ToString();
                //lblEmp_ID.Text = Session["Emp_ID"].ToString();
                lblEmp_Num.Text = Session["Emp_ID"].ToString();
                lblName_Emp.Text = Session["Emp_name"].ToString();
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("~/DefaultPage.aspx");
        }

        public string employee_Name
        {
            get{
                return lblName_Emp.Text;
            }
            set
            {
                lblName_Emp.Text = Session["Emp_name"].ToString();
            }
        }
       
    }
}