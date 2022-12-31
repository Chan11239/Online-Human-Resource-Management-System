using System;
using MySql.Data.MySqlClient;
using System.Configuration;
using OHRMS.Models;
using OHRMS.Services;
using System.Data;
using System.Web.UI.WebControls;


namespace OHRMS.Administrators
{
    public partial class PostedJobView : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        WebHelperControllerService WebHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    this.getPostedJobDetails(id);
                }
            }
        }
        private void getPostedJobDetails(int id)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM postedjobs " +
                                   "WHERE id = " + id.ToString() + "";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();

                    if (dataReader.HasRows)
                    {
                        while (dataReader.Read())
                        {
                            ddlClassification.SelectedValue = dataReader["classification"].ToString();
                            populateDropDownListDepartments(ddlClassification.SelectedValue);
                            populateDropDownPosition(ddlClassification.SelectedValue);
                            ddlTitle.SelectedValue = dataReader["title"].ToString();
                            ddlDepartment.SelectedValue = dataReader["department"].ToString();
                            ddlType.Text = dataReader["jobType"].ToString();
                            ddlEducQualification.SelectedValue = dataReader["educationalQualification"].ToString();
                            ddlExperience.SelectedValue = dataReader["yearExperience"].ToString();
                            txtDurationDate.Text = Convert.ToDateTime(dataReader["postDuration"]).ToString("yyyy-MM-dd");
                            txtJobDescription.Text = dataReader["generalQualifiacation"].ToString().Replace("<br />", Environment.NewLine);
                            txtjobResponsibilities.Text = dataReader["jobResponsibilities"].ToString().Replace("<br />", Environment.NewLine);
                            //chkActive.Checked = dataReader["isActive"].ToString();
                            dataReader.GetBoolean(dataReader.GetOrdinal("isActive"));
                            dataReader.NextResult();
                        }
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        protected void ddlClassification_SelectedIndexChanged(object sender, EventArgs e)
        {
            populateDropDownListDepartments(ddlClassification.SelectedValue);
            populateDropDownPosition(ddlClassification.SelectedValue);
            if (ddlClassification.SelectedValue == "Non-Teaching")
            {
                ddlType.SelectedValue = "Full Time";
            }
            else
            {
                ddlType.SelectedValue = "-";
            }
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
        private void populateDropDownPosition(string classification)
        {
            string query = "SELECT positionName FROM position WHERE classificationName = '" + classification + "' ";
            DataTable dt = WebHelperService.getByDataTable(query);
            if (dt != null)
            {
                ddlTitle.DataSource = dt;
                ddlTitle.DataValueField = dt.Columns["positionName"].ToString();
                ddlTitle.DataTextField = dt.Columns["positionName"].ToString();
                ddlTitle.DataBind();
                ddlTitle.Items.Insert(0, new ListItem("- Select -", "-"));
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            PostedJobService postedJobService = new PostedJobService();
            int id = int.Parse(Request.QueryString["id"]);

            txtJobDescription.TextMode = TextBoxMode.MultiLine;

            PostedJob postJob = new PostedJob
            {
                title = ddlTitle.SelectedValue,
                classification = ddlClassification.SelectedValue,
                department = ddlDepartment.SelectedValue,
                jobType = ddlType.SelectedValue,
                postDuration = DateTime.Parse(txtDurationDate.Text),
                educationalQualification = ddlEducQualification.SelectedValue,
                yearExperience = ddlExperience.SelectedValue,
                generalQualifiacation = txtJobDescription.Text,
                jobResponsibilities = txtjobResponsibilities.Text
            };
            postedJobService.update(postJob, id);


            string script = "alert('Record updated');";
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(btnUpdate, this.GetType(), "Ok", script, true);

            //recordUserActivity("New Job Posted");
            //this.showMessage("New Job Hiring has been Posted.");
            //TODO: reset fields
            //Response.Redirect(Request.RawUrl);
            //Server.Transfer(Request.Path);
        }

    }
}