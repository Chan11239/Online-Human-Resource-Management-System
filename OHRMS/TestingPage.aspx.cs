using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Web;

namespace OHRMS
{
    public partial class TestingPage : AbstractWebPage
    {
        AutoNumberService autoNumberService = new AutoNumberService();
        WebHelperControllerService webHelperService = new WebHelperControllerService();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAutoNumber_Click(object sender, EventArgs e)
        {
            lblAutoNumber.Text = autoNumberService.getNewEmployeeNo(txtSuffix.Text);
        }

        protected void btnShowIFrame_Click(object sender, EventArgs e)
        {
            iframeReport.Src = txtIFrameSouce.Text;
        }

        protected void btnCallPageContent_Click(object sender, EventArgs e)
        {
            try
            {

                //string url = "http://" + HttpContext.Current.Request.Url.Authority + txtUrl.Text;
                //url = url.Replace("44393", "50489");

                string urlHost = Request.Url.GetLeftPart(UriPartial.Authority);
                string url = urlHost + txtUrl.Text;
                string message = webHelperService.getHtmlContent(url);

                if (txtUrl.Text == "ConfirmationOfApplication.html")
                {
                    message = message.Replace("{ApplicantName}", "Glenn Espozo");
                    message = message.Replace("{HROfficer}", "JULIE ANN DE LARA-ENRIQUEZ");
                }
                else
                {
                    message = message.Replace("{ApplicantName}", "Glenn Espozo");
                    message = message.Replace("{HROfficer}", "JULIE ANN DE LARA-ENRIQUEZ");
                }
                

                txtPageContentDisplay.Text = message;
                //webHelperService.sendEmailNotification("espozo.glenn@gmail.com", "Application Status", message);
            }
            catch (Exception ex)
            {
                txtPageContentDisplay.Text = ex.Message;
            }
            
        }
    }
}