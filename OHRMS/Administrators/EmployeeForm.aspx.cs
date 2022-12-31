using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;

namespace OHRMS.Administrators
{
    public partial class EmployeeForm : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        private UserLogService userLogService = new UserLogService();
        private UserService userService = new UserService();
        private AutoNumberService autoNumberService = new AutoNumberService();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    hidEmployeeNo.Value = Request.QueryString["id"];
                }
                populateHiredApplicant();
            }
        }
        private void populateHiredApplicant()
        {
            try
            {
                string query = "SELECT lastName, firstName " +
                               "FROM applicants " +
                               "WHERE status = 'HIRED' " +
                               "AND id = " + hidEmployeeNo.Value + "";
                DataRow drApplicant = webHelperService.getByDataRow(query);
                if (drApplicant != null)
                {
                    txtLastName.Text = drApplicant["lastName"].ToString();
                    txtFirstName.Text = drApplicant["firstName"].ToString();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text == string.Empty)
            {
                showMessage("Please enter a Employee No");
                return;
            }

            string query = "SELECT employeeNo, lastName, firstName, middleName, fullName, department, position, classification, " +
                           "rankEmployee, salaryRate, dateAppointment, statusOfEmployement, newDateAppointment, newDepartment, newPosition, " +
                           "dateSeparation, natureOfSeparation " +
                           "FROM EmployeeDetails " +
                           "WHERE employeeNo = '" + txtSearch.Text + "' ";

            DataRow dtEmployee = webHelperService.getByDataRow(query);
            if (dtEmployee != null)
            {
                DateTime dateAppointment = DateTime.Parse(dtEmployee["dateAppointment"].ToString());

                txtEmployeeNo.Text = dtEmployee["employeeNo"].ToString();
                ddlDepartment.SelectedValue = dtEmployee["department"].ToString();
                txtPosition.Text = dtEmployee["position"].ToString();
                txtFirstName.Text = dtEmployee["firstName"].ToString();
                txtLastName.Text = dtEmployee["lastName"].ToString();
                txtMiddleName.Text = dtEmployee["middleName"].ToString();
                ddlClassification.SelectedValue = dtEmployee["classification"].ToString();
                ddlRank.SelectedValue = dtEmployee["rankEmployee"].ToString();
                txtSalary.Text = dtEmployee["salaryRate"].ToString();
                txtDateAppoint.Text = dateAppointment.ToString("yyyy-MM-dd");
                ddlStatus.SelectedValue = dtEmployee["statusOfEmployement"].ToString();
                txtNewDateAppoint.Text = dtEmployee["newDateAppointment"].ToString();
                txtNewDepartment.Text = dtEmployee["newDepartment"].ToString();
                txtNewPosition.Text = dtEmployee["newPosition"].ToString();
                txtDateSeparation.Text = dtEmployee["dateSeparation"].ToString();
                txtNatureSeparation.Text = dtEmployee["natureOfSeparation"].ToString();


                txtEmployeeNo.Enabled = false;
                lblPasswordDisplay.Visible = false;
                lblPassword.Visible = false;
                hidEmployeeNo.Value = dtEmployee["employeeNo"].ToString();
            }
            else
            {
                lblPassword.Text = webHelperService.getRandonString(8);
                txtEmployeeNo.Enabled = false;
                lblPasswordDisplay.Visible = true;
                hidEmployeeNo.Value = string.Empty;
                divUpdateEmployee.Visible = false;
            }

            //btnSearch.Visible = false;
            iconSearch.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Leave credits modified");

            LoginProfile loginProfile = getUserProfile();
            string userFullName = loginProfile.LastName + ", " + loginProfile.FirstName;

            if (hidEmployeeNo.Value == string.Empty)
            {
                createEmployeeDetails();
                
                userService.createEmployeeUser(txtEmployeeNo.Text, lblPassword.Text, txtFirstName.Text, txtLastName.Text);
                
                userLogService.create(loginProfile.UserName, userFullName, "Add New Employee " + txtEmployeeNo.Text);
                
                this.showMessage("Added a new employee. Successful.");
            }
            else
            {
                updateEmployeeDetails();
                
                userLogService.create(loginProfile.UserName, userFullName, "Update Employee " + txtEmployeeNo.Text);

                this.showMessage("Updated a employee. Successful.");
            }

            Response.Redirect("/Administrators/EmployeeForm.aspx");
        }

        private void createEmployeeDetails()
        {
            using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            {
                string fullName = txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddleName.Text;
                connection.Open();
                string query = "INSERT INTO EmployeeDetails " +
                               "(employeeNo, lastName, firstName, middleName, fullName, department, position, classification, rankEmployee, salaryRate, dateAppointment, statusOfEmployement) " +
                               "VALUES " +
                               "(@employeeNo, @lastName, @firstName, @middleName, @fullName, @department, @position, @classification, @rankEmployee, @salaryRate, @dateAppointment, @statusOfEmployement) ";
                MySqlCommand command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@employeeNo", txtEmployeeNo.Text);
                command.Parameters.AddWithValue("@lastName", txtLastName.Text);
                command.Parameters.AddWithValue("@firstName", txtFirstName.Text);
                command.Parameters.AddWithValue("@middleName", txtMiddleName.Text);
                command.Parameters.AddWithValue("@fullName", fullName);
                command.Parameters.AddWithValue("@department", ddlDepartment.SelectedValue);
                command.Parameters.AddWithValue("@position", txtPosition.Text);
                command.Parameters.AddWithValue("@classification", ddlClassification.SelectedValue);
                command.Parameters.AddWithValue("@rankEmployee", ddlRank.SelectedValue);
                command.Parameters.AddWithValue("@salaryRate", txtSalary.Text);
                command.Parameters.AddWithValue("@dateAppointment", txtDateAppoint.Text != string.Empty ? txtDateAppoint.Text : null);
                command.Parameters.AddWithValue("@statusOfEmployement", ddlStatus.SelectedValue);

                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        private void updateEmployeeDetails()
        {
            using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            {
                string name = txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddleName.Text;
                connection.Open();
                string query = "UPDATE EmployeeDetails " +
                               "SET statusOfEmployement = @statusOfEmployement " +
                               "WHERE employeeNo = '" + txtEmployeeNo.Text + "' ";
                MySqlCommand command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@statusOfEmployement", ddlStatus.SelectedValue);

                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void iconGenerate_Click(object sender, EventArgs e)
        {
            if (ddlClassification.SelectedValue == "Value1")
            {
                this.showMessage("Please Select Classification first");
            }
            else if (ddlClassification.SelectedValue == "Administrative")
            {
                txtEmployeeNo.Text = autoNumberService.getNewEmployeeNo("A");
            }
            else if (ddlClassification.SelectedValue == "Full Time")
            {
                txtEmployeeNo.Text = autoNumberService.getNewEmployeeNo("F");
            }
            else if (ddlClassification.SelectedValue == "Part Time")
            {
                txtEmployeeNo.Text = autoNumberService.getNewEmployeeNo("P");
            }
            lblPassword.Text = txtLastName.Text + txtEmployeeNo.Text;
        }

    }
}