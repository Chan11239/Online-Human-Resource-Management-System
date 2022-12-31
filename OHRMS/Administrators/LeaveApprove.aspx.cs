using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace OHRMS
{
    public partial class LeaveApprove : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        private LeaveApplicationService leaveApplicationService = new LeaveApplicationService();
        private EmployeeLeaveCreditService employeeLeaveCreditService = new EmployeeLeaveCreditService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateLeave(string.Empty);
            }
            
        }
        
        private void populateLeave(string searchValue)
        {
            string query = "SELECT a.id, a.employeeNo, a.employeeName, a.reasons, a.startDate, a.endDate, a.status, b.leaveTypeCode, b.leaveTypeName " +
                           "FROM LeaveApplications a " +
                           "JOIN LeaveTypes b ON a.typeOfLeave = b.leaveTypeCode ";

            if (searchValue != string.Empty)
            {
                query += "WHERE a.employeeNo LIKE '%" + searchValue + "%' " +
                         "OR a.employeeName LIKE '%" + searchValue + "%' " +
                         "OR a.reasons LIKE '%" + searchValue + "%' " +
                         "OR b.leaveTypeName LIKE '%" + searchValue + "%' " +
                         "OR a.status LIKE '%" + searchValue + "%' ";
            }

            query += "ORDER BY (CASE status WHEN 'PENDING' THEN 0 ELSE 1 END) ASC, a.startDate DESC ";

            webHelperService.populateGridViewByQuery(gvEmployeeLeaveApplication, query);
        }
        
        protected void lnkApprove_Command(object sender, CommandEventArgs e)
        {
            LoginProfile profile = this.getUserProfile();
            string userName = profile.LastName + ", " + profile.FirstName;

            var id = e.CommandArgument;
            if (validateAndUpdate(int.Parse(id.ToString())) == false)
            {
                return;
            }

            changeEmployeeLeaveApplication(int.Parse(id.ToString()), "APPROVED", userName);
            populateLeave(txtSearch.Text);

            string query = "SELECT employeeNo, employeeName " +
                          "FROM LeaveApplciations " +
                          "WHERE employeeNo = '" + id.ToString() + "' ";
            DataRow drLeaveApplciation = webHelperService.getByDataRow(query);

            this.recordUserActivity("Leave Approved");

            if (drLeaveApplciation != null)
            {
                string employeeNo = drLeaveApplciation["employeeNo"].ToString();
                string employeeName = drLeaveApplciation["employeeName"].ToString();

                this.addToNotification("Leave Approve", employeeNo, "EMPLOYEE", employeeName);
            }
        }

        protected void lnkReject_Command(object sender, CommandEventArgs e)
        {
            LoginProfile profile = this.getUserProfile();
            
            var id = e.CommandArgument;
            string userName = profile.LastName + ", " + profile.FirstName;
            changeEmployeeLeaveApplication(int.Parse(id.ToString()), "REJECTED", userName);
            populateLeave(txtSearch.Text);

            string query = "SELECT employeeNo, employeeName " +
                           "FROM LeaveApplciations " +
                           "WHERE employeeNo = '" + id.ToString() + "' ";
            DataRow drLeaveApplciation = webHelperService.getByDataRow(query);

            this.recordUserActivity("Leave Rejected");

            if (drLeaveApplciation != null)
            {
                string employeeNo = drLeaveApplciation["employeeNo"].ToString();
                string employeeName = drLeaveApplciation["employeeName"].ToString();

                this.addToNotification("Leave Rejected", employeeNo, "EMPLOYEE", employeeName);
            }
        }

        private bool validateAndUpdate(int id)
        {
            bool result = true;

            LeaveApplication leaveApplication = leaveApplicationService.find(id);
            if (leaveApplication == null)
            {
                showMessage("invalid leave application.");
                return false;
            }

            EmployeeLeaveCredit employeeLeaveCredit = employeeLeaveCreditService.findActive(leaveApplication.employeeNo, leaveApplication.typeOfLeave);
            if (employeeLeaveCredit == null)
            {
                showMessage("No leave credits for this employee.");
                return false;
            }

            int remainingLeaves = employeeLeaveCredit.aquiredCredits - employeeLeaveCredit.usedCredits;
            int totalDays = int.Parse(((leaveApplication.endDate - leaveApplication.startDate).TotalDays + 1).ToString());

            if (totalDays > remainingLeaves)
            {
                showMessage("Insufficient leave credits for this employee.");
                return false;
            }

            employeeLeaveCredit.usedCredits = employeeLeaveCredit.usedCredits + totalDays;
            employeeLeaveCreditService.update(employeeLeaveCredit);

            return result;
        }

        private void changeEmployeeLeaveApplication(int id, string status, string approver)
        {
            using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            {
                connection.Open();
                string query = "UPDATE LeaveApplications " +
                               "SET status = @status, " +
                               "approver = @approver " +
                               "WHERE id = " + id + " ";

                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@status", status);
                command.Parameters.AddWithValue("@approver", approver);

                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Leave application searched");
            populateLeave(txtSearch.Text);
        }

        protected void gvEmployeeLeaveApplication_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    Label lblStatus = (Label)e.Row.Cells[6].FindControl("lblStatus");
                    if (lblStatus.Text != "PENDING")
                    {
                        e.Row.Cells[7].Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}