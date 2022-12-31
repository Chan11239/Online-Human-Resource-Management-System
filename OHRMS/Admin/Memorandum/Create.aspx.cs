using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using Spire.Doc;
using System;
using System.Configuration;
using System.IO;
using Document = Spire.Doc.Document;

namespace OHRMS.Admin.Memorandum
{
    public partial class Create : AbstractWebPage
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        private static readonly string pageBaseUrl = "~/Admin/Memorandum";
        private static readonly string pathAttachmentUrl = "~/MemorandumFiles";
        private string UPLOAD_FILE_LOCATION = "~/UploadFiles/Memorandum/";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Memorandum created");
            string extension = Path.GetExtension(file_Memo.FileName);
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
            this.uploadAndConvertToPdfByFreeSpire(fileName, extension);
            this.insertMemo(fileName + ".pdf");

            this.showMessage("Your application for the position is being process.");
        }

        private void insertMemo(string file)
        {
            try
            {
                if (this.isValidateFieldGroups() == false)
                {
                    return;
                }

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO Memorandum " +
                                   "(memoNumber, deliverTo, ccTo, issuedFrom, asOfDate, subject, message, attachedFileName) " +
                                   "VALUES " +
                                   "(@memoNumber, @deliverTo, @ccTo, @issuedFrom, @asOfDate, @subject, @message, @attachedFileName)";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@memoNumber", txtMemoNo.Text);
                    command.Parameters.AddWithValue("@deliverTo", txtTo.Text);
                    command.Parameters.AddWithValue("@ccTo", txtCc.Text);
                    command.Parameters.AddWithValue("@issuedFrom", txtFrom.Text);
                    command.Parameters.AddWithValue("@asOfDate", txtAsOfDate.Text);
                    command.Parameters.AddWithValue("@subject", txtSubject.Text);
                    command.Parameters.AddWithValue("@message", txtMessage.Text);
                    command.Parameters.AddWithValue("@attachedFileName", file);

                    command.ExecuteNonQuery();

                    connection.Close();
                }

                Response.Redirect(pageBaseUrl + "/List.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(pageBaseUrl + "/List.aspx");
        }

        private bool isValidateFieldGroups()
        {
            if (this.validateEmployeeNames(txtTo.Text) == false)
            {
                return false;
            }

            if (this.validateEmployeeNames(txtCc.Text) == false)
            {
                return false;
            }

            if (this.validateEmployeeNames(txtFrom.Text) == false)
            {
                return false;
            }

            return true;
        }

        private bool validateEmployeeNames(string fieldValues)
        {
            string[] names = fieldValues.Split(',');

            foreach (string name in names)
            {
                Console.WriteLine(name + pathAttachmentUrl);
            }

            return true;
        }

        private void uploadAndConvertToPdfByFreeSpire(string fileName, string extension)
        {
            try
            {
                // Upload to server
                file_Memo.PostedFile.SaveAs(Server.MapPath(UPLOAD_FILE_LOCATION + fileName + extension));

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
    }
}