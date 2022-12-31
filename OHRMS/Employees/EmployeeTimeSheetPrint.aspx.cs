using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;

namespace OHRMS.Employees
{
    public partial class EmployeeTimeSheetPrint : AbstractWebPage
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

        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }

        private void showTimeSheet(int sequenceNo)
        {
            List<TimeSheetPrintable> timeSheetPrintables = new List<TimeSheetPrintable>();
            string previousDayValue = string.Empty;
            string loopDayValue;
            string tcCode = string.Empty;
            int originSequence = sequenceNo;

            for (int i = 0; i < 39; i++)
            {
                switch (previousDayValue)
                {
                    case "In":
                        loopDayValue = "Out";
                        break;
                    case "Out":
                        loopDayValue = String.Empty;
                        break;
                    default:
                        loopDayValue = "In";
                        tcCode = (sequenceNo += 1).ToString();
                        break;
                }

                previousDayValue = loopDayValue;

                TimeSheetPrintable timeSheetPrintable = new TimeSheetPrintable();
                timeSheetPrintable.tc_code = tcCode;
                timeSheetPrintable.day = loopDayValue;
                timeSheetPrintables.Add(timeSheetPrintable);
            }

            // populate employee subject class infomation
            timeSheetPrintables = populateSubjectInfomation(timeSheetPrintables, originSequence);

            // populate employee day working time
            timeSheetPrintables = popolateDayInformation(timeSheetPrintables);

            timeSheetPrintables = populateTotalTime(timeSheetPrintables);

            // reomve excess data display
            timeSheetPrintables = removeExcessDataDisplay(timeSheetPrintables);

            // populate gridview object
            gvTimeSheet.DataSource = timeSheetPrintables;
            gvTimeSheet.DataBind();
        }

        private double getFieldValue(string inputField)
        {
            return string.IsNullOrEmpty(inputField) == true ? 0 : double.Parse(inputField);
        }

        #region reference show time sheet

        private List<TimeSheetPrintable> populateSubjectInfomation(List<TimeSheetPrintable> timeSheetPrintables, int sequenceNo)
        {
            query = "SELECT a.subject, " +
                    "GROUP_CONCAT( DISTINCT CONCAT(a.dayOfWeek, ' ',TIME_FORMAT(a.subjectTimeIn, '%H:%i'), ' to ',TIME_FORMAT(a.subjectTimeOut, '%H:%i')) SEPARATOR ', ') schedule " +
                    "FROM EmployeeTimeLog a " +
                    "WHERE subject IS NOT NULL " +
                    "AND subject <> '' " +
                    "AND batchId = '" + hidBatchId.Value + "' " +
                    "GROUP BY a.subject;";

            DataTable dtSubjects = webHelperService.getByDataTable(query);
            if (dtSubjects == null)
            {
                return timeSheetPrintables;
            }

            foreach (DataRow row in dtSubjects.Rows)
            {
                sequenceNo = sequenceNo + 1;
                foreach (TimeSheetPrintable timeSheetPrintable in timeSheetPrintables)
                {
                    if (timeSheetPrintable.tc_code == sequenceNo.ToString())
                    {
                        timeSheetPrintable.subject = row["subject"].ToString();
                        timeSheetPrintable.schedule = row["schedule"].ToString();
                    }
                }
            }

            return timeSheetPrintables;
        }

        private List<TimeSheetPrintable> popolateDayInformation(List<TimeSheetPrintable> timeSheetPrintables)
        {
            string query = "SELECT a.subject, " +
                           "DAY(a.timeLog) calendarDay,  " +
                           "CASE WHEN b.typeOfLeave IS NOT NULL THEN b.typeOfLeave ELSE TIME_FORMAT(a.employeeTimeIn,'%H:%i') END employeeTimeIn, " +
                           "CASE WHEN b.typeOfLeave IS NOT NULL THEN b.typeOfLeave ELSE TIME_FORMAT(a.employeeTimeOut,'%H:%i') END employeeTimeOut,  " +
                           "CASE WHEN b.typeOfLeave IS NOT NULL THEN ROUND(TIME_TO_SEC(TIMEDIFF(a.subjectTimeOut, a.subjectTimeIn)) / (60*60), 1) ELSE ROUND(TIME_TO_SEC(TIMEDIFF(a.employeeTimeOut, a.employeeTimeIn)) / (60*60), 1) END employeeTimeHour " +
                           "FROM EmployeeTimeLog a " +
                           "LEFT JOIN leaveApplications b ON a.employeeNo = b.employeeNo AND b.status = 'APPROVED' AND a.timeLog BETWEEN b.startDate AND b.endDate " +
                           "WHERE a.subject IS NOT NULL " +
                           "AND a.subject <> '' " +
                           "AND (a.employeeTimeIn <> '00:00:00' OR a.employeeTimeOut <> '00:00:00' OR b.typeOfLeave IS NOT NULL) " +
                           "AND a.batchId = '" + hidBatchId.Value + "' ";

            DataTable dtCalendayDay = webHelperService.getByDataTable(query);
            if (dtCalendayDay == null)
            {
                return timeSheetPrintables;
            }

            foreach (TimeSheetPrintable timeSheetPrintable in timeSheetPrintables)
            {
                // Timesheet Log Uploaded
                foreach (DataRow row in dtCalendayDay.Rows)
                {
                    if (timeSheetPrintable.subject == row["subject"].ToString() && timeSheetPrintable.day == "In")
                    {
                        setEmployeeTimePerDay(int.Parse(row["calendarDay"].ToString()), row["employeeTimeIn"].ToString(), timeSheetPrintable);
                    }

                    if (timeSheetPrintable.subject == row["subject"].ToString() && timeSheetPrintable.day == "Out")
                    {
                        setEmployeeTimePerDay(int.Parse(row["calendarDay"].ToString()), row["employeeTimeOut"].ToString(), timeSheetPrintable);
                    }

                    if (timeSheetPrintable.subject == row["subject"].ToString() && timeSheetPrintable.day == "")
                    {
                        setEmployeeTimePerDay(int.Parse(row["calendarDay"].ToString()), row["employeeTimeHour"].ToString(), timeSheetPrintable);
                    }
                }


            }

            return timeSheetPrintables;
        }

        private TimeSheetPrintable setEmployeeTimePerDay(int day, string employeeValueField, TimeSheetPrintable timeSheetPrintable)
        {
            switch (day)
            {
                case 1:
                case 16:
                    timeSheetPrintable.col_1_16 = employeeValueField;
                    break;
                case 2:
                case 17:
                    timeSheetPrintable.col_2_17 = employeeValueField;
                    break;
                case 3:
                case 18:
                    timeSheetPrintable.col_3_18 = employeeValueField;
                    break;
                case 4:
                case 19:
                    timeSheetPrintable.col_4_19 = employeeValueField;
                    break;
                case 5:
                case 20:
                    timeSheetPrintable.col_5_20 = employeeValueField;
                    break;
                case 6:
                case 21:
                    timeSheetPrintable.col_6_21 = employeeValueField;
                    break;
                case 7:
                case 22:
                    timeSheetPrintable.col_7_22 = employeeValueField;
                    break;
                case 8:
                case 23:
                    timeSheetPrintable.col_8_23 = employeeValueField;
                    break;
                case 9:
                case 24:
                    timeSheetPrintable.col_9_24 = employeeValueField;
                    break;
                case 10:
                case 25:
                    timeSheetPrintable.col_10_25 = employeeValueField;
                    break;
                case 11:
                case 26:
                    timeSheetPrintable.col_11_26 = employeeValueField;
                    break;
                case 12:
                case 27:
                    timeSheetPrintable.col_12_27 = employeeValueField;
                    break;
                case 13:
                case 28:
                    timeSheetPrintable.col_13_28 = employeeValueField;
                    break;
                case 14:
                case 29:
                    timeSheetPrintable.col_14_29 = employeeValueField;
                    break;
                case 15:
                case 30:
                    timeSheetPrintable.col_15_30 = employeeValueField;
                    break;
                case 31:
                    timeSheetPrintable.col_31 = employeeValueField;
                    break;
            }

            return timeSheetPrintable;
        }

        private List<TimeSheetPrintable> removeExcessDataDisplay(List<TimeSheetPrintable> timeSheetPrintables)
        {
            foreach (TimeSheetPrintable timeSheetPrintable in timeSheetPrintables)
            {
                if (timeSheetPrintable.day != "In")
                {
                    timeSheetPrintable.tc_code = string.Empty;
                    timeSheetPrintable.subject = string.Empty;
                    timeSheetPrintable.schedule = string.Empty;
                }
                else
                {
                    timeSheetPrintable.tc_code = "148";
                }
            }

            return timeSheetPrintables;
        }

        private List<TimeSheetPrintable> populateTotalTime(List<TimeSheetPrintable> timeSheetPrintables)
        {
            hidTotalHour.Value = "0";
            foreach (TimeSheetPrintable timeSheetPrintable in timeSheetPrintables)
            {
                if (timeSheetPrintable.subject != string.Empty && timeSheetPrintable.day == string.Empty)
                {
                    timeSheetPrintable.total_hours = (
                        getFieldValue(timeSheetPrintable.col_1_16) +
                        getFieldValue(timeSheetPrintable.col_2_17) +
                        getFieldValue(timeSheetPrintable.col_3_18) +
                        getFieldValue(timeSheetPrintable.col_4_19) +
                        getFieldValue(timeSheetPrintable.col_5_20) +
                        getFieldValue(timeSheetPrintable.col_6_21) +
                        getFieldValue(timeSheetPrintable.col_7_22) +
                        getFieldValue(timeSheetPrintable.col_8_23) +
                        getFieldValue(timeSheetPrintable.col_9_24) +
                        getFieldValue(timeSheetPrintable.col_10_25) +
                        getFieldValue(timeSheetPrintable.col_11_26) +
                        getFieldValue(timeSheetPrintable.col_12_27) +
                        getFieldValue(timeSheetPrintable.col_13_28) +
                        getFieldValue(timeSheetPrintable.col_14_29) +
                        getFieldValue(timeSheetPrintable.col_15_30) +
                        getFieldValue(timeSheetPrintable.col_31)
                        ).ToString();
                }
                hidTotalHour.Value = (getFieldValue(hidTotalHour.Value.ToString()) + getFieldValue(timeSheetPrintable.total_hours)).ToString();
            }
            lblGrandTotal.Text = hidTotalHour.Value;
            return timeSheetPrintables;
        }
        #endregion

    }
}