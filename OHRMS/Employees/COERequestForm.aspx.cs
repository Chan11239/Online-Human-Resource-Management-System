using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;

namespace OHRMS.Employees
{
    public partial class COERequestForm : AbstractWebPage
    {
        CertificateEmploymentRequestService certificateEmploymentRequestService = new CertificateEmploymentRequestService();
        WebHelperControllerService webHelperControllerService = new WebHelperControllerService();
        double salary = 00;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoginProfile loginProfile = getUserProfile();
                lblEmployeeNo.Text = loginProfile.UserName;
                lblRequestorName.Text = loginProfile.LastName + ", " + loginProfile.FirstName + " " + loginProfile.MiddleName ;
            }
        }
        private void getSalary(string employeeNo)
        {
            string query = "SELECT salaryRate " +
                           "FROM employeeDetails " +
                           "WHERE employeeNo='" + employeeNo + "' ";
            DataRow drSalary = webHelperControllerService.getByDataRow(query);
            if (drSalary != null)
            {
                salary = double.Parse(drSalary["salaryRate"].ToString());
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (txtPurpose.Text.Trim() == string.Empty)
            {
                showMessage("Please state a purpose.");
                return;
            }

            if (txtPrescribeDate.Text == string.Empty)
            {
                showMessage("Please enter a prescribe date.");
                return;
            }

            CertificateEmploymentRequest certificateEmploymentRequest = newCertificateEmploymentRequest();
            certificateEmploymentRequestService.save(certificateEmploymentRequest);
            

            showMessage("Hi " + lblRequestorName.Text + " you have sent a request for COE.");
        }

        private CertificateEmploymentRequest newCertificateEmploymentRequest()
        {
            LoginProfile loginProfile = getUserProfile();
            getSalary(lblEmployeeNo.Text);
            return new CertificateEmploymentRequest()
            {
                employeeNo = lblEmployeeNo.Text,
                employeeName = lblRequestorName.Text,
                department = loginProfile.Department,
                purpose = txtPurpose.Text,
                salary = salary,
                prescribeAquireDate = DateTime.Parse(txtPrescribeDate.Text),
                coeType = "MULTI PURPOSE",
                status = "PENDING"
        };
        }

        private void resetFields()
        {
            txtPurpose.Text = string.Empty;
            txtPrescribeDate.Text = string.Empty;
        }
    }
}