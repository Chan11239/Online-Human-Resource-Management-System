using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using Spire.Doc;
using System;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace OHRMS.Employee
{
    public partial class WebForm3 : AbstractWebPage
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        private string UPLOAD_FILE_LOCATION = "~/UploadFiles/EmployeeFiles/";
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        string folderPath = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string employeeNo = string.Empty;
                if (Session["ohrms.userProps"] != null)
                {
                    LoginProfile profile = this.getUserProfile();
                    employeeNo = profile.UserName;
                }
                populateFiles(employeeNo);
                populateEmployeeDetails(employeeNo);

                folderPath = Server.MapPath(UPLOAD_FILE_LOCATION + employeeNo + "/");

                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists Create it.
                    Directory.CreateDirectory(folderPath);
                }
            }
        }
        public void populateFiles(string employeeNo)
        {
            try 
            { 
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM employeeFiles " +
                                   "WHERE employeeNo = '"+ employeeNo + "' ";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        lblFilename_CV.Text = reader["resume"].ToString();
                        DateTime dateCV = DateTime.Parse(reader["resumeDate"].ToString());
                        lblDate_Resume.Text = dateCV.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);

                        //lblFilename_Picture.Text = reader["Emp_2x2Picture"].ToString();
                        //DateTime datePicture = DateTime.Parse(reader["Emp_PictureDate"].ToString());
                        //lblDate_Pic.Text = datePicture.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);

                        lblFilename_Diploma.Text = reader["diploma"].ToString();
                        lblFilename_TOR.Text = reader["tor"].ToString();
                        DateTime dateDiploma = DateTime.Parse(reader["diplomaDate"].ToString());
                        lblDate_Credentials.Text = dateCV.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);

                        lblFilename_COE.Text = reader["coe"].ToString();
                        DateTime dateCOE = DateTime.Parse(reader["coeDate"].ToString());
                        lblDate_COE.Text = dateCOE.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);

                        lblFilename_CTC.Text = reader["ctc"].ToString();
                        DateTime dateCTC = DateTime.Parse(reader["ctcDate"].ToString());
                        lblDate_CTC.Text = dateCTC.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);

                        lblFilename_SSS.Text = reader["sssId"].ToString();
                        DateTime dateSSS = DateTime.Parse(reader["sssIdDate"].ToString());
                        lblDate_SSS.Text = dateSSS.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);

                        lblFilename_Philhealth.Text = reader["philHealthId"].ToString();
                        DateTime datePhilHealth = DateTime.Parse(reader["philHealthIdDate"].ToString());
                        lblDate_Philhealth.Text = datePhilHealth.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);

                        lblFilename_Pagibig.Text = reader["pagIbigId"].ToString();
                        DateTime datePagIbig = DateTime.Parse(reader["pagIbigIdDate"].ToString());
                        lblDate_Pagibig.Text = datePagIbig.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);

                        lblFIlename_Tin.Text = reader["tinId"].ToString();
                        DateTime dateTin = DateTime.Parse(reader["tinIdDate"].ToString());
                        lblDate_Tin.Text = dateTin.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);

                        lblFilename_Medical.Text = reader["medicalResult"].ToString();
                        DateTime dateMedical = DateTime.Parse(reader["medicalResultDate"].ToString());
                        lblDate_Medical.Text = dateMedical.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);

                        lblFilename_HealthCard.Text = reader["healthId"].ToString();
                        DateTime dateHealthCard = DateTime.Parse(reader["healthIdDate"].ToString());
                        lblDate_HealthCard.Text = dateMedical.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        private void populateEmployeeDetails(string employeeNo)
        {
            try
            {
                string query = "SELECT * " +
                               "FROM employeeDetails a " +
                               "INNER JOIN persons b ON " +
                               "a.employeeNo = b.employeeNo " +
                               "WHERE a.employeeNo = '" + employeeNo + "' ";
                DataRow drEmployeeDetails = webHelperService.getByDataRow(query);
                if (drEmployeeDetails != null)
                {
                    txtEmpID_Check.Text = drEmployeeDetails["employeeNo"].ToString();
                    txtName_Check.Text = drEmployeeDetails["fullName"].ToString();
                    txtPosition_Check.Text = drEmployeeDetails["position"].ToString();
                    txtEmail_Checl.Text = drEmployeeDetails["emailAddress"].ToString();
                    txtAddress_Check.Text = drEmployeeDetails["address"].ToString();
                    txtContact_Check.Text = drEmployeeDetails["contactNumber"].ToString();
                    DateTime dateBirthday = DateTime.Parse(drEmployeeDetails["birthday"].ToString());
                    txtBirthday_Check.Text = dateBirthday.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                    DateTime dateHired = DateTime.Parse(drEmployeeDetails["dateAppointment"].ToString());
                    txtDateHired_Check.Text = dateHired.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                }
            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }
        
        private void uploadAndConvertToPdfByFreeSpire(string fileName, string extension, FileUpload name)
        {
            try
            {
                // Upload to server
                LoginProfile profile = this.getUserProfile();
                string employeeNo = profile.UserName;
                
                name.PostedFile.SaveAs(Server.MapPath(UPLOAD_FILE_LOCATION + employeeNo + "/" + fileName + extension));

                // Convert by FreeSpire.Doc and delete source
                if (extension.ToLower() != ".pdf")
                {
                    Document document = new Document();
                    document.LoadFromFile(Server.MapPath(UPLOAD_FILE_LOCATION + employeeNo + "/" + fileName + extension));
                    document.SaveToFile(Server.MapPath(UPLOAD_FILE_LOCATION + employeeNo + "/" + fileName + ".pdf"), FileFormat.PDF);

                    var uri = new Uri(Server.MapPath(UPLOAD_FILE_LOCATION + employeeNo + "/" + fileName + extension), UriKind.Absolute);
                    File.Delete(uri.LocalPath);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        private void insertEmployeeFiles(string uploadFile, LoginProfile profile, string columnName, string columnDate)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO employeeFiles " +
                               "(employeeNo, employeeName, "+columnName+ ", " + columnDate + ") " +
                               "VALUES " +
                               "(@employeeNo, @employeeName, @columnName, @Date)";

                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@employeeNo", profile.UserName);
                command.Parameters.AddWithValue("@employeeName", profile.LastName + ", " + profile.FirstName);
                command.Parameters.AddWithValue("@columnName", uploadFile);
                command.Parameters.AddWithValue("@Date", DateTime.Now);

                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        private void updateEmployeeFiles(string uploadFile, LoginProfile profile, string columnName, string columnDate)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string query = "UPDATE employeeFiles SET "+columnName+ "=@columnName, " + columnDate + "=@date WHERE employeeNo='" + profile.UserName+"'";

                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@employeeNo", profile.UserName);
                command.Parameters.AddWithValue("@columnName", uploadFile);
                command.Parameters.AddWithValue("@date", DateTime.Now);

                command.ExecuteNonQuery();
                connection.Close();
            }
        }
        //resume Upload
        protected void btnSubmit_CV_Click(object sender, EventArgs e)
        {
            try
            {
                string extension = Path.GetExtension(file_Resume.FileName);
                switch (extension)
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        break;
                    default:
                        this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                        return;
                }
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + "-" + profile.FirstName;
                string strFilePath = fullName + "-CV";
                string fileName = strFilePath;
                this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_Resume);
                if (lblFilename_CV.Text != "")
                {
                    this.updateEmployeeFiles(fileName + ".pdf", profile, "resume", "resumeDate");
                    this.showMessage("Your Resume is Updated");
                    this.addToNotification(fullName + " update resume", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Update Resume");
                }
                else
                {
                    this.insertEmployeeFiles(fileName + ".pdf", profile, "resume", "resumeDate");
                    this.showMessage("Your Resume has been Submitted.");
                    this.addToNotification(fullName + " resume submitted", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Resume Submitted");
                }
                
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
        //Photo
        protected void btnSubmit_Pic_Click(object sender, EventArgs e)
        {
            
        }
        //credentials
        protected void btnSubmit_Credentials_Click(object sender, EventArgs e)
        {

            if (file_TOR.FileName == "" && file_Diploma.FileName == "")
            {
                this.showMessage("Please Select your TOR and Diploma");
            }
            else
            {
                try
                {
                    string extension = Path.GetExtension(file_Diploma.FileName);
                    switch (extension)
                    {
                        case ".doc":
                        case ".docx":
                        case ".pdf":
                            break;
                        default:
                            this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                            return;
                    }
                    LoginProfile profile = this.getUserProfile();
                    string fullName = profile.LastName + "-" + profile.FirstName;
                    string strFilePath = fullName + "-DIPLOMA";
                    string fileName = strFilePath;
                    this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_Diploma);
                    if (lblFilename_CV.Text != "")
                    {
                        this.updateEmployeeFiles(fileName + ".pdf", profile, "diploma", "diplomaDate");
                        this.showMessage("Your Diploma is Updated");
                        this.addToNotification(fullName + " Diploma updated", "", "ADMINISTRATOR", "");
                        this.recordUserActivity("Diploma updated");
                    }
                    else
                    {
                        this.insertEmployeeFiles(fileName + ".pdf", profile, "diploma", "diplomaDate");
                        this.showMessage("Your Diploma has been Submitted.");
                        this.addToNotification(fullName + " Diploma submitted", "", "ADMINISTRATOR", "");
                        this.recordUserActivity("Diploma submitted");
                    }

                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine("Service Error: " + ex.Message);
                }
                //upload TOR
                try
                {
                    string extension = Path.GetExtension(file_TOR.FileName);
                    switch (extension)
                    {
                        case ".doc":
                        case ".docx":
                        case ".pdf":
                            break;
                        default:
                            this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                            return;
                    }
                    LoginProfile profile = this.getUserProfile();
                    string fullName = profile.LastName + "-" + profile.FirstName;
                    string strFilePath = fullName + "-TOR";
                    string fileName = strFilePath;
                    this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_TOR);
                    if (lblFilename_CV.Text != "")
                    {
                        this.updateEmployeeFiles(fileName + ".pdf", profile, "tor", "torDate");
                        this.showMessage("Your TOR is Updated");
                        this.addToNotification(fullName + " TOR updated", "", "ADMINISTRATOR", "");
                        this.recordUserActivity("TOR updated");
                    }
                    else
                    {
                        this.insertEmployeeFiles(fileName + ".pdf", profile, "tor", "torDate");
                        this.showMessage("Your TOR has been Submitted.");
                        this.addToNotification(fullName + " TOR Submitted", "", "ADMINISTRATOR", "");
                        this.recordUserActivity("TOR Submitted");
                    }

                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine("Service Error: " + ex.Message);
                }
            }
        }
        //Certificate
        protected void btnRemarks_Cert_Click(object sender, EventArgs e)
        {
            
        }
        //COE
        protected void btnSubmit_COE_Click(object sender, EventArgs e)
        {
            try
            {
                string extension = Path.GetExtension(file_COE.FileName);
                switch (extension)
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        break;
                    default:
                        this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                        return;
                }
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + "-" + profile.FirstName;
                string strFilePath = fullName + "-COE";
                string fileName = strFilePath;
                this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_Resume);
                if (lblFilename_CV.Text != null)
                {
                    this.updateEmployeeFiles(fileName + ".pdf", profile, "coe", "coeDate");
                    this.showMessage("Your COE is Updated");
                    this.addToNotification(fullName + " COE Updated", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("COE Updated");
                }
                else
                {
                    this.insertEmployeeFiles(fileName + ".pdf", profile, "coe", "coeDate");
                    this.showMessage("Your COE has been Submitted.");
                    this.addToNotification(fullName + " COE Submitted", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("COE Submitted");
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
        //CTC
        protected void btnSUbmit_CTC_Click(object sender, EventArgs e)
        {
            try
            {
                string extension = Path.GetExtension(file_CTC.FileName);
                switch (extension)
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        break;
                    default:
                        this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                        return;
                }
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + "-" + profile.FirstName;
                string strFilePath = fullName + "-CTC";
                string fileName = strFilePath;
                this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_Resume);
                if (lblFilename_CV.Text != null)
                {
                    this.updateEmployeeFiles(fileName + ".pdf", profile, "ctc", "ctcDate");
                    this.showMessage("Your Community Tax Certificate is Updated");
                    this.addToNotification(fullName + " Community Tax Certificate Updated", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Community Tax Certificate Updated");
                }
                else
                {
                    this.insertEmployeeFiles(fileName + ".pdf", profile, "ctc", "ctcDate");
                    this.showMessage("Your Community Tax Certificate has been Submitted.");
                    this.addToNotification(fullName + " Community Tax Certificate Submitted", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Community Tax Certificate Submitted");
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
        //SSS
        protected void btnSubmit_SSS_Click(object sender, EventArgs e)
        {
            try
            {
                string extension = Path.GetExtension(file_SSS.FileName);
                switch (extension)
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        break;
                    default:
                        this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                        return;
                }
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + "-" + profile.FirstName;
                string strFilePath = fullName + "-SSS";
                string fileName = strFilePath;
                this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_Resume);
                if (lblFilename_CV.Text != null)
                {
                    this.updateEmployeeFiles(fileName + ".pdf", profile, "sssId", "sssIdDate");
                    this.showMessage("Your SSS ID/Form is Updated");
                    this.addToNotification(fullName + " SSS ID/Form Updated", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("SSS ID/Form Updated");
                }
                else
                {
                    this.insertEmployeeFiles(fileName + ".pdf", profile, "sssId", "sssIdDate");
                    this.showMessage("Your SSS ID/Form has been Submitted.");
                    this.addToNotification(fullName + " SSS ID/Form Submitted", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("SSS ID/Form Submitted");
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
        //philhealth
        protected void btnSubmit_Philhealth_Click(object sender, EventArgs e)
        {
            try
            {
                string extension = Path.GetExtension(file_Philhealth.FileName);
                switch (extension)
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        break;
                    default:
                        this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                        return;
                }
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + "-" + profile.FirstName;
                string strFilePath = fullName + "-PHILHEALTH";
                string fileName = strFilePath;
                this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_Resume);
                if (lblFilename_CV.Text != null)
                {
                    this.updateEmployeeFiles(fileName + ".pdf", profile, "philHealthId", "philHealthIdDate");
                    this.showMessage("Your PhilHealth ID/Form is Updated");
                    this.addToNotification(fullName + " PhilHealth ID/Form Updated", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("PhilHealth ID/Form Updated");
                }
                else
                {
                    this.insertEmployeeFiles(fileName + ".pdf", profile, "philHealthId", "philHealthIdDate");
                    this.showMessage("Your PhilHealth ID/Form has been Submitted.");
                    this.addToNotification(fullName + " PhilHealth ID/Form Submitted", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("PhilHealth ID/Form Submitted");
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
        //pagibigg
        protected void btnSubmit_Pagibig_Click(object sender, EventArgs e)
        {
            try
            {
                string extension = Path.GetExtension(file_Pagibig.FileName);
                switch (extension)
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        break;
                    default:
                        this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                        return;
                }
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + "-" + profile.FirstName;
                string strFilePath = fullName + "-PAGIBIG";
                string fileName = strFilePath;
                this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_Resume);
                if (lblFilename_CV.Text != null)
                {
                    this.updateEmployeeFiles(fileName + ".pdf", profile, "pagIbigId", "pagIbigIdDate");
                    this.showMessage("Your Pag-Ibig ID/Form is Updated");
                    this.addToNotification(fullName + " Pag-Ibig ID/Form Updated", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Pag-Ibig ID/Form Updated");
                }
                else
                {
                    this.insertEmployeeFiles(fileName + ".pdf", profile, "pagIbigId", "pagIbigIdDate");
                    this.showMessage("Your Pag-Ibig ID/Form has been Submitted.");
                    this.addToNotification(fullName + " Pag-Ibig ID/Form Submitted", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Pag-Ibig ID/Form Submitted");
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
        //TIN
        protected void btnSubmit_Tin_Click(object sender, EventArgs e)
        {
            try
            {
                string extension = Path.GetExtension(file_Tin.FileName);
                switch (extension)
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        break;
                    default:
                        this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                        return;
                }
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + "-" + profile.FirstName;
                string strFilePath = fullName + "-1902";
                string fileName = strFilePath;
                this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_Resume);
                if (lblFilename_CV.Text != null)
                {
                    this.updateEmployeeFiles(fileName + ".pdf", profile, "tinId", "tinIdDate");
                    this.showMessage("Your TIN (1902/ID) is Updated");
                    this.addToNotification(fullName + " Your TIN (1902/ID) Updated", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Your TIN (1902/ID) Updated");
                }
                else
                {
                    this.insertEmployeeFiles(fileName + ".pdf", profile, "tinId", "tinIdDate");
                    this.showMessage("Your TIN (1902/ID) has been Submitted.");
                    this.addToNotification(fullName + " TIN (1902/ID) Submitted", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("TIN (1902/ID) Submitted");
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
        //medical
        protected void btnSubmit_Medical_Click(object sender, EventArgs e)
        {
            try
            {
                string extension = Path.GetExtension(file_Medical.FileName);
                switch (extension)
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        break;
                    default:
                        this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                        return;
                }
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + "-" + profile.FirstName;
                string strFilePath = fullName + "-XRAY";
                string fileName = strFilePath;
                this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_Resume);
                if (lblFilename_CV.Text != null)
                {
                    this.updateEmployeeFiles(fileName + ".pdf", profile, "medicalResult", "medicalResultDate");
                    this.showMessage("Your Medical Result/XRAY is Updated");
                    this.addToNotification(fullName + " Medical Result/XRAY Updated", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Medical Result/XRAY Updated");
                }
                else
                {
                    this.insertEmployeeFiles(fileName + ".pdf", profile, "medicalResult", "medicalResultDate");
                    this.showMessage("Your Medical Result/XRAY has been Submitted.");
                    this.addToNotification(fullName + " Medical Result/XRAY Submitted", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Medical Result/XRAY Submitted");
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }

        protected void btnSubmit_HealthCard_Click(object sender, EventArgs e)
        {
            try
            {
                string extension = Path.GetExtension(file_HealthCard.FileName);
                switch (extension)
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        break;
                    default:
                        this.showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                        return;
                }
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + "-" + profile.FirstName;
                string strFilePath = fullName + "-HEALTHCARD";
                string fileName = strFilePath;
                this.uploadAndConvertToPdfByFreeSpire(fileName, extension, file_Resume);
                if (lblFilename_CV.Text != null)
                {
                    this.updateEmployeeFiles(fileName + ".pdf", profile, "healthId", "healthIdDate");
                    this.showMessage("Your Health Card is Updated");
                    this.addToNotification(fullName + " Health Card Updated", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Health Card Updated");
                }
                else
                {
                    this.insertEmployeeFiles(fileName + ".pdf", profile, "healthId", "healthIdDate");
                    this.showMessage("Your Health Card has been Submitted.");
                    this.addToNotification(fullName + " Health Card Submitted", "", "ADMINISTRATOR", "");
                    this.recordUserActivity("Health Card Submitted");
                }

            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
    }
}