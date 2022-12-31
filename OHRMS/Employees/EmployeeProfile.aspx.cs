using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;
using System.Globalization;
using System.Web.UI;

namespace OHRMS.Employees
{
    public partial class EmployeeProfile : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoginProfile loginProfile = getUserProfile();

                getEmployeeInfo(loginProfile.UserName);
                populateEmployeeDetails(loginProfile.UserName);
                populateFamilyBackground(loginProfile.UserName);
            }
        }

        public void getEmployeeInfo(string employeeNo)
        {
            string query = "SELECT employeeNo, lastName, firstName, middleName, fullName, department, position, classification, " +
                           "rankEmployee, salaryRate, dateAppointment, statusOfEmployement, newDateAppointment, newDepartment, newPosition, " +
                           "dateSeparation, natureOfSeparation  " +
                           "FROM EmployeeDetails " +
                           "WHERE employeeNo ='" + employeeNo + "' ";
            DataRow drEmployeeDetail = webHelperService.getByDataRow(query);
            if(drEmployeeDetail != null)
            {
                lblEmpNum_Profile.Text = drEmployeeDetail["employeeNo"].ToString();
                //lblDepartment.Text = drEmployeeDetail["department"].ToString();
                lblPosition_Profile.Text = drEmployeeDetail["position"].ToString();
                lblClassification_Profile.Text = drEmployeeDetail["classification"].ToString();
                lblRank_Profile.Text = drEmployeeDetail["rankEmployee"].ToString();
                lblSalary.Text = drEmployeeDetail["salaryRate"].ToString();
                //DateTime dt = DateTime.Parse(drEmployeeDetail["dateAppointment"].ToString());
                //lblH.Text = dt.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
            }
        }

        private void populateEmployeeDetails (string employeeNo)
        {
            string filename = null;
            string query = "SELECT * " +
                           "FROM persons " +
                           "WHERE employeeNo = '" + employeeNo + "' ";
            DataRow drPersonalInformation = webHelperService.getByDataRow(query);
            if (drPersonalInformation != null)
            {
                lblName_Profile.Text = drPersonalInformation["fullName"].ToString();
                lblAddress_Profile.Text = drPersonalInformation["address"].ToString();
                lblEmail_Profile.Text = drPersonalInformation["emailAddress"].ToString();
                DateTime d = DateTime.Parse(drPersonalInformation["birthday"].ToString());
                lblBirthday_Profile.Text = d.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                lblStatus_Profile.Text = drPersonalInformation["civilStatus"].ToString();
                lblReligion.Text = drPersonalInformation["religion"].ToString();
                lblGender.Text = drPersonalInformation["gender"].ToString();
                lblTin_Profile.Text = drPersonalInformation["tinId"].ToString();
                lblPhilhealth_Profile.Text = drPersonalInformation["philHealthId"].ToString();
                lblSSS_Profile.Text = drPersonalInformation["sssId"].ToString();
                filename = drPersonalInformation["picture"].ToString();
                lblContact_Profile.Text = drPersonalInformation["contactNumber"].ToString();
            }
            img_Profile.ImageUrl = filename;
        }

        private void populateFamilyBackground(string employeeNo)
        {
            string query = "SELECT * " +
                           "FROM familyBackground " +
                           "WHERE employeeNo = '" + employeeNo + "' ";

            DataRow drFamilyBackground = webHelperService.getByDataRow(query);
            if (drFamilyBackground != null)
            {
                lblFatherName.Text = drFamilyBackground["fatherName"].ToString();
                lblFatherAge.Text = drFamilyBackground["fatherAge"].ToString();
                lblFatherOccupation.Text = drFamilyBackground["fatherOccupation"].ToString();
                lblMotherName.Text = drFamilyBackground["motherName"].ToString();
                lblMotherAge.Text = drFamilyBackground["motherAge"].ToString();
                lblMotherOccupation.Text = drFamilyBackground["motherOccupation"].ToString();
                lblSpouseName.Text = drFamilyBackground["spouseName"].ToString();
                lblSpouseAge.Text = drFamilyBackground["spouseAge"].ToString();
                lblSpouseOccupation.Text = drFamilyBackground["spouseOccupation"].ToString();
            }
        }
    }
}