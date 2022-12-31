using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Web.UI.WebControls;

namespace OHRMS.Employees
{
    public partial class ScheduleView : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string filename = string.Empty;
                if (Request.QueryString["file"] != null)
                {
                    filename = Request.QueryString["file"];
                    
                }
                LoginProfile loginProfile = this.getUserProfile();

                //populateScheduleHeader(loginProfile.UserName, filename);
                populateSchedule(gvScheduleMonday, loginProfile.UserName, filename, ((int)DayOfWeek.Monday));
                populateSchedule(gvScheduleTuesday, loginProfile.UserName, filename, ((int)DayOfWeek.Tuesday));
                populateSchedule(gvScheduleWednesday, loginProfile.UserName, filename, ((int)DayOfWeek.Wednesday));
                populateSchedule(gvScheduleThursday, loginProfile.UserName, filename, ((int)DayOfWeek.Thursday));
                populateSchedule(gvScheduleFriday, loginProfile.UserName, filename, ((int)DayOfWeek.Friday));
                populateSchedule(gvScheduleSaturday, loginProfile.UserName, filename, ((int)DayOfWeek.Saturday));
                populateSchedule(gvScheduleSunday, loginProfile.UserName, filename, ((int)DayOfWeek.Sunday));
            }
        }

        private void populateScheduleHeader(string employeeNo, string fileName)
        {
            
            try
            {
                using (MySqlConnection connection = new MySqlConnection(this.getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT employeeNumber, uploadFileName, schoolYear, semisterBatch, DATE_FORMAT(semisterStartDate, '%d-%M-%Y') semisterStartDate " +
                                   "FROM Employeescheduleplans " +
                                   "WHERE employeeNumber = '" + employeeNo + "' " +
                                   "AND uploadFileName = '" + fileName + "' " +
                                   "GROUP BY employeeNumber, uploadFileName, schoolYear, semisterBatch, semisterStartDate";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        while (dataReader.Read())
                        {
                            dataReader.NextResult();
                        }
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private void populateSchedule(GridView gv, string employeeNo, string fileName, int weekNo)
        {
            string query = "SELECT subjectName, dayOfWeekNo, dayOfWeekName, TIME_FORMAT(periodFrom, '%H:%i') periodFrom, TIME_FORMAT(periodTo, '%H:%i') periodTo, section " +
                           "FROM EmployeeSchedulePlans " +
                           "WHERE employeeNumber = '" + employeeNo + "' " +
                           "AND uploadFileName = '" + fileName + "' " +
                           "AND dayOfWeekNo = " + weekNo + " " +
                           "ORDER BY dayOfWeekNo, periodFrom";
            webHelperService.populateGridViewByQuery(gv, query); ;
        }
    }
}