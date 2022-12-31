using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Data;

namespace OHRMS.Administrators
{
    public partial class ScheduleNonTeachingForm : AbstractWebPage
    {
        WebHelperControllerService webHelperService = new WebHelperControllerService();
        TimeKeepingService timeKeepingService = new TimeKeepingService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    hidId.Value = Request.QueryString["id"];
                    populatePage(int.Parse(hidId.Value));
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            this.recordUserActivity("Non-Teaching schedule created");
            string sunday = Request.Form["Sunday"];
            string monday = Request.Form["Monday"];
            string tuesday = Request.Form["Tuesday"];
            string wednesday = Request.Form["Wednesday"];
            string thursday = Request.Form["Thursday"];
            string friday = Request.Form["Friday"];
            string saturday = Request.Form["Saturday"];

            if (hidId.Value != string.Empty)
            {
                timeKeepingService.updateEmployeeSchedulePlan(int.Parse(hidId.Value), txtEmployeeNo.Text, sunday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.updateEmployeeSchedulePlan(int.Parse(hidId.Value), txtEmployeeNo.Text, monday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.updateEmployeeSchedulePlan(int.Parse(hidId.Value), txtEmployeeNo.Text, tuesday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.updateEmployeeSchedulePlan(int.Parse(hidId.Value), txtEmployeeNo.Text, wednesday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.updateEmployeeSchedulePlan(int.Parse(hidId.Value), txtEmployeeNo.Text, thursday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.updateEmployeeSchedulePlan(int.Parse(hidId.Value), txtEmployeeNo.Text, friday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.updateEmployeeSchedulePlan(int.Parse(hidId.Value), txtEmployeeNo.Text, saturday, txtPeriodFrom.Text, txtPeriodTo.Text);

            }
            else
            {
                timeKeepingService.saveEmployeeSchedulePlan(txtEmployeeNo.Text, sunday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.saveEmployeeSchedulePlan(txtEmployeeNo.Text, monday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.saveEmployeeSchedulePlan(txtEmployeeNo.Text, tuesday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.saveEmployeeSchedulePlan(txtEmployeeNo.Text, wednesday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.saveEmployeeSchedulePlan(txtEmployeeNo.Text, thursday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.saveEmployeeSchedulePlan(txtEmployeeNo.Text, friday, txtPeriodFrom.Text, txtPeriodTo.Text);
                timeKeepingService.saveEmployeeSchedulePlan(txtEmployeeNo.Text, saturday, txtPeriodFrom.Text, txtPeriodTo.Text);
            }

            showMessage("Employee No. " + txtEmployeeNo.Text + " has successfully save.");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ScheduleNonTeachingList.aspx");
        }

        private void populatePage(int id)
        {
            string query = "SELECT a.* " +
                           "FROM EmployeeSchedulePlans a " +
                           "WHERE a.id = " + hidId.Value + "";

            DataRow drEmployeeSchedulePlan = webHelperService.getByDataRow(query);
            if (drEmployeeSchedulePlan != null)
            {
                txtEmployeeNo.Text = drEmployeeSchedulePlan["employeeNumber"].ToString();
                //ddlDay.SelectedValue = drEmployeeSchedulePlan["dayOfWeekName"].ToString();
                txtPeriodFrom.Text = drEmployeeSchedulePlan["periodFrom"].ToString();
                txtPeriodTo.Text = drEmployeeSchedulePlan["periodTo"].ToString();
            }
        }
    }
}