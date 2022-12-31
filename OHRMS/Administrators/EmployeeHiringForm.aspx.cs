using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class EmployeeHiringForm : AbstractWebPage
    {
        AutoNumberService autoNumberService = new AutoNumberService();
        WebHelperControllerService WebHelperService = new WebHelperControllerService();
        EmployeeDetailService employeeDetailService = new EmployeeDetailService();
        UserService userService = new UserService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["applicantId"] != null)
                {
                    hidApplicantId.Value = Request.QueryString["applicantId"];
                    populateByApplicant(int.Parse(hidApplicantId.Value));
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("New employee added");

            LoginProfile loginProfile = getUserProfile();
            string userFullName = loginProfile.LastName + ", " + loginProfile.FirstName;

            if (employeeDetailService.isExists(lblEmployeeNo.Text) == false)
            {
                EmployeeDetail employeeDetail = new EmployeeDetail()
                {
                    employeeNo = lblEmployeeNo.Text,
                    lastName = txtLastName.Text,
                    firstName = txtFirstName.Text,
                    middleName = txtMiddleName.Text,
                    fullName = (txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddleName.Text).Trim(),
                    department = ddlDepartment.SelectedValue,
                    position = ddlPosition.SelectedValue,
                    classification = ddlClassification.SelectedValue,
                    rankEmployee = txtRank.Text,
                    salaryRate = double.Parse(txtSalary.Text),
                    dateAppointment = DateTime.Parse(txtDateAppoint.Text),
                    statusOfEmployement = ddlStatus.SelectedValue,
                    employmentType = ddlType.SelectedValue,
                    point = Convert.ToInt32(txtPoint.Text)
                    
                };

                bool isSave = employeeDetailService.save(employeeDetail);
                if (isSave)
                {
                    autoNumberService.updateNewEmployeeNo(lblEmployeeNo.Text);
                    userService.createEmployeeUser(lblEmployeeNo.Text, lblPassword.Text, txtFirstName.Text, txtLastName.Text);
                    showMessage("Added a new employee. Successful.");
                    updateInformation();
                    updateWork();
                    updateEduc();
                    updateUser();
                    Response.Redirect("~/Administrators/EmployeeList.aspx");
                }
            }
        }

        private void updateUser()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE users SET " +
                                   "isActive=0 " +
                                   "WHERE firstName = @fisrtName " +
                                   "AND lastName = @lastName " +
                                   "AND userType = 'APPLICANT' ";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@fisrtName", txtFirstName.Text);
                    command.Parameters.AddWithValue("@lastName", txtLastName.Text);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        private void updateInformation()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE persons SET " +
                                   "employeeNo=@employeeNo " +
                                   "WHERE fullName=@fullName" ;
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@fullName", txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddleName.Text);
                    command.Parameters.AddWithValue("@employeeNo", lblEmployeeNo.Text);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        private void updateWork()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE workExperience SET " +
                                   "employeeId=@employeeNo " +
                                   "WHERE fullName=@fullName";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@fullName", txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddleName.Text);
                    command.Parameters.AddWithValue("@employeeNo", lblEmployeeNo.Text);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        private void updateEduc()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE workExperience SET " +
                                   "employeeId=@employeeNo " +
                                   "WHERE fullName=@fullName";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@fullName", txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddleName.Text);
                    command.Parameters.AddWithValue("@employeeNo", lblEmployeeNo.Text);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        protected void ddlClassification_SelectedIndexChanged(object sender, EventArgs e)
        {
            populateDropDownListDepartments(ddlClassification.SelectedValue);
        }

        private void populateByApplicant(int id)
        {
            int jobId = 0;

            ApplicantService applicantService = new ApplicantService();
            Models.Applicant applicant = applicantService.find(id);
            if (applicant != null)
            {
                txtFirstName.Text = applicant.firstName;
                txtLastName.Text = applicant.lastName;
                txtMiddleName.Text = applicant.middleName;
                ddlPosition.SelectedValue = applicant.appliedPosition;
                txtDateAppoint.Text = applicant.hiredDate.ToString("yyyy-MM-dd");
                jobId = applicant.postedJobReferenceId;
                ddlStatus.SelectedValue = "Probationary";
            }

            PostedJobService postedJobService = new PostedJobService();
            PostedJob postedJob = postedJobService.find(jobId);
            if (postedJob != null)
            {
                ddlClassification.SelectedValue = postedJob.classification;
                ddlClassification_SelectedIndexChanged(null, null);
                ddlDepartment.SelectedValue = postedJob.department;
                ddlDepartment_SelectedIndexChanged(null, null);
                ddlType.SelectedValue = postedJob.jobType;
                if (ddlClassification.SelectedValue == "Non-Teaching")
                {
                    txtRank.Text = "N/A";
                    txtRank.Enabled = false;
                    btnPoints.Enabled = false;
                }
            }

            if (ddlType.SelectedValue != "-")
            {
                lblEmployeeNo.Text = autoNumberService.getNewEmployeeNo(ddlType.SelectedValue.Substring(0, 1));
                lblPassword.Text = autoNumberService.generatePassword(true, 8);
                
            }
        }

        private void populateDropDownListDepartments(string classification)
        {
            string query = "SELECT departmentName FROM departments WHERE classificationName = '" + classification + "' ";
            DataTable dt = WebHelperService.getByDataTable(query);
            if (dt != null)
            {
                ddlDepartment.DataSource = dt;
                ddlDepartment.DataValueField = dt.Columns["departmentName"].ToString();
                ddlDepartment.DataTextField = dt.Columns["departmentName"].ToString();
                ddlDepartment.DataBind();
                ddlDepartment.Items.Insert(0, new ListItem("- Select -", "-"));
            }
            else
            {
                ddlDepartment.Items.Insert(0, new ListItem("- Select -", "-"));
            }
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
            else
            {
                ddlPosition.Items.Insert(0, new ListItem("- Select -", "-"));
            }
        }

        protected void btnSubmitAppointment_Click(object sender, EventArgs e)
        {
            getRank(int.Parse(txtPoint.Text));
        }

        private void getRank(int point)
        {
            string query = "SELECT rankName, salaryRate FROM rankMaintenance WHERE '" + point + "' " +
                           "BETWEEN startPoints AND endPoint " +
                           "AND type = '" + ddlType.SelectedValue + "' ";
            DataRow drRank = WebHelperService.getByDataRow(query);
            if (drRank != null)
            {

                txtSalary.Text = Convert.ToDouble(drRank["salaryRate"]).ToString();
                txtRank.Text = drRank["rankName"].ToString();
            }
        }
        protected void btnPoints_Click(object sender, EventArgs e)
        {
            mpePoint.Show();
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            populateDropDownPosition(ddlDepartment.SelectedValue);
        }
    }
}