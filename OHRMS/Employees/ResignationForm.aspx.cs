using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;

namespace OHRMS.Employees
{
    public partial class ResignationForm : AbstractWebPage
    {
        ResignationApplicationService resignationApplicationService = new ResignationApplicationService();
        UserLogService userLog = new UserLogService();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            LoginProfile loginProfile = this.getUserProfile();

            if (txtTo.Text.Trim() == string.Empty)
            {
                showMessage("Please enter a recipient.");
                return;
            }

            if (txtMessage.Text.Trim() == string.Empty)
            {
                showMessage("Please enter a message.");
                return;
            }

            if (txtEffectivity.Text == string.Empty)
            {
                showMessage("Please enter a effectivity date.");
                return;
            }

            if (resignationApplicationService.checkExists(loginProfile.UserName))
            {
                showMessage("You have already tender a resignation application.");
                return;
            }

            try
            {
                ResignationApplication resignationApplication = newResignationApplication(loginProfile);
                resignationApplicationService.save(resignationApplication);

                userLog.create(loginProfile.UserName,
                               loginProfile.LastName + ", " + loginProfile.FirstName,
                               "Resignation Letter Send",
                               DateTime.Now);

                showMessage("Hi " + loginProfile.LastName + ", " + loginProfile.FirstName + " you have submitted your resignation.");

                this.recordUserActivity("Resgination Send");
                this.addToNotification(loginProfile.LastName + ", " + loginProfile.FirstName + "Has send his/her resignation!", "", "ADMINISTRATOT", "");
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }

        }

        private ResignationApplication newResignationApplication(LoginProfile loginProfile)
        {
            return new ResignationApplication()
            {
                employeeNo = loginProfile.UserName,
                employeeName = loginProfile.LastName + ", " + loginProfile.FirstName,
                deliverTo = txtTo.Text,
                message = txtMessage.Text,
                effectivityDate = DateTime.Parse(txtEffectivity.Text)
            };
        }

        private void resetFields()
        {
            txtTo.Text = string.Empty;
            txtMessage.Text = string.Empty;
            txtEffectivity.Text = string.Empty;
        }
    }
}