using Ganss.Excel;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.IO;
using System.Web.UI.WebControls;

namespace OHRMS.Employees
{
    public partial class ScheduleForm : AbstractWebPage
    {
        private TimeKeepingService timeKeepingService = new TimeKeepingService();
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        private UserLogService userLog = new UserLogService();
        private string UPLOAD_FILE_LOCATION_SCHEDULE = "~/UploadFiles/EmployeeSchedules/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateSummaryUpload();
                
            }
        }
        
        protected void btnSubmitSchedule_Click(object sender, EventArgs e)
        {
            if (txtSchoolYear.Text == string.Empty)
            {
                this.showMessage("Please enter a Semester school year.");
                return;
            }

            if (ddlSemester.SelectedIndex == 0)
            {
                this.showMessage("Please enter a Semester.");
                return;
            }

            if (txtStartDate.Text == string.Empty)
            {
                this.showMessage("Please enter a Semester start date.");
                return;
            }

            if (DateTime.Parse(txtStartDate.Text).Year != int.Parse(txtSchoolYear.Text))
            {
                this.showMessage("Please Semester start date and school year must be equal.");
                return;
            }

            if (fuSchedule.HasFile == false)
            {
                this.showMessage("Please upload your employee schedule.");
                return;
            }

            string extension = Path.GetExtension(fuSchedule.FileName);
            switch (extension)
            {
                case ".xls":
                case ".xlsx":
                    break;
                default:
                    this.showMessage("Invalid file format. It must be .xls or .xlsx.");
                    return;
            }

            LoginProfile profile = this.getUserProfile();
            if (timeKeepingService.existEmployeeSchedulePlan(profile.UserName, ddlSemester.SelectedValue, int.Parse(txtSchoolYear.Text)))
            {
                this.showMessage("Semester Year and batch already exist.");
                return;
            }

            // Uploading
            string fileName = Guid.NewGuid().ToString().Replace("-", "");
            string orginalFileName = fuSchedule.FileName;
            string systemFileName = fileName + extension;

            fuSchedule.PostedFile.SaveAs(Server.MapPath(UPLOAD_FILE_LOCATION_SCHEDULE + fileName + extension));

            // Reading
            var uploadedFile = Server.MapPath(UPLOAD_FILE_LOCATION_SCHEDULE + fileName + extension);
            ExcelMapper mapper = new ExcelMapper(uploadedFile)
            {
                HeaderRow = false,
                CreateMissingHeaders = true,
                MinRowNumber = 1,
                SkipBlankRows = true
            };
            var schedulePlans = mapper.Fetch<SchedulePlan>();

            // Processing
            
            bool isWithError = false;
            foreach (SchedulePlan schedulePlan in schedulePlans)
            {
                bool hasError = false;
                if (schedulePlan.EmployeeNo == profile.UserName)
                {
                    hasError = timeKeepingService.saveEmployeeSchedulePlan(schedulePlan, fileName, orginalFileName, systemFileName, DateTime.Now,
                                                                            int.Parse(txtSchoolYear.Text), ddlSemester.SelectedValue, DateTime.Parse(txtStartDate.Text));
                }
                
                if (isWithError == false && hasError == false)
                {
                    isWithError = true;
                }
            }

            int records = timeKeepingService.countEmployeeSchedulePlan(fileName + extension);
            this.showMessage(string.Concat("Your employee schedule has " + records.ToString() + " record(s) benn uploaded ", isWithError == true ? "with record fields error omitted." : "."));
            this.populateSummaryUpload();

            string fullName = profile.LastName + ", " + profile.FirstName;

            userLog.create(profile.UserName, fullName, "Upload Schedule", DateTime.Now);
        }

        private void populateSummaryUpload()
        {
            LoginProfile profile = this.getUserProfile();
            string query = "SELECT employeeNumber, originalFileName, CONCAT('...', RIGHT(uploadFileName, 15)) uploadFileNameMin, uploadFileName, isLocked, isActive, schoolYear, SemisterBatch, DATE_FORMAT(SemisterStartDate, '%d-%M-%Y') SemisterStartDate " +
                           "FROM Employeescheduleplans " +
                           "WHERE employeeNumber = '" + profile.UserName + "' " +
                           "GROUP BY employeeNumber, originalFileName, uploadFileName, isLocked, isActive, schoolYear, SemisterBatch, SemisterStartDate " +
                           "ORDER BY schoolYear DESC, SemisterStartDate DESC " +
                           "LIMIT 10";
            webHelperService.populateGridViewByQuery(gvSummaryScheduleUpload, query); ;
        }

        protected void lnkSchedule_Command(Object sender, CommandEventArgs e)
        {
            LinkButton lnkAction = (LinkButton)sender;
            String filename = e.CommandArgument.ToString();
            Response.Redirect("~/Employees/ScheduleView.aspx?file=" + filename);
        }
    }
}