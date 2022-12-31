using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using Spire.Doc;
using System;
using System.IO;

namespace OHRMS.Administrators
{
    public partial class ResignationProcessingForm : AbstractWebPage
    {
        ResignationApplicationService resignationApplicationService = new ResignationApplicationService();
        private string UPLOAD_FILE_LOCATION = "~/UploadFiles/EmployeeClearance/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlStatus.SelectedItem.Text = "-";
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    hidId.Value = Request.QueryString["id"].ToString();
                    populateResignationApplication(id);
                }
                else
                {
                    hidId.Value = "0";
                    populateResignationApplication(0);
                }
            }
        }

        private void populateResignationApplication(int id)
        {
            ResignationApplication resignationApplication = resignationApplicationService.find(id);
            lblEmployeeNo.Text = resignationApplication.employeeNo;
            lblEmployeeName.Text = resignationApplication.employeeName;
            lblReason.Text = resignationApplication.message;
            lblffectivity.Text = resignationApplication.effectivityDate.ToString("dd-MMM-yyyy");
            lbtnClearance.Text = resignationApplication.fileName;
            ddlStatus.SelectedValue = resignationApplication.status;
        }

        protected void btnUpdateProcessing_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Resignation process update");

            if (fuClearance.HasFile == false && lbtnClearance.Text == "{Clearance FileName}")
            {
                this.showMessage("Please upload employee clearance.");
                return;
            }

            if (fuClearance.HasFile == true)
            {
                string extension = Path.GetExtension(fuClearance.FileName);
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

                string fileName = Guid.NewGuid().ToString().Replace("-", "");
                uploadAndConvertToPdfByFreeSpire(fileName, extension);
                LoginProfile loginProfile = getUserProfile();
                ResignationApplication resignationApplication = resignationApplicationService.find(int.Parse(hidId.Value.ToString()));
                if (resignationApplication != null)
                {
                    resignationApplication.fileName = fileName + ".pdf";
                    resignationApplication.status = ddlStatus.SelectedValue;
                    resignationApplication.approver = ddlStatus.SelectedValue == "APPROVED" ? loginProfile.LastName + ", " + loginProfile.FirstName : string.Empty;
                    resignationApplicationService.update(resignationApplication);
                    updateUser();
                }

            }
        }

        private void uploadAndConvertToPdfByFreeSpire(string fileName, string extension)
        {
            try
            {
                // Upload to server
                fuClearance.PostedFile.SaveAs(Server.MapPath(UPLOAD_FILE_LOCATION + fileName + extension));

                // Convert by FreeSpire.Doc and delete source
                if (extension.ToLower() != ".pdf")
                {
                    Document document = new Document();
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

        protected void btnPrintCOEMultiPurpose_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Coe Multipurpose Print");
            string s = "window.open('/Reports/COEMultiPurpose.aspx', " +
                       "'popup_window', 'width=1000,height=500,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }

        protected void btnPrintCOEEndContract_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("COE End of Contract Print");
            string s = "window.open('/Reports/COEEndContract.aspx?id=" + hidId.Value + "', " +
                           "'popup_window', 'width=1000,height=500,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }

        protected void lbtnClearance_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Clearance Upload");
            string url = "../UploadFiles/EmployeeClearance/" + lbtnClearance.Text;
            string s = "window.open('" + url + "', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }

        private void updateUser()
        {
            try
            {
                string firstName = lblEmployeeName.Text.Replace("Manuel, ", "");
                string lastName = lblEmployeeName.Text.Replace(", Christian Reymond", "");
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE users SET " +
                                   "isActive=0 " +
                                   "WHERE firstName = @fisrtName " +
                                   "AND lastName = @lastName " +
                                   "AND userType = 'EMPLOYEE' ";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@fisrtName", firstName);
                    command.Parameters.AddWithValue("@lastName", lastName);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
    }
}