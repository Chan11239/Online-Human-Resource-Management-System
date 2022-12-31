using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Windows;

namespace OHRMS.Admin
{
    public partial class WebForm6 : AbstractWebPage
    {
        private UserLogService userLog = new UserLogService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {       
            using (MySqlConnection conn = new MySqlConnection(getConnetionStrings))
            {
                conn.Open();
                string query = "INSERT INTO faqMaintenance " +
                    "(groupFaq, question, answer) " +
                    "VALUES " +
                    "(@group, @question, @answer)";

                MySqlCommand command = new MySqlCommand(query, conn);
                command.Parameters.AddWithValue("@group", ddlGroup.SelectedValue);
                command.Parameters.AddWithValue("@question", txtQuestion.Text);
                command.Parameters.AddWithValue("@answer", txtAnswer.Text);

                command.ExecuteNonQuery();
                MessageBox.Show("FAQ has been Added!");
                conn.Close();
            }

            LoginProfile profile = this.getUserProfile();
            userLog.create(profile.UserName, profile.LastName + ", " + profile.FirstName, "Add New FAQ", DateTime.Now);
        }

    }
}