using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;

namespace OHRMS.Employees
{
    public partial class LeaveForm : AbstractWebPage
    {
        WebHelperControllerService WebHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                populateLeaveTypeList();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlLeaveType.SelectedValue == "-")
            {
                showMessage("Please select a type.");
                return;
            }

            if (txtReason.Text.Trim() == string.Empty)
            {
                showMessage("Please enter a reason for leave.");
                return;
            }

            if (txtStartDate.Text.Trim() == string.Empty)
            {
                showMessage("Please enter a leave start date.");
                return;
            }

            if (txtEndDate.Text.Trim() == string.Empty)
            {
                showMessage("Please enter a leave end date.");
                return;
            }

            LoginProfile profile = this.getUserProfile();
            string fullName = profile.LastName + ", " + profile.FirstName;
            
            using (MySqlConnection connection = new MySqlConnection(this.getConnetionStrings))
            {
                connection.Open();
                string query = "INSERT INTO LeaveApplications " +
                               "(employeeNo, employeeName, reasons, department, startDate, endDate, status, typeOfLeave) " +
                               "VALUES " +
                               "(@employeeNo, @employeeName, @reasons, @department, @startDate, @endDate, @status, @typeOfLeave)";

                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@employeeNo", profile.UserName);
                command.Parameters.AddWithValue("@employeeName", fullName);
                command.Parameters.AddWithValue("@reasons", txtReason.Text);
                command.Parameters.AddWithValue("@department", profile.Department);
                command.Parameters.AddWithValue("@startDate", txtStartDate.Text);
                command.Parameters.AddWithValue("@endDate", txtEndDate.Text);
                command.Parameters.AddWithValue("@typeOfLeave", ddlLeaveType.SelectedValue.ToString());
                command.Parameters.AddWithValue("@status", "PENDING");
                command.ExecuteNonQuery();

                connection.Close();
            }

            showMessage("Leave Application Send!");
            resetFields();

            this.recordUserActivity("Leave Application Sent");
            this.addToNotification("Leave Applied By: " + fullName, "", "ADMINISTRATOR", "");
        }

        private void resetFields()
        {
            txtReason.Text = string.Empty;
            txtStartDate.Text = string.Empty;
            txtEndDate.Text = string.Empty;
        }

        private void populateLeaveTypeList()
        {
            string query = "SELECT leaveTypeCode, leaveTypeName FROM LeaveTypes";
            DataTable dt = WebHelperService.getByDataTable(query);

            ddlLeaveType.DataSource = dt;
            ddlLeaveType.DataValueField = dt.Columns["leaveTypeCode"].ToString();
            ddlLeaveType.DataTextField = dt.Columns["leaveTypeName"].ToString();
            ddlLeaveType.DataBind();
        }
    }
}