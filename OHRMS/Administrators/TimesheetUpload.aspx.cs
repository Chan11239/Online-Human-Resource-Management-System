using Ganss.Excel;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.IO;
using System.Web.UI.WebControls;
using OHRMS.Helpers;

namespace OHRMS.Administrators
{
    public partial class TimesheetUpload : AbstractWebPage
    {
        private string UPLOAD_FILE_LOCATION_TIMESHEET = "~/UploadFiles/EmployeeTimeSheets/";
        private TimeKeepingService timeKeepingService = new TimeKeepingService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ohrms.userProps"] != null)
                {
                    this.recordUserActivity("Timesheet viewed");
                    LoginProfile profile = this.getUserProfile();
                    this.populateGridView();
                }
            }
        }
        private void populateGridView()
        {         
            LoginProfile profile = (LoginProfile)Session["ohrms.userProps"];

            WebHelperControllerService webHelperService = new WebHelperControllerService();
            string query = "SELECT batchId, departmentName, employeeNumber, employeeName, CONCAT(MIN(DATE_FORMAT(recordDateTime, '%d-%b-%Y')), " +
                           "MAX(DATE_FORMAT(recordDateTime, '%d-%b-%Y'))) recordDateRange, originalFileName, uploadFileName, DATE_FORMAT(uploadedDate, '%d-%b-%Y') uploadedDate, " +
                           "CONCAT(SUBSTRING(batchId, 1, 10) ,'...') batchIdDisplay " +
                           "FROM TimeKeepingRecords " +
                           "GROUP BY batchId, departmentName, employeeNumber, employeeName, originalFileName, uploadFileName, DATE_FORMAT(uploadedDate, '%d-%b-%Y') " +
                           "ORDER BY CONCAT(MIN(DATE_FORMAT(recordDateTime, '%d-%b-%Y')), MAX(DATE_FORMAT(recordDateTime, '%d-%b-%Y'))) ";
            webHelperService.populateGridViewByQuery(gvTimeSheet, query);
        }

        protected void lnkTimesheet_Command(object sender, CommandEventArgs e)
        {
            LinkButton lnkAction = (LinkButton)sender;
            String batchId = e.CommandArgument.ToString();
            Response.Redirect("~/Administrators/TimeSheetDetail.aspx?batchId=" + batchId);
        }

        protected void btnSubmitTimeSheet_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Timesheet uploaded");
            if (fuTimeSheet.HasFile == false)
            {
                this.showMessage("Please upload your employee timesheet.");
                return;
            }

            string extension = Path.GetExtension(fuTimeSheet.FileName);
            switch (extension)
            {
                case ".xls":
                case ".xlsx":
                    break;
                default:
                    this.showMessage("Invalid file format. It must be .xls or .xlsx.");
                    return;
            }

            // Uploading
            string fileName = Guid.NewGuid().ToString().Replace("-", "");
            string orginalFileName = fuTimeSheet.FileName;
            string systemFileName = fileName + extension;

            fuTimeSheet.PostedFile.SaveAs(Server.MapPath(UPLOAD_FILE_LOCATION_TIMESHEET + fileName + extension));

            // Reading
            var uploadedFile = Server.MapPath(UPLOAD_FILE_LOCATION_TIMESHEET + fileName + extension);
            ExcelMapper mapper = new ExcelMapper(uploadedFile)
            {
                HeaderRow = false,
                CreateMissingHeaders = true,
                MinRowNumber = 1,
                SkipBlankRows = true
            };
            var timeSheetTracks = mapper.Fetch<TimeSheetTrack>();

            // Processing
            bool isWithError = false;
            LoginProfile profile = (LoginProfile)Session["ohrms.userProps"];
            foreach (TimeSheetTrack timeSheetTrack in timeSheetTracks)
            {
                bool hasError = timeKeepingService.saveTimeKeepingRecord(timeSheetTrack, fileName, orginalFileName, systemFileName);
                if (isWithError == false && hasError == false)
                {
                    isWithError = true;
                }

            }

            int records = timeKeepingService.countTimeKeepingRecord(fileName);
            this.showMessage(string.Concat("Your employee timesheet has " + records.ToString() + " record(s) been uploaded ", isWithError == true ? "with record fields error omitted." : "."));

            this.populateGridView();
        }
    }
}