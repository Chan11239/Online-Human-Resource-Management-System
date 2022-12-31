using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class ApplicantList : AbstractWebPage
    {
        private ApplicantService applicantService = new ApplicantService();
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateGridDisplays();
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

        protected void gvApplicantNonTeaching_RowDataBound(object sender, GridViewRowEventArgs e)
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
                    Label lblExamination = (Label)e.Row.Cells[4].FindControl("lblExamination");
                    LinkButton lnkEPassed = (LinkButton)e.Row.Cells[4].FindControl("lnkEPassed");
                    LinkButton lnkEFailed = (LinkButton)e.Row.Cells[4].FindControl("lnkEFailed");
                    lblExamination.Visible = false;
                    lnkEPassed.Visible = false;
                    lnkEFailed.Visible = false;

                    // Column 5
                    Label lblFinalInterview = (Label)e.Row.Cells[5].FindControl("lblFinalInterview");
                    LinkButton lnkFIPassed = (LinkButton)e.Row.Cells[5].FindControl("lnkFIPassed");
                    LinkButton lnkFIFailed = (LinkButton)e.Row.Cells[5].FindControl("lnkFIFailed");
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
            LinkButton lnkAction = (LinkButton)sender;
            String recordId = e.CommandArgument.ToString();
            hidFieldPrefix.Value = string.Empty;
            string fullName = string.Empty;
            string query = "SELECT fullName " +
                           "FROM Applicants " +
                           "WHERE id='" + recordId + "' ";
            DataRow drApplicant = webHelperService.getByDataRow(query);
            if (drApplicant != null)
            {
                fullName = drApplicant["fullName"].ToString();
            }

            try
            {
                switch (lnkAction.ID)
                {
                    case "lnkProcess":
                        hidFieldPrefix.Value = "intialInterview";
                        initializePopUpAppointmentSchedule("IN-PROGRESS", string.Empty, string.Empty, recordId);
                        insertApplicantProcess(fullName, "Congratulation! You can now Proceed to Initial Interview", hidFieldPrefix.Value);
                        break;

                    case "lnkRejected":
                        updateTable("REJECTED", "", "", recordId);
                        recordUserActivity("Reject applicant"); 
                        insertApplicantProcess(fullName, "Sorry your are Reject to proceed to initial interview", hidFieldPrefix.Value);
                        populateGridDisplays();
                        break;
                    case "lnkIIFailed":
                        updateTable("REJECTED", "intialInterview", "Failed", recordId);
                        recordUserActivity("Applicant Failed in Initial Interview");
                        insertApplicantProcess(fullName, "Sorry you are failed to continue to the next step", hidFieldPrefix.Value);
                        populateGridDisplays();
                        break;
                    case "lnkTDFailed":
                        updateTable("REJECTED", "teachingDemo", "Failed", recordId);
                        recordUserActivity("Applicant Failed in Teaching Demo");
                        insertApplicantProcess(fullName, "Sorry you are failed to continue to the next step", hidFieldPrefix.Value);
                        populateGridDisplays();
                        break;
                    case "lnkEFailed":
                        updateTable("REJECTED", "examination", "Failed", recordId);
                        recordUserActivity("Applicant Failed in Examination");
                        insertApplicantProcess(fullName, "Sorry you are failed to continue to the next step", hidFieldPrefix.Value);
                        populateGridDisplays();
                        break;
                    case "lnkFIFailed":
                        updateTable("REJECTED", "finalInterview", "Failed", recordId);
                        recordUserActivity("Applicant Failed in Final Interview");
                        insertApplicantProcess(fullName, "Sorry you are failed to continue to the next step", hidFieldPrefix.Value);
                        populateGridDisplays();
                        break;

                    case "lnkIIPassed":
                        hidFieldPrefix.Value = "teachingDemo";
                        initializePopUpAppointmentSchedule("IN-PROGRESS", "intialInterview", "Passed", recordId);
                        insertApplicantProcess(fullName, "Congratulation! You can now Proceed to Teaching Demo", hidFieldPrefix.Value);
                        break;
                    case "lnkTDPassed":
                        hidFieldPrefix.Value = "examination";
                        initializePopUpAppointmentSchedule("IN-PROGRESS", "teachingDemo", "Passed", recordId);
                        insertApplicantProcess(fullName, "Congratulation! You can now Proceed to Examination", hidFieldPrefix.Value);
                        break;
                    case "lnkEPassed":
                        hidFieldPrefix.Value = "finalInterview";
                        initializePopUpAppointmentSchedule("IN-PROGRESS", "examination", "Passed", recordId);
                        insertApplicantProcess(fullName, "Congratulation! You can now Proceed to Final Interview", hidFieldPrefix.Value);
                        break;
                    case "lnkFIPassed":
                        //initializePopUpAppointmentSchedule("HIRED", "finalInterview", "Passed", recordId);
                        insertApplicantProcess(fullName, "Congratulation! You are now Hired as Employee of STI College Baliuag", "");
                        updateTable("HIRED", "finalInterview", "Passed", recordId);
                        Response.Redirect("~/Administrators/EmployeeHiringForm.aspx?applicantId=" + recordId);
                        
                        break;
                    default:
                        break;
                       
                }
            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }

        private void updateTable(string status, string fieldColumn, string fieldValue, string recordKey)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
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
                    else if (fieldValue == "Failed")
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

        private void populateGridDisplays()
        {
            WebHelperControllerService webHelperService = new WebHelperControllerService();
            webHelperService.populateGridViewByQuery(gvNewApplicants, "SELECT * FROM Applicants WHERE status = 'NEW'");
            webHelperService.populateGridViewByQuery(gvInProgessApplicants, "SELECT a.* FROM Applicants a JOIN PostedJobs b ON a.postedJobReferenceId = b.id AND lower(b.classification) = 'teaching' WHERE a.status = 'IN-PROGRESS'");
            webHelperService.populateGridViewByQuery(gvNonTeachingInProgress, "SELECT a.* FROM Applicants a JOIN PostedJobs b ON a.postedJobReferenceId = b.id AND lower(b.classification) = 'non-teaching' WHERE a.status = 'IN-PROGRESS'");
            webHelperService.populateGridViewByQuery(gvHiredApplicants, "SELECT * FROM Applicants WHERE status = 'HIRED'");
            webHelperService.populateGridViewByQuery(gvRejectedApplicants, "SELECT * FROM Applicants WHERE status = 'REJECTED'");
        }

        private void initializePopUpAppointmentSchedule(string status, string fieldName, string fieldValue, string recordId)
        {
            hidApplicantId.Value = recordId;
            hidStatus.Value = status;
            hidFieldName.Value = fieldName;
            hidFieldValue.Value = fieldValue;

            txtDate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            txtTime.Text = "09:00";
            txtPlace.Text = "STI Baliuag - Gil Carlos Street, Poblacion, Baliuag, 3006 Bulacan";
            
            mpeAppointmentSchedule.Show();
        }

        protected void btnSubmitAppointment_Click(object sender, EventArgs e)
        {
            updateTable(hidStatus.Value, hidFieldName.Value, hidFieldValue.Value, hidApplicantId.Value);
            
            if (hidFieldPrefix.Value != string.Empty)
            {
                applicantService.updateAppointment(hidFieldPrefix.Value, 
                                                   int.Parse(hidApplicantId.Value), 
                                                   DateTime.Parse(txtDate.Text), 
                                                   TimeSpan.Parse(txtTime.Text), txtPlace.Text);
            }

            //TODO: record purposes - recordUserActivity("Approve applicant");
            showMessage("Application has been " + hidStatus.Value.ToLower() +".");
            populateGridDisplays();

            
        }

        private void insertApplicantProcess(string deliverTo, string message, string status)
        {
            try
            {
                LoginProfile profile = this.getUserProfile();
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "INSERT INTO applicantProcessNotification " +
                                   "(message, status, setDate, setTime, place, dateTime, deliverTo, fullName, isRead) " +
                                   "VALUES " +
                                   "(@message, @status, @setDate, @setTime, @place, @dateTime, @deliverTo, @fullName, @isRead)";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@message", message);
                    command.Parameters.AddWithValue("@status", status);
                    command.Parameters.AddWithValue("@setDate", txtDate.Text);
                    command.Parameters.AddWithValue("@setTime", txtTime.Text);
                    command.Parameters.AddWithValue("@place", txtPlace.Text);
                    command.Parameters.AddWithValue("@dateTime", DateTime.Now);
                    command.Parameters.AddWithValue("@deliverTo", deliverTo);
                    command.Parameters.AddWithValue("@fullName", profile.LastName + ", " + profile.FirstName);
                    command.Parameters.AddWithValue("@isRead", "False");

                    command.ExecuteNonQuery();
                    connection.Close();
                }
            } 
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }

        protected void lnkHired_Command(object sender, CommandEventArgs e)
        {
            var id = e.CommandArgument;
            Response.Redirect("~/Administrators/EmployeeHiringForm.aspx?applicantId=" + id);
        }
    }
}