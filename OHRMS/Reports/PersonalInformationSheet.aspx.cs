using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using System;
using System.Data;
using System.Globalization;
using System.Web.UI;

namespace OHRMS.Reports
{
    public partial class PersonalInformationSheet : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["employeeNo"] != null)
                {
                    populateEmployeeDetails();
                    populateFamilyBackGround();
                    populateChildren();
                    populateEducation();
                }
            }
        }

        private void populateEmployeeDetails()
        {
            var empno = (Request.QueryString["employeeNo"]);
            try
            {
                string pic = null;
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM employeeDetails a " +
                                   "LEFT OUTER JOIN persons b ON a.employeeNo = b.employeeNo " +
                                   "WHERE a.employeeNo='" + empno + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        lblEmpNum_Profile.Text = reader["employeeNo"].ToString();
                        lblPosition.Text = reader["position"].ToString();
                        lblDepartment.Text = reader["department"].ToString();
                        lblClassification.Text = reader["classification"].ToString();
                        DateTime d = DateTime.Parse(reader["dateAppointment"].ToString());
                        lblDOA.Text = d.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                        lblRank.Text = reader["rankEmployee"].ToString();
                        lblSalary.Text = reader["salaryRate"].ToString();
                        lblStatus.Text = reader["statusOfEmployement"].ToString();
                        lblEmpType.Text = reader["employmentType"].ToString();

                        lblName_Profile.Text = reader["fullName"].ToString();
                        txtAddress.Text = reader["address"].ToString();
                        txtBirthplace.Text = reader["birthPlace"].ToString();
                        DateTime dt = DateTime.Parse(reader["birthday"].ToString());
                        lblbdate.Text = dt.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                        txtCitizenship.Text = reader["citizenship"].ToString();
                        lblContact_Profile.Text = reader["contactNumber"].ToString();
                        lblEmail_Profile.Text = reader["emailAddress"].ToString();
                        txtHeight.Text = reader["height"].ToString();
                        txtWeight.Text = reader["weight"].ToString();
                        txtGender.Text = reader["gender"].ToString();
                        txtReligion.Text = reader["religion"].ToString();
                        txtSSS.Text = reader["sssId"].ToString();
                        txtTin.Text = reader["tinId"].ToString();
                        txtHDMF.Text = reader["hdmfId"].ToString();

                        DateTime newd = DateTime.Parse(reader["newdateAppointment"].ToString());
                        newlblDOA.Text = newd.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                        newlblDepartment.Text = reader["newDepartment"].ToString();
                        newlblPosition.Text = reader["newPosition"].ToString();
                        DateTime datesep = DateTime.Parse(reader["dateSeparation"].ToString());
                        lbldateSeparation.Text = newd.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                        lblNatureSeparation.Text = reader["natureOfSeparation"].ToString();



                        lblContact_Person.Text = reader["contactPerson"].ToString();
                        lblContact_Relationship.Text = reader["relationship"].ToString();
                        lblContact_Number.Text = reader["contactPersonNumber"].ToString();

                        pic = reader["picture"].ToString().Replace("~", "..");
                    }
                    connection.Close();
                    //img_Profile.ImageUrl = pic;
                }
            }
            catch (Exception ex)
            {
                Console.Error.Write(ex.Message);
            }
        }
        private void populateFamilyBackGround()
        {
            var empno = (Request.QueryString["employeeNo"]);
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM familybackground " +
                                   "WHERE employeeNo = '" + empno + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        lblFatherName.Text = reader["fatherName"].ToString();
                        lblFatherAge.Text = reader["fatherAge"].ToString();
                        lblFatherOccupation.Text = reader["fatherOccupation"].ToString();
                        lblMotherName.Text = reader["motherName"].ToString();
                        lblMotherAge.Text = reader["motherAge"].ToString();
                        lblMotherOccupation.Text = reader["motherOccupation"].ToString();
                        lblSpouseName.Text = reader["spouseName"].ToString();
                        lblSpouseAge.Text = reader["spouseAge"].ToString();
                        lblSpouseOccupation.Text = reader["spouseOccupation"].ToString();
                    }
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                Console.Error.Write(ex.Message);
            }
        }

        private void populateChildren()

//ALTER TABLE `ohrms`.`emp_children` 
//ADD COLUMN `Emp_ParentId` VARCHAR(45) NOT NULL AFTER `Emp_ChildOccupation`,
//CHANGE COLUMN `Emp_ChildID` `Emp_ChildID` VARCHAR(50) NOT NULL,
//ADD PRIMARY KEY(`Emp_ChildID`);
//;
//        ALTER TABLE `ohrms`.`emp_children` 
//CHANGE COLUMN `Emp_ChildID` `Emp_ChildID` BIGINT NOT NULL AUTO_INCREMENT;


        {
            var empno = (Request.QueryString["employeeNo"]);
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT childrenName, childrenAge, childrenOccupation " +
                                   "FROM children " +
                                   "WHERE employeeId = '" + empno + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);

                    gvChildren.DataSource = dataSet;
                    gvChildren.DataBind();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                Console.Error.Write(ex.Message);
            }
        }

        private void populateEducation()

        {
            var empno = (Request.QueryString["employeeNo"]);
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM educationalbackground " +
                                   "WHERE employeeId = '" + empno + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        lblElemName.Text = reader["elementaryName"].ToString();
                        lblElemCourse.Text = reader["elementaryCourse"].ToString();
                        lblElemDate.Text = reader["elementaryDate"].ToString();
                        lblElemAward.Text = reader["elementaryAward"].ToString();
                        lblHSName.Text = reader["highSchoolName"].ToString();
                        lblHSCourse.Text = reader["highSchoolCourse"].ToString();
                        lblHSDate.Text = reader["highSchoolDate"].ToString();
                        lblHSAward.Text = reader["highSchoolAward"].ToString();
                        lblVocName.Text = reader["vocationalName"].ToString();
                        lblVocCourse.Text = reader["vocationalCourse"].ToString();
                        lblVocDate.Text = reader["vocationalDate"].ToString();
                        lblVocAward.Text = reader["vocationalAward"].ToString();
                        lblBachlName.Text = reader["bachelorsName"].ToString();
                        lblBachCourse.Text = reader["bachelorsCourse"].ToString();
                        lblBachDate.Text = reader["bachelorsDate"].ToString();
                        lblBachAward.Text = reader["bachelorsAward"].ToString();
                        lblMasterName.Text = reader["mastersName"].ToString();
                        lblMasterCourse.Text = reader["mastersCourse"].ToString();
                        lblMasterDate.Text = reader["mastersDate"].ToString();
                        lblMasterAward.Text = reader["mastersAward"].ToString();
                        lblDoctorateName.Text = reader["doctorsName"].ToString();
                        lblDoctorateCourse.Text = reader["doctorsCourse"].ToString();
                        lblDoctorateDate.Text = reader["doctorsDate"].ToString();
                        lblDoctorateAward.Text = reader["doctorsAward"].ToString();
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.Write(ex.Message);
            }
        }

    }
}