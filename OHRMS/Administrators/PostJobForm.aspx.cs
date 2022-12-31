using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class PostJobForm : AbstractWebPage
    {
        WebHelperControllerService WebHelperService = new WebHelperControllerService();
        PostedJobService postedJobService = new PostedJobService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            txtJobDescription.TextMode = TextBoxMode.MultiLine;

            PostedJob postJob = new PostedJob()
            {
                title = ddlPosition.SelectedValue,
                classification = ddlClassification.SelectedValue,
                department = ddlDepartment.SelectedValue,
                jobType = ddlType.SelectedValue,
                postDuration = DateTime.Parse(txtDurationDate.Text),
                educationalQualification = ddlQualification.SelectedValue,
                yearExperience = ddlExperience.SelectedValue,
                generalQualifiacation = txtJobDescription.Text.Replace(Environment.NewLine, "<br />"),
                jobResponsibilities = txtjobResponsibilities.Text.Replace(Environment.NewLine, "<br />")
            };
            postedJobService.save(postJob);

            recordUserActivity("New Job Posted");

            string message = "New job openning has been Posted.";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Administrators/JobPostList.aspx'};</script>");
            //this.showMessage("New job openning has been Posted.");


            //TODO: reset fields
            //Response.Redirect(Request.RawUrl);
            //Server.Transfer(Request.Path);
        }

        private void populateDropDownListDepartments(string classification)
        {
            string query = "SELECT departmentName FROM departments WHERE classificationName = '" + classification + "' ";
            DataTable dt = WebHelperService.getByDataTable(query);

            ddlDepartment.DataSource = dt;
            ddlDepartment.DataValueField = dt.Columns["departmentName"].ToString();
            ddlDepartment.DataTextField = dt.Columns["departmentName"].ToString();
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, new ListItem("- Select -", "-"));
        }

        private void populateDropDownPosition(string department)
        {
            string query = "SELECT positionName FROM position WHERE departmentName = '" + department + "' ";
            DataTable dt = WebHelperService.getByDataTable(query);
            if (dt != null)
            {
                ddlPosition.DataSource = dt;
                ddlPosition.DataValueField = dt.Columns["positionName"].ToString();
                ddlPosition.DataTextField = dt.Columns["positionName"].ToString();
                ddlPosition.DataBind();
                ddlPosition.Items.Insert(0, new ListItem("- Select -", "-"));
            }
        }

        protected void ddlClassification_SelectedIndexChanged(object sender, EventArgs e)
        {
            populateDropDownListDepartments(ddlClassification.SelectedValue);
            
            if (ddlClassification.SelectedValue == "Non-Teaching")
            {
                ddlType.SelectedValue = "Full Time";
            } 
            else
            {
                ddlType.SelectedValue = "-";
            }
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            populateDropDownPosition(ddlDepartment.SelectedValue);
        }
    }
}