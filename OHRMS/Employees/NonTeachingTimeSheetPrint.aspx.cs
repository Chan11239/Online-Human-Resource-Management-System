using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Web.UI;

namespace OHRMS.Employees
{
    public partial class NonTeachingTimeSheetPrint : AbstractWebPage
    {
        WebHelperControllerService webHelperService = new WebHelperControllerService();
        string query = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["batchId"] != null)
                {
                    hidBatchId.Value = Request.QueryString["batchId"].ToString();
                }

                if (Request.QueryString["instructor"] != null)
                {
                    lblFacultyName.Text = Request.QueryString["instructor"].ToString();
                    lblInstructorName.Text = Request.QueryString["instructor"].ToString();
                }

                if (Request.QueryString["periodCovered"] != null)
                {
                    lblPeriodCovered.Text = Request.QueryString["periodCovered"].ToString();
                }

                showTimeSheet(147);
            }
            gvTimeSheetFooter();

        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }

        private void showTimeSheet(int sequenceNo)
        {
            List<TimeSheetPrintableNT> timeSheetPrintableNTs = new List<TimeSheetPrintableNT>();

            string query = "SELECT * " +
                           "FROM EmployeeTimeLog " +
                           "WHERE batchId = '" + hidBatchId.Value + "' ";

            //string query = "select batchId, employeeNo, timelog, dayOfWeek, subject, subjectTimeIn, employeeTimeIn, subjectTimeOut, employeeTimeOut, " +
            //                "(case when subjectTimeIn != cast('00:00:00' as TIME) and employeeTimeIn > subjectTimeIn then timediff(employeeTimeIn, subjectTimeIn) else timediff(subjectTimeIn, employeeTimeIn) end) as Late,  " +
            //                "(case when subjectTimeIn = cast('00:00:00' as TIME) and employeeTimeIn < subjectTimeIn then timediff(employeeTimeIn, subjectTimeIn) else '00:00:00' end) as OverTime, " +
            //                "(case when subjectTimeOut != cast('00:00:00' as TIME) and EmployeeTimeOut < subjectTimeOut then timediff(subjectTimeOut, EmployeeTimeOut) else '00:00:00' end) as UnderTime " +
            //               "FROM EmployeeTimeLog " +
            //               "WHERE batchId = '" + hidBatchId.Value + "' ";

            DataTable dtCalendayDay = webHelperService.getByDataTable(query);
            if (dtCalendayDay != null)
            {
                foreach (DataRow row in dtCalendayDay.Rows)
                {
                    TimeSheetPrintableNT timeSheetPrintableNTIn = new TimeSheetPrintableNT();
                    timeSheetPrintableNTIn.inOutTag = "In";
                    timeSheetPrintableNTIn.employeeTimeLog = row["employeeTimeIn"].ToString() == "00:00:00" ? "" : row["employeeTimeIn"].ToString();
                    timeSheetPrintableNTIn.scheduleTimeLog = row["subjectTimeIn"].ToString() == "00:00:00" ? "" : row["subjectTimeIn"].ToString();
                    DateTime timeLog = DateTime.Parse(row["timeLog"].ToString());
                    timeSheetPrintableNTIn.recordedDate = timeLog.ToString("MMMM dd yyyy", CultureInfo.InvariantCulture);
                    timeSheetPrintableNTs.Add(timeSheetPrintableNTIn);

                    TimeSheetPrintableNT timeSheetPrintableNTOut = new TimeSheetPrintableNT();
                    timeSheetPrintableNTOut.inOutTag = "Out";
                    timeSheetPrintableNTOut.employeeTimeLog = row["employeeTimeOut"].ToString() == "00:00:00" ? "" : row["employeeTimeOut"].ToString();
                    timeSheetPrintableNTOut.scheduleTimeLog = row["subjectTimeOut"].ToString() == "00:00:00" ? "" : row["subjectTimeOut"].ToString();
                    timeSheetPrintableNTOut.recordedDate = row["dayOfWeek"].ToString();
                    timeSheetPrintableNTs.Add(timeSheetPrintableNTOut);

                    //TimeSheetPrintableNT timeSheetPrintableNTLate = new TimeSheetPrintableNT();
                    //timeSheetPrintableNTIn.late = row["late"].ToString() == "00:00:00" ? "" : row["late"].ToString();
                    //timeSheetPrintableNTIn.overTime = row["OverTime"].ToString() == "00:00:00" ? "" : row["OverTime"].ToString();
                    //timeSheetPrintableNTIn.underTime = row["UnderTime"].ToString() == "00:00:00" ? "" : row["UnderTime"].ToString();
                }
            }

            gvTimeSheet.DataSource = timeSheetPrintableNTs;
            gvTimeSheet.DataBind();
        }

        protected void gvTimeSheetFooter()
        {
            gvTimeSheet.FooterRow.Cells[3].Text = "Total";
            gvTimeSheet.FooterRow.Cells[4].Font.Bold = true;
            gvTimeSheet.FooterRow.Cells[4].Text = "0";
            gvTimeSheet.FooterRow.Cells[5].Font.Bold = true;
            gvTimeSheet.FooterRow.Cells[5].Text = "0";
            gvTimeSheet.FooterRow.Cells[6].Font.Bold = true;
            gvTimeSheet.FooterRow.Cells[6].Text = "0";
        }
    }
}