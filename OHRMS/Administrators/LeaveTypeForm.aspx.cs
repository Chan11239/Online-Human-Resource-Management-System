using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;

namespace OHRMS.Administrators
{
    public partial class LeaveTypeForm : AbstractWebPage
    {
        WebHelperControllerService webHelperService = new WebHelperControllerService();
        LeaveTypeService leaveTypeService = new LeaveTypeService();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    hidId.Value = Request.QueryString["id"];
                    getLeaveType(int.Parse(hidId.Value));
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtCode.Text.Trim() == string.Empty)
            {
                showMessage("Code is required.");
                return;
            }

            if (txtName.Text.Trim() == string.Empty)
            {
                showMessage("Name is required.");
                return;
            }

            if (txtMaximumAlottedDays.Text.Trim() == string.Empty || txtMaximumAlottedDays.Text == "0")
            {
                showMessage("Maximum allotted days is required.");
                return;
            }


            string message = string.Empty;
            int id = hidId.Value == string.Empty ? 0 : int.Parse(hidId.Value.ToString());
            LeaveType leaveType = new LeaveType()
            {
                id = id,
                leaveTypeCode = txtCode.Text,
                leaveTypeName = txtName.Text,
                leaveTypeDescription = txtDescription.Text,
                maximumAllottedDays = int.Parse(txtMaximumAlottedDays.Text)
            };

            if (hidId.Value == string.Empty)
            {
                if (leaveTypeService.save(leaveType) == true)
                {
                    showMessage("New Leave Type successfully saved.");
                    Response.Redirect("~/Administrators/LeaveTypeList.aspx");
                    //lockFields();
                }
            }
            else
            {
                if (leaveTypeService.update(leaveType) == true)
                {
                    showMessage("Update Type of Leaves. Successful.");
                    lockFields();
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrators/LeaveTypeList.aspx");
        }

        private void getLeaveType(int id)
        {
            string query = "SELECT * " +
                           "FROM LeaveTypes " +
                           "WHERE id = " + id.ToString();
            
            DataRow drLeaveType = webHelperService.getByDataRow(query);
            if (drLeaveType != null)
            {
                txtCode.Text = drLeaveType["leaveTypeCode"].ToString();
                txtName.Text = drLeaveType["leaveTypeName"].ToString();
                txtDescription.Text = drLeaveType["leaveTypeDescription"].ToString();
                txtMaximumAlottedDays.Text = drLeaveType["maximumAllottedDays"].ToString();
            }
        }

        private void lockFields()
        {
            txtCode.Enabled = false;
            txtDescription.Enabled = false;
            txtName.Enabled = false;
            txtMaximumAlottedDays.Enabled = false;
            btnSubmit.Enabled = false;
        }
    }
}