using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;

namespace OHRMS.Reports
{
    public partial class COEEndContract : AbstractWebPage
    {
        ResignationApplicationService resignationApplicationService = new ResignationApplicationService();
        EmployeeDetailService employeeDetailService = new EmployeeDetailService();
        SignatoryOfficerService signatoryOfficerService = new SignatoryOfficerService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    populateResignationApplication(id);
                }
                else
                {
                    populateResignationApplication(0);
                }
            }
        }

        private void populateResignationApplication(int id)
        {
            ResignationApplication resignationApplication = resignationApplicationService.find(id);
            if (resignationApplication != null)
            {
                lblEndContractDate.Text = resignationApplication.effectivityDate.ToString("dd-MMM-yyyy");

                EmployeeDetail employeeDetail = employeeDetailService.find(resignationApplication.employeeNo);
                if (employeeDetail != null)
                {
                    lblEmployeeName.Text = employeeDetail.fullName;
                    lblPosition.Text = employeeDetail.position;
                    lblDateHired.Text = employeeDetail.dateAppointment.ToString("dd-MMM-yyyy");
                    lblCertificant.Text = employeeDetail.fullName;
                    lblRequestor.Text = employeeDetail.fullName;
                }

                DateTime issueDate = DateTime.Now;
                var daysuffix = CreateDateSuffix(issueDate);
                lblDay.Text = daysuffix;
                lblMonth.Text = issueDate.ToString("MMMMM");
                lblYear.Text = issueDate.ToString("yyyy");
            }

            SignatoryOfficer signatoryOfficer = signatoryOfficerService.find("HR");
            if (signatoryOfficer != null)
            {
                lblHrOfficer.Text = signatoryOfficer.officerName;
            }

        }
        public string CreateDateSuffix(DateTime date)
        {
            // Get day...
            var day = date.Day;

            // Get day modulo...
            var dayModulo = day % 10;

            // Convert day to string...
            var suffix = day.ToString(System.Globalization.CultureInfo.InvariantCulture);

            // Combine day with correct suffix...
            suffix += (day == 11 || day == 12 || day == 13) ? "th" :
                (dayModulo == 1) ? "st" :
                (dayModulo == 2) ? "nd" :
                (dayModulo == 3) ? "rd" :
                "th";

            // Return result...
            return suffix;
        }


    }
}