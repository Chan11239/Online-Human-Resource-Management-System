using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using Spire.Doc;
using System;
using System.IO;
using System.Web;
using OHRMS.Services;

namespace OHRMS.Applicants
{
    public partial class JobInformations : AbstractWebPage
    {
        private string UPLOAD_FILE_LOCATION = "~/UploadFiles/Applicants/";
        PostedJobService postedJobService = new PostedJobService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    hidPostedJobId.Value = Request.QueryString["id"].ToString();
                    getPostedJobs(int.Parse(hidPostedJobId.Value));
                }

                if (Session["ohrms.userProps"] == null)
                {
                    btnSubmit.Visible = false;
                    fuResume.Visible = false;
                    lblfuResume.Visible = false;
                    lblRemainder.Visible = false;
                }
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Applicant has been applied for vacant position");
            try
            {
                if (Session["ohrms.userProps"] == null)
                {
                    showMessage("Please login your registered account for this application.");
                    return;
                }

                if (fuResume.HasFile == false)
                {
                    showMessage("Please upload your CV / Resume.");
                    return;
                }

                string extension = Path.GetExtension(fuResume.FileName);
                switch (extension)
                {
                    case ".doc":
                    case ".docx":
                    case ".pdf":
                        break;
                    default:
                        showMessage("Invalid file format. It must be .doc, .docx, or .pdf");
                        return;
                }

                LoginProfile profile = (LoginProfile)HttpContext.Current.Session["ohrms.userProps"];
                if (checkExistingApplication(profile.UserName))
                {
                    showMessage("You have a pending application. Please contact administrator for verification.");
                    return;
                }

                string fileName = Guid.NewGuid().ToString().Replace("-", "");
                this.uploadAndConvertToPdfByFreeSpire(fileName, extension);
                this.createGuestApplication(fileName + ".pdf", profile);

                this.addToNotification("New Applicant Applied", "", "ADMINISTRATOR", "");

                showMessage("Your application is successfully submitted.");
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }

        private void uploadAndConvertToPdfByFreeSpire(string fileName, string extension)
        {
            try
            {
                // Upload to server
                fuResume.PostedFile.SaveAs(Server.MapPath(UPLOAD_FILE_LOCATION + fileName + extension));
                //var tempDirectoryPath = Environment.GetEnvironmentVariable("TEMP");
                //fuResume.PostedFile.SaveAs(tempDirectoryPath + fileName + extension);

                // Convert by FreeSpire.Doc and delete source
                if (extension.ToLower() != ".pdf")
                {
                    Document document = new Document();
                    //document.LoadFromFile(Server.MapPath(UPLOAD_FILE_LOCATION + fileName + extension));
                    document.LoadFromFile(Server.MapPath(UPLOAD_FILE_LOCATION + fileName + extension));
                    document.SaveToFile(Server.MapPath(UPLOAD_FILE_LOCATION + fileName + ".pdf"), FileFormat.PDF);
                    

                    var uri = new Uri(Server.MapPath(UPLOAD_FILE_LOCATION + fileName + extension), UriKind.Absolute);
                    File.Delete(uri.LocalPath);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private void createGuestApplication(string uploadResume, LoginProfile profile)
        {
            using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            {
                connection.Open();
                string query = "INSERT INTO Applicants " +
                               "(firstName, lastName, middleName, fullName, appliedPosition, attachedResume, status, email, postedJobReferenceId) " +
                               "VALUES " +
                               "(@firstName, @lastName, @middleName, @fullName, @appliedPosition, @attachedResume, @status, @email, @postedJobReferenceId)";

                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@firstName", profile.FirstName);
                command.Parameters.AddWithValue("@lastName", profile.LastName);
                command.Parameters.AddWithValue("@middleName", profile.MiddleName);
                command.Parameters.AddWithValue("@fullName", profile.LastName + ", " + profile.FirstName + " " + profile.MiddleName);
                command.Parameters.AddWithValue("@appliedPosition", lblTitle.Text);
                command.Parameters.AddWithValue("@attachedResume", uploadResume);
                command.Parameters.AddWithValue("@status", "NEW");
                command.Parameters.AddWithValue("@email", profile.UserName);
                command.Parameters.AddWithValue("@postedJobReferenceId", hidPostedJobId.Value);

                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        private bool checkExistingApplication(string email)
        {
            bool checkResult = false;
            using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            {
                connection.Open();
                string query = "SELECT * " +
                               "FROM Applicants " +
                               "WHERE email = '" + email + "' " +
                               "AND status != 'REJECTED' ";

                MySqlCommand command = new MySqlCommand(query, connection);
                MySqlDataReader dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    checkResult = true;
                }
                connection.Close();
            }

            return checkResult;
        }

        private void getPostedJobs(int id)
        {
            PostedJob postedJob = postedJobService.find(id);
            if (postedJob != null)
            {
                lblTitle.Text = postedJob.title;
                lblClassification.Text = postedJob.classification;
                lblDepartment.Text = postedJob.department;
                lblType.Text = postedJob.jobType;
                lblQualification.Text = postedJob.educationalQualification;
                lblYearExperience.Text = postedJob.yearExperience;
                lblDescription.Text = postedJob.generalQualifiacation.Replace(Environment.NewLine, "<br />");
                lblJobResponsibilities.Text = postedJob.jobResponsibilities.Replace(Environment.NewLine, "<br />");
            }
        }
    }
}