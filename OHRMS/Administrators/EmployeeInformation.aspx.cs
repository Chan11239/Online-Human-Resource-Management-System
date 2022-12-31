using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Data;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class EmployeeInformation : AbstractWebPage 
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["employeeNo"] != null)
                {
                    hidEmployeeNo.Value = Request.QueryString["employeeNo"];
                }
                populateEmployeeDetails();
                populateEmployeeFiles();
                populateFamilyBackGround();
                populateChildren();
                populateSeminar();
                populateCertificates();
                populateWorkExperience();
                disablePoint();
            }
        }

        private void disablePoint()
        {
            string type = string.Empty;
            string query = "SELECT classification FROM employeeDetails WHERE employeeNo = '" + hidEmployeeNo.Value + "' ";
            DataRow drEmployementType = webHelperService.getByDataRow(query);
            if (drEmployementType != null)
            {
                type = drEmployementType["classification"].ToString();
            }
            if (type == "Teaching")
            {
                lblPosition.Visible = false;
            }
            else
            {
                txtPoints.Enabled = false;
                btnPoints.Enabled = false;
                btnSave.Enabled = false;
                ddlPosition.Visible = false;

            }
        }
        private void populateDropDownPosition(string department)
        {
            string query = "SELECT positionName FROM position WHERE departmentName = '" + department + "' ";
            DataTable dt = webHelperService.getByDataTable(query);
            if (dt != null)
            {
                ddlPosition.DataSource = dt;
                ddlPosition.DataValueField = dt.Columns["positionName"].ToString();
                ddlPosition.DataTextField = dt.Columns["positionName"].ToString();
                ddlPosition.DataBind();
                ddlPosition.Items.Insert(0, new ListItem("- Select -", "-"));
            }
            else
            {
                ddlPosition.Items.Insert(0, new ListItem("- Select -", "-"));
            }
        }
        private void populateEmployeeDetails()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM employeeDetails a " +
                                   "LEFT OUTER JOIN persons b ON a.employeeNo = b.employeeNo " +
                                   "WHERE a.employeeNo='" + hidEmployeeNo.Value + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        lblEmpNum_Profile.Text = reader["employeeNo"].ToString();
                        lblPosition.Text = reader["position"].ToString();
                        lblCllasification.Text = reader["classification"].ToString();
                        ddlPosition.SelectedValue = reader["position"].ToString();
                        lblDepartment.Text = reader["department"].ToString();
                        DateTime d = DateTime.Parse(reader["dateAppointment"].ToString());
                        lblDOA.Text = d.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                        lblRanks.Text = reader["rankEmployee"].ToString();
                        lblSalary.Text = reader["salaryRate"].ToString();
                        lblStatus.Text = reader["statusOfEmployement"].ToString();
                        lblType.Text = reader["employmentType"].ToString();
                        txtPoints.Text = reader["points"].ToString();
                    }
                    connection.Close();
                    
                    string filename = string.Empty;
                    string queryPersons = "SELECT * " +
                                   "FROM persons " +
                                   "WHERE employeeNo = '" + hidEmployeeNo.Value + "' ";
                    DataRow drPersonalInformation = webHelperService.getByDataRow(queryPersons);
                    if (drPersonalInformation != null)
                    {
                        lblName_Profile.Text = drPersonalInformation["fullName"].ToString();
                        txtAddress.Text = drPersonalInformation["address"].ToString();
                        txtBirthplace.Text = drPersonalInformation["contactNumber"].ToString();
                        lblEmail_Profile.Text = drPersonalInformation["emailAddress"].ToString();
                        txtBirthplace.Text = drPersonalInformation["birthPlace"].ToString();
                        DateTime d = DateTime.Parse(drPersonalInformation["birthday"].ToString());
                        lblbday.Text = d.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                        txtCitizenship.Text = drPersonalInformation["citizenship"].ToString();
                        txtReligion.Text = drPersonalInformation["religion"].ToString();
                        txtGender.Text = drPersonalInformation["gender"].ToString();
                        txtHeight.Text = drPersonalInformation["height"].ToString();
                        txtWeight.Text = drPersonalInformation["weight"].ToString();
                        txtTin.Text = drPersonalInformation["tinId"].ToString();
                        txtPhilhealth.Text = drPersonalInformation["philHealthId"].ToString();
                        txtSSS.Text = drPersonalInformation["sssId"].ToString();
                        txtHDMF.Text = drPersonalInformation["hdmfId"].ToString();
                        filename = drPersonalInformation["picture"].ToString();
                    }
                    img_Profile.ImageUrl = filename;
                }
            }
            catch (Exception ex)
            {
                Console.Error.Write(ex.Message);
            }

            populateDropDownPosition(lblDepartment.Text);

            
        }
        
        public void populateEmployeeFiles()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM employeeFiles " +
                                   "WHERE employeeNo = '" + hidEmployeeNo.Value + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        lnkResume.Text = reader["resume"].ToString();
                        lnkTor.Text = reader["tor"].ToString();
                        lnkDiploma.Text = reader["diploma"].ToString();
                        lnkCert.Text = reader["certificates"].ToString();
                        lnkCOE.Text = reader["coe"].ToString();
                        lnkSSS.Text = reader["sssId"].ToString();
                        lnkPhilhealth.Text = reader["philHealthId"].ToString();
                        lnktin.Text = reader["tinId"].ToString();
                        lnkPagibig.Text = reader["pagIbigId"].ToString();
                        lnkMedical.Text = reader["medicalResult"].ToString();
                        lnkHealthCard.Text = reader["healthId"].ToString();
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.Write(ex.Message);
            }
        }
        
        private void populateFamilyBackGround()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM familyBackground " +
                                   "WHERE employeeNo = '" + hidEmployeeNo.Value + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        txtFatherName.Text = reader["fatherName"].ToString();
                        txtFatherAge.Text = reader["fatherAge"].ToString();
                        txtFatherOccupation.Text = reader["fatherOccupation"].ToString();
                        txtMotherName.Text = reader["motherName"].ToString();
                        txtMotherAge.Text = reader["motherAge"].ToString();
                        txtMotherOccupation.Text = reader["motherOccupation"].ToString();
                        txtSpouseName.Text = reader["spouseName"].ToString();
                        txtSpouseAge.Text = reader["spouseAge"].ToString();
                        txtSpouseOccupation.Text = reader["spouseOccupation"].ToString();
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
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT childrenName, childrenAge, childrenOccupation " +
                                   "FROM children " +
                                   "WHERE employeeId = '" + hidEmployeeNo.Value + "'";
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
        
        private void populateWorkExperience()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT company, position, inclusiveDates, natureOfSeparation " +
                                   "FROM workExperience " +
                                   "WHERE employeeId = '" + hidEmployeeNo.Value + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);

                    gvWorkExperience.DataSource = dataSet;
                    gvWorkExperience.DataBind();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                Console.Error.Write(ex.Message);
            }
        }
        
        private void populateSeminar()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT typeSeminar, institution, inclusiveDates " +
                                   "FROM seminar " +
                                   "WHERE employeeId = '" + hidEmployeeNo.Value + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);

                    gvSeminar.DataSource = dataSet;
                    gvSeminar.DataBind();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                Console.Error.Write(ex.Message);
            }
        }
        
        private void populateCertificates()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT typeCertification, institution, inclusiveDates " +
                                   "FROM certificates " +
                                   "WHERE employeeId = '" + hidEmployeeNo.Value + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);

                    gvCertificate.DataSource = dataSet;
                    gvCertificate.DataBind();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                Console.Error.Write(ex.Message);
            }
        }
        protected void lnkPrintPreview_Click(object sender, EventArgs e)
        {
           try
            {
                var employeeNo = lblEmpNum_Profile.Text;
                Response.Redirect("/Reports/PersonalInformationSheet.aspx?employeeNo=" + employeeNo);
            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }

        protected void lnkResume_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnkResume.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkTor_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnkTor.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkDiploma_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnkDiploma.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkCert_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnkCert.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkCOE_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnkCOE.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnktin_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnktin.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkPagibig_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnkPagibig.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkMedical_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnkMedical.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkHealthCard_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnkHealthCard.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkSSS_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnkSSS.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkPhilhealth_Click(object sender, EventArgs e)
        {
            string path = "~/UploadFiles/EmployeeFiles/" + hidEmployeeNo.Value + "/";

            Session["file"] = path + lnkPhilhealth.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Update Personal Information Tab
            this.recordUserActivity("Emp Personal info updated");

            try
            {
                string address = string.Empty;
                string queryAddress = "SELECT address " +
                               "FROM persons " +
                               "WHERE employeeNo= '" + hidEmployeeNo.Value + "'";
                DataRow drAddress = webHelperService.getByDataRow(queryAddress);
                if (drAddress != null)
                {
                    address = drAddress["address"].ToString();
                }
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    
                    if (address != "")
                    {
                        connection.Open();
                        string query = "UPDATE persons SET " +
                                   "address=@address, birthPlace=@birthpalce, citizenship=@citizenship, religion=@religion, gender=@gender, " +
                                   "height=@height, weight=@weight, tinId=@tin, sssId=@sss, philHealthId=@philhealth, hdmfId=@hdmf " +
                                   "WHERE employeeNo='" + lblEmpNum_Profile.Text + "'";
                        MySqlCommand command = new MySqlCommand(query, connection);
                        command.Parameters.AddWithValue("@address", txtAddress.Text);
                        command.Parameters.AddWithValue("@birthpalce", txtBirthplace.Text);
                        command.Parameters.AddWithValue("@citizenship", txtCitizenship.Text);
                        command.Parameters.AddWithValue("@religion", txtReligion.Text);
                        command.Parameters.AddWithValue("@gender", txtGender.Text);
                        command.Parameters.AddWithValue("@height", txtHeight.Text);
                        command.Parameters.AddWithValue("@weight", txtWeight.Text);
                        command.Parameters.AddWithValue("@tin", txtTin.Text);
                        command.Parameters.AddWithValue("@sss", txtSSS.Text);
                        command.Parameters.AddWithValue("@philhealth", txtPhilhealth.Text);
                        command.Parameters.AddWithValue("@hdmf", txtHDMF.Text);

                        command.ExecuteNonQuery();
                        connection.Close();
                        this.showMessage("Information Updated.");
                    } else if (address == "")
                    {
                        connection.Open();
                        string query = "INSERT INTO persons " +
                                   "(employeeNo, fullName, address, birthPlace, citizenship, religion, gender, height, weight, tinId, philHealthId, sssId, hdmfId) " +
                                   "VALUES " +
                                   "(@employeeNo, @fullName, @address, @birthPlace, @citizenship, @religion, @gender, @height, @weight, @tinId, @philHealthId, @sssId, @hdmfId) ";

                        MySqlCommand command = new MySqlCommand(query, connection);
                        command.Parameters.AddWithValue("@employeeNo", lblEmpNum_Profile.Text);
                        command.Parameters.AddWithValue("@fullName", lblName_Profile.Text);
                        command.Parameters.AddWithValue("@address", txtAddress.Text);
                        command.Parameters.AddWithValue("@birthPlace", txtBirthplace.Text);
                        command.Parameters.AddWithValue("@citizenship", txtCitizenship.Text);
                        command.Parameters.AddWithValue("@religion", txtReligion.Text);
                        command.Parameters.AddWithValue("@gender", txtGender.Text);
                        command.Parameters.AddWithValue("@height", txtHeight.Text);
                        command.Parameters.AddWithValue("@weight", txtWeight.Text);
                        command.Parameters.AddWithValue("@tinId", txtTin.Text);
                        command.Parameters.AddWithValue("@sssId", txtSSS.Text);
                        command.Parameters.AddWithValue("@philHealthId", txtPhilhealth.Text);
                        command.Parameters.AddWithValue("@hdmfId", txtHDMF.Text);
                        command.ExecuteNonQuery();

                        connection.Close();
                        this.showMessage("Employee Information Save!");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        private void updateRank()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE employeeDetails " +
                                   "SET rankEmployee=@rank, salaryRate=@salary, points=@point " +
                                   "WHERE employeeNo = '" + lblEmpNum_Profile.Text + "' ";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@rank", lblRanks.Text);
                    command.Parameters.AddWithValue("@salary", lblSalary.Text);
                    command.Parameters.AddWithValue("@point", txtPoints.Text);

                    command.ExecuteNonQuery();
                    connection.Close(); this.showMessage("Rank and Salary Updated!");
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        protected void btnPoints_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "SELECT rankName, salaryRate " +
                               "FROM rankMaintenance " +
                               "WHERE '" + txtPoints.Text + "' " +
                               "BETWEEN startPoints AND endPoint " +
                               "AND type = '" + lblType.Text + "' ";
                DataRow drRank = webHelperService.getByDataRow(query);
                if (drRank != null)
                {
                    lblSalary.Text = drRank["salaryRate"].ToString();
                    lblRanks.Text = drRank["rankName"].ToString();
                }
                
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
            
        }

        private void updatePosition()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE employeeDetails " +
                                   "SET position=@position " +
                                   "WHERE employeeNo = '" + lblEmpNum_Profile.Text + "' ";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@position", ddlPosition.SelectedValue);

                    command.ExecuteNonQuery();
                    connection.Close();
                    this.showMessage("Position Updated!");
                    ddlPosition.Visible = false;
                   
                    populateEmployeeDetails();
                    lblPosition.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        protected void btnSavePoints_Click(object sender, EventArgs e)
        {
            updateRank();
            updatePosition();
        }
    }
}
