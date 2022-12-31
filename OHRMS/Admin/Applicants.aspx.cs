using MySql.Data.MySqlClient;
using OHRMS.Services;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace OHRMS.Admin
{
    public partial class Applicants : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WebHelperControllerService webHelperService = new WebHelperControllerService();
                webHelperService.populateGridViewByQuery(gvNewApplicants, "SELECT * FROM Applicants WHERE status = 'NEW'");
                webHelperService.populateGridViewByQuery(gvInProgessApplicants, "SELECT * FROM Applicants WHERE status = 'IN-PROGRESS'");
                webHelperService.populateGridViewByQuery(gvHiredApplicants, "SELECT * FROM Applicants WHERE status = 'HIRED'");
                webHelperService.populateGridViewByQuery(gvRejectedApplicants, "SELECT * FROM Applicants WHERE status = 'REJECTED'");
            }
        }

        protected void gvApplicants_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    // Column 3
                    Label lblIntialInterview = (Label)e.Row.Cells[3].FindControl("lblIntialInterview");
                    LinkButton lnkIIPassed = (LinkButton)e.Row.Cells[3].FindControl("lnkIIPassed");
                    LinkButton lnkIIFailed = (LinkButton)e.Row.Cells[3].FindControl("lnkIIFailed");
                    lnkIIPassed.Visible = false;
                    lnkIIFailed.Visible = false;

                    // Column 4
                    Label lblTeachingDemo = (Label)e.Row.Cells[4].FindControl("lblTeachingDemo");
                    LinkButton lnkTDPassed = (LinkButton)e.Row.Cells[4].FindControl("lnkTDPassed");
                    LinkButton lnkTDFailed = (LinkButton)e.Row.Cells[4].FindControl("lnkTDFailed");
                    lblTeachingDemo.Visible = false;
                    lnkTDPassed.Visible = false;
                    lnkTDFailed.Visible = false;

                    // Column 5
                    Label lblExamination = (Label)e.Row.Cells[5].FindControl("lblExamination");
                    LinkButton lnkEPassed = (LinkButton)e.Row.Cells[5].FindControl("lnkEPassed");
                    LinkButton lnkEFailed = (LinkButton)e.Row.Cells[5].FindControl("lnkEFailed");
                    lblExamination.Visible = false;
                    lnkEPassed.Visible = false;
                    lnkEFailed.Visible = false;

                    // Column 6
                    Label lblFinalInterview = (Label)e.Row.Cells[6].FindControl("lblFinalInterview");
                    LinkButton lnkFIPassed = (LinkButton)e.Row.Cells[6].FindControl("lnkFIPassed");
                    LinkButton lnkFIFailed = (LinkButton)e.Row.Cells[6].FindControl("lnkFIFailed");
                    lblFinalInterview.Visible = false;
                    lnkFIPassed.Visible = false;
                    lnkFIFailed.Visible = false;

                    // Viewable Object Manipulation
                    if (lblIntialInterview.Text == string.Empty)
                    {
                        lnkIIPassed.Visible = true;
                        lnkIIFailed.Visible = true;
                    }

                    if (lblIntialInterview.Text == "Passed")
                    {
                        lblTeachingDemo.Visible = true;
                    }

                    if (lblTeachingDemo.Visible == true && lblTeachingDemo.Text == string.Empty)
                    {
                        lnkTDPassed.Visible = true;
                        lnkTDFailed.Visible = true;
                    }

                    if (lblTeachingDemo.Text == "Passed")
                    {
                        lblExamination.Visible = true;
                    }

                    if (lblExamination.Visible == true && lblExamination.Text == string.Empty)
                    {
                        lnkEPassed.Visible = true;
                        lnkEFailed.Visible = true;
                    }

                    if (lblExamination.Text == "Passed")
                    {
                        lblFinalInterview.Visible = true;
                    }

                    if (lblFinalInterview.Visible == true && lblFinalInterview.Text == string.Empty)
                    {
                        lnkFIPassed.Visible = true;
                        lnkFIFailed.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        protected void lnkResume_Command(Object sender, CommandEventArgs e)
        {
            LinkButton lnkAction = (LinkButton)sender;
            String fileName = e.CommandArgument.ToString();

            string url = "../UploadFiles/Applicants/" + fileName;
            string s = "window.open('" + url + "', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }

        protected void lnkProcesing_Command(Object sender, CommandEventArgs e)
        {
            LinkButton lnkAction =(LinkButton)sender;
            String recordId = e.CommandArgument.ToString();

            switch (lnkAction.ID)
            {
                case "lnkProcess":
                    updateTable("IN-PROGRESS", "", "", recordId);
                    break;
                case "lnkRejected":
                    updateTable("REJECTED", "", "", recordId);
                    break;
                case "lnkIIFailed":
                    updateTable("REJECTED", "intialInterview", "Failed", recordId);
                    break;
                case "lnkTDFailed":
                    updateTable("REJECTED", "teachingDemo", "Failed", recordId);
                    break;
                case "lnkEFailed":
                    updateTable("REJECTED", "examination", "Failed", recordId);
                    break;
                case "lnkFIFailed":
                    updateTable("REJECTED", "finalInterview", "Failed", recordId);
                    break;
                
                case "lnkIIPassed":
                    updateTable("IN-PROGRESS", "intialInterview", "Passed", recordId);
                    break;
                case "lnkTDPassed":
                    updateTable("IN-PROGRESS", "teachingDemo", "Passed", recordId);
                    break;
                case "lnkEPassed":
                    updateTable("IN-PROGRESS", "examination", "Passed", recordId);
                    break;
                case "lnkFIPassed":
                    updateTable("HIRED", "finalInterview", "Passed", recordId);
                    Response.Redirect("~/Admin/EmployeeMaintenance.aspx");
                    break;
                default:
                    break;
            }

            // TODO: need to verify the template and message content.
            WebHelperControllerService webHelperService = new WebHelperControllerService();
            webHelperService.sendEmailNotification("espozo.glenn@gmail.com", "Application Status", lnkAction.ID + ": " + lnkAction.Text);

            Response.Redirect("~/Admin/Applicants.aspx");
        }

        private void updateTable(string status, string fieldColumn, string fieldValue, string recordKey)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    string query = string.Empty;
                    if (fieldColumn == "finalInterview" && fieldValue == "Passed")
                    {
                        query = "UPDATE applicants SET status = '" + status + "', " + fieldColumn + " = '" + fieldValue + "', hiredDate = NOW() WHERE id = " + recordKey + " ";
                    }
                    else if (fieldColumn == string.Empty && status == "REJECTED")
                    {
                        query = "UPDATE applicants SET status = '" + status + "', rejectedDate = NOW() WHERE id = " + recordKey + " ";
                    }
                    else if (fieldColumn == string.Empty)
                    {
                        query = "UPDATE applicants SET status = '" + status + "' WHERE id = " + recordKey + " ";
                    }
                    else if(fieldValue == "Failed")
                    {
                        query = "UPDATE applicants SET status = '" + status + "', " + fieldColumn + " = '" + fieldValue + "', rejectedDate = NOW() WHERE id = " + recordKey + " ";
                    }
                    else
                    {
                        query = "UPDATE applicants SET status = '" + status + "', " + fieldColumn + " = '" + fieldValue + "' WHERE id = " + recordKey + " ";
                    }
                    
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }
    }
}