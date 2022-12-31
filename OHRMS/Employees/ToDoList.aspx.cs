using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;

namespace OHRMS.Employees
{
    public partial class ToDoList : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateToDoList();
            }
        }

        private void populateToDoList()
        {
            LoginProfile loginProfile = getUserProfile();
            string query = "SELECT * " +
                           "FROM EmployeeNotes " +
                           "WHERE employeeNumber = '" + loginProfile.UserName + "' " +
                           "AND isActive = 1 ";

            WebHelperControllerService webHelperService = new WebHelperControllerService();
            webHelperService.populateGridViewByQuery(gvToDo, query);
        }
    }
}