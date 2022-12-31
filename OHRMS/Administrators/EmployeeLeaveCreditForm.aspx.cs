using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class EmployeeLeaveCreditForm :AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        private EmployeeLeaveCreditService employeeLeaveCreditService = new EmployeeLeaveCreditService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvEmployeeLeaveCredit.DataSource = null;
                gvEmployeeLeaveCredit.DataBind();
                btnSubmit.Enabled = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtEmployeeNo.Text == string.Empty)
            {
                showMessage("Please enter a Employee No");
                return;
            }

            string query = "SELECT employeeNo, lastName, firstName, middleName, fullName, department, position, classification, " +
                           "rankEmployee, salaryRate, dateAppointment, statusOfEmployement, newDateAppointment, newDepartment, newPosition, " +
                           "dateSeparation, natureOfSeparation " +
                           "FROM EmployeeDetails " +
                           "WHERE employeeNo = '" + txtEmployeeNo.Text + "' ";

            DataRow dtEmployee = webHelperService.getByDataRow(query);
            if (dtEmployee != null)
            {
                txtEmployeeNo.Text = dtEmployee["employeeNo"].ToString();
                txtDepartment.Text = dtEmployee["department"].ToString();
                txtPosition.Text = dtEmployee["position"].ToString();
                txtFirstName.Text = dtEmployee["firstName"].ToString();
                txtLastName.Text = dtEmployee["lastName"].ToString();
                txtMiddleName.Text = dtEmployee["middleName"].ToString();

                txtEmployeeNo.Enabled = false;
                hidEmployeeNo.Value = dtEmployee["employeeNo"].ToString();
                iconSearch.Visible = false;

                populateEmployeeLeaveCredit(txtEmployeeNo.Text);
                btnSubmit.Enabled = true;
            }
            else
            {
                showMessage("Invalid Employee No.");
                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtEmployeeNo.Text == string.Empty)
            {
                showMessage("Please enter a employee no.");
                return;
            }

            if (gvEmployeeLeaveCredit == null || gvEmployeeLeaveCredit.Rows.Count == 0)
            {
                showMessage("No employee credit available.");
                return;
            }

            foreach (GridViewRow row in gvEmployeeLeaveCredit.Rows)
            {
                int aquiredCredits = int.Parse(((TextBox)row.Cells[3].FindControl("txtAquiredCredits")).Text);
                int maximumAllottedDays = int.Parse(row.Cells[2].Text);
                string leaveTypeName = row.Cells[1].Text;
                if (aquiredCredits > maximumAllottedDays)
                {
                    showMessage(leaveTypeName + " aquired credits must be equal or less than maximum allotted days.");
                    return;
                }
            }

            saveUpdateEmployeeLeaveCredit();
            populateEmployeeLeaveCredit(txtEmployeeNo.Text);
        }

        private void saveUpdateEmployeeLeaveCredit()
        {
            foreach (GridViewRow row in gvEmployeeLeaveCredit.Rows)
            {
                int employeeLeaveCreditId = int.Parse(((Label)row.Cells[3].FindControl("lblEmployeeLeaveCreditId")).Text);

                

                if (employeeLeaveCreditId == 0)
                {
                    EmployeeLeaveCredit employeeLeaveCredit = new EmployeeLeaveCredit()
                    {
                        id = employeeLeaveCreditId,
                        employeeNo = txtEmployeeNo.Text,
                        leaveTypeCode = row.Cells[0].Text,
                        aquiredCredits = int.Parse(((TextBox)row.Cells[3].FindControl("txtAquiredCredits")).Text),
                        usedCredits = int.Parse(row.Cells[4].Text)
                    };
                    employeeLeaveCreditService.save(employeeLeaveCredit);
                    this.showMessage("Leave Credit Save");
                }
                else
                {
                    EmployeeLeaveCredit employeeLeaveCredit = employeeLeaveCreditService.find(employeeLeaveCreditId);
                    employeeLeaveCredit.aquiredCredits = int.Parse(((TextBox)row.Cells[3].FindControl("txtAquiredCredits")).Text);
                    employeeLeaveCredit.lastModifiedDate = DateTime.Now;
                    employeeLeaveCredit.isActive = true;

                    employeeLeaveCreditService.update(employeeLeaveCredit);
                    this.showMessage("Leave Credit Update");
                }
            }
        }

        protected void gvEmployeeLeaveCredit_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                var employeeNo = e.CommandArgument;
                Response.Redirect("EmployeeInformation.aspx?employeeNo=" + employeeNo);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private void populateEmployeeLeaveCredit(string employeeNo)
        {
            string query = "SELECT a.id leavetypeId, a.leaveTypeCode, a.leaveTypeName, a.maximumAllottedDays, IFNULL(b.employeeNo, '') employeeNo, IFNULL(b.aquiredCredits,0) aquiredCredits, IFNULL(b.usedCredits,0) usedCredits, IFNULL(b.aquiredCredits,0) - IFNULL(b.usedCredits,0) remainingCredits, IFNULL(b.id,0)  EmployeeLeaveCreditId " +
                           "FROM Leavetypes a " +
                           "LEFT JOIN EmployeeLeaveCredits b ON a.leaveTypeCode = b.leaveTypeCode AND b.employeeNo = '" + employeeNo + "' " +
                           "LEFT JOIN EmployeeDetails c ON b.employeeNo = c.employeeNo ";
            webHelperService.populateGridViewByQuery(gvEmployeeLeaveCredit,  query);
        }
    }
}