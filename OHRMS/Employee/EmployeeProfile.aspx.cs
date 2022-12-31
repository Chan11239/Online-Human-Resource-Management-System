using MySql.Data.MySqlClient;
using System;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
namespace OHRMS
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        Label lblid = new Label();
        MySqlConnection conn;
        MySqlCommand cmd;
        MySqlDataReader reader;
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Emp_ID"] != null)
            {
                lblid.Text = Session["Emp_ID"].ToString();
            }
            if (!Page.IsPostBack)
            {
                getEmployeeInfo();
                getEmployeeDetails();
                getFamBack();
            }
        }
        public void getEmployeeInfo()
        {
            try
            {
                conn = new MySqlConnection(connstring);
                string query = "Select * from Emp_Information where Emp_ID='" + lblid.Text + "'";

                cmd = new MySqlCommand(query, conn);
                conn.Open();
                cmd.Connection = conn;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    lblEmpNum_Profile.Text = reader["Emp_ID"].ToString();
                    lblDepartment.Text = reader["Emp_Department"].ToString();
                    lblPosition_Profile.Text = reader["Emp_Position"].ToString();
                    lblClassification_Profile.Text = reader["Emp_Classification"].ToString();
                    lblRank_Profile.Text = reader["Emp_Rank"].ToString();
                    lblSalary.Text = reader["Emp_SalaryRate"].ToString();
                    DateTime d = DateTime.Parse(reader["Emp_DateAppointment"].ToString());
                    //lblDateAppoint.Text = d.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void getEmployeeDetails()
        {
            try
            {
                string filename = null;
                conn = new MySqlConnection(connstring);
                string query = "Select * from Emp_PersonalInfo where Emp_PerosnalID='" + lblid.Text + "'";

                cmd = new MySqlCommand(query, conn);
                conn.Open();
                cmd.Connection = conn;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    lblName_Profile.Text = reader["Emp_Name"].ToString();
                    lblAddress_Profile.Text = reader["Emp_Address"].ToString();
                    lblEmail_Profile.Text = reader["Emp_EmailAdd"].ToString();
                    DateTime d = DateTime.Parse(reader["Emp_Birthday"].ToString());
                    lblBirthday_Profile.Text = d.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                    lblStatus_Profile.Text = reader["Emp_CivilStatus"].ToString();
                    lblGender.Text = reader["Emp_Gender"].ToString();
                    lblTin_Profile.Text = reader["Emp_Tin"].ToString();
                    lblPhilhealth_Profile.Text = reader["Emp_PhilHealth"].ToString();
                    lblSSS_Profile.Text = reader["Emp_SSS"].ToString();
                    filename = reader["Emp_Picture"].ToString();
                    lblContact_Profile.Text = reader["Emp_ContactNum"].ToString();
                }
                conn.Close();
                img_Profile.ImageUrl = filename;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void getFamBack()
        {
            try
            {
                conn = new MySqlConnection(connstring);
                string query = "Select * from Emp_FamilyBackground where Emp_FamID='" + lblid.Text + "'";

                cmd = new MySqlCommand(query, conn);
                conn.Open();
                cmd.Connection = conn;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    lblFatherName.Text = reader["Emp_FatherName"].ToString();
                    lblFatherAge.Text = reader["Emp_FatherAge"].ToString();
                    lblFatherOccupation.Text = reader["Emp_FatherOccupation"].ToString();
                    lblMotherName.Text = reader["Emp_MotherName"].ToString();
                    lblMotherAge.Text = reader["Emp_MotherAge"].ToString();
                    lblMotherOccupation.Text = reader["Emp_MotherOccupation"].ToString();
                    lblSpouseName.Text = reader["Emp_SpouseName"].ToString();
                    lblSpouseAge.Text = reader["Emp_SpouseAge"].ToString();
                    lblSpouseOccupation.Text = reader["Emp_SpouseOccupation"].ToString();
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}