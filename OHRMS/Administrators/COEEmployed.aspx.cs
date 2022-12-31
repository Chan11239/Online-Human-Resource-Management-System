using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using Spire.Doc;
using System;
using System.IO;

namespace OHRMS
{
    public partial class COEAdd : AbstractWebPage
    {
        CertificateEmploymentRequestService requestCOE = new CertificateEmploymentRequestService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ddlStatus.SelectedItem.Text = "-";
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    hidId.Value = Request.QueryString["id"].ToString();
                    populateRequestCOE(id);
                }
                else
                {
                    hidId.Value = "0";
                    populateRequestCOE(0);
                }
            }

            checkButtons();
        }

        protected void btnPrintCOEEndContract_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            //    {
            //        connection.Open();
            //        string query = "UPDATE certificateemploymentrequest " +
            //                       "SET status=@status " +
            //                       "WHERE id=@id";
            //        MySqlCommand command = new MySqlCommand(query, connection);

            //        command.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
            //        command.Parameters.AddWithValue("@id", hidId.Value);

            //        command.ExecuteNonQuery();
            //        connection.Close();
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Console.Error.WriteLine(ex.Message);
            //}

            this.recordUserActivity("Coe Multipurpose Print");
            string s = "window.open('/Reports/COEMultiPurpose.aspx?id=" + hidId.Value + "', " +
                       "'popup_window', 'width=1000,height=500,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }
        private void populateRequestCOE(int id)
        {
            CertificateEmploymentRequest COErequest = requestCOE.find(id);
            lblEmployeeNo.Text = COErequest.employeeNo;
            lblEmployeeName.Text = COErequest.employeeName;
            lblReason.Text = COErequest.purpose;
            lblffectivity.Text = COErequest.prescribeAquireDate.ToString("dd-MMM-yyyy");
            //ddlStatus.SelectedValue = COErequest.status;
            coeRequestStatus.Text = COErequest.status;
        }
        private void checkButtons()
        {
            if (coeRequestStatus.Text == "APPROVED")
            {
                btnPrintCOEEndContract.Visible = true;
                btnReject.Visible = false;
                btnApprove.Visible = false;
            } else if (coeRequestStatus.Text == "PENDING")
            {
                btnPrintCOEEndContract.Visible = false;
                btnReject.Visible = true;
                btnApprove.Visible = true;
            } else
            {
                btnPrintCOEEndContract.Visible = false;
                btnReject.Visible = false;
                btnApprove.Visible = false;
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE certificateemploymentrequest " +
                                   "SET status= 'APPROVED' " +
                                   "WHERE id=@id";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    //command.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
                    command.Parameters.AddWithValue("@id", hidId.Value);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
                this.recordUserActivity("COE Multipurpose Approved");
                string message = "Certificate of Employment Request APPROVED.";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "')};</script>");
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE certificateemploymentrequest " +
                                   "SET status= 'REJECTED' " +
                                   "WHERE id=@id";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    //command.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
                    command.Parameters.AddWithValue("@id", hidId.Value);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
                this.recordUserActivity("COE Multipurpose Rejected");
                string message = "Certificate of Employment Request REJECTED.";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "')};</script>");
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
    }
}