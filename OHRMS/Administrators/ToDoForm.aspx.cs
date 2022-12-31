using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;

namespace OHRMS.Administrators
{
    public partial class ToDoForm : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            LoginProfile loginProfile = this.getUserProfile();

            if (loginProfile.UserName == string.Empty)
            {
                this.showMessage("Your session is already expired. Please login your user.");
                return;
            }

            ToDoService toDoService = new ToDoService();
            toDoService.save(loginProfile.UserName, txtTitle.Text, txtMessage.Text);

            this.showMessage("Your new todo was successfully save.");
            resetField();

            this.recordUserActivity("New TODO Created!");
        }

        private void resetField()
        {
            txtTitle.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }
    }
}