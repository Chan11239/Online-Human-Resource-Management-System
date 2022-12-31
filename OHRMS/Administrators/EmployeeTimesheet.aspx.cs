using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class EmployeeTimesheet : AbstractWebPage
    {
        private TimeKeepingService timeKeepingService = new TimeKeepingService();
        private WebHelperControllerService webHelperControllerService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Timesheet searched");
            try
            {
                string classification = string.Empty;
                DataRow drClassification = webHelperControllerService.getByDataRow("SELECT classification FROM employeeDetails WHERE employeeNo = '" + txtEmployeeNo.Text + "' ");
                if (drClassification != null)
                {
                    classification = drClassification["classification"].ToString();
                }

                List<EmployeeTimeSheetLog> employeeTimeLogs = timeKeepingService.processEmployeeTimeLogs(txtEmployeeNo.Text, DateTime.Parse(txtFrom.Text), DateTime.Parse(txtTo.Text));

                hidBatchId.Value = Guid.NewGuid().ToString().Replace("-", "").ToUpper();
                employeeTimeLogs.ForEach(x => x.batchId = hidBatchId.Value);
                timeKeepingService.saveEmployeeTimeLogs(employeeTimeLogs);

                // Query from database
                string query = "SELECT a.batchId, a.employeeNo, a.timeLog, a.dayOfWeek, a.subject, a.subjectTimeIn, a.subjectTimeOut, " +
                               "CASE WHEN b.typeOfLeave IS NOT NULL THEN b.typeOfLeave ELSE a.employeeTimeIn END employeeTimeIn, " +
                               "CASE WHEN b.typeOfLeave IS NOT NULL THEN b.typeOfLeave ELSE a.employeeTimeOut END employeeTimeOut " +
                               "FROM employeeTimeLog a " +
                               "LEFT JOIN leaveApplications b ON a.employeeNo = b.employeeNo AND b.status = 'APPROVED' AND a.timeLog BETWEEN b.startDate AND b.endDate " +
                               "WHERE a.batchId = '" + hidBatchId.Value + "' ";

                webHelperControllerService.populateGridViewByQuery(gvTimeSheet, query);
                gvTimeSheet.Columns[3].Visible = classification.ToLower() == "teaching" ? true : false;

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Timesheet print");
            string firstName = string.Empty;
            string lastName = string.Empty;
            string type = string.Empty;
            DataRow drName = webHelperControllerService.getByDataRow("SELECT firstName, lastName, employementType FROM employeeDetails WHERE employeeNo = '" + txtEmployeeNo.Text + "' ");
            if (drName != null)
            {
                firstName = drName["firstName"].ToString();
                lastName = drName["lastName"].ToString();
                type = drName["employementType"].ToString();
            }
            string timePeriod = DateTime.Parse(txtFrom.Text).ToString("dd-MMM-yyyy") + " to " + DateTime.Parse(txtTo.Text).ToString("dd-MMM-yyyy");
            string strTeaching = null;
            strTeaching = type;
            if (gvTimeSheet.Rows.Count > 0)
            {
                if (strTeaching == "Teaching")
                {
                    string s = "window.open('/Employees/EmployeeTimesheetPrint.aspx?batchId=" + hidBatchId.Value + "" +
                           "&instructor=" + lastName + ", " + firstName + "&periodCovered=" + timePeriod + "', " +
                           "'popup_window', 'width=1500,height=500,left=100,top=100,resizable=yes');";
                    ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
                }
                else
                {
                    string s = "window.open('/Employees/NonTeachingTimeSheetPrint.aspx?batchId=" + hidBatchId.Value + "" +
                           "&instructor=" + lastName + ", " + firstName + "&periodCovered=" + timePeriod + "', " +
                           "'popup_window', 'width=1500,height=500,left=100,top=100,resizable=yes');";
                    ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
                }
            }
            else
            {
                showMessage("Please search for result before preview printable timesheet.");
            }
        }
    }
}