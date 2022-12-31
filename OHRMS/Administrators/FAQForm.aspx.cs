using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using System;

namespace OHRMS.Administrators
{
    public partial class FAQForm : AbstractWebPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ddlGroup.SelectedValue == "-")
            {
                showMessage("Please select a group.");
                return;
            }

            if (txtQuestion.Text == string.Empty)
            {
                showMessage("Please a question.");
                return;
            }

            if (txtAnswer.Text == string.Empty)
            {
                showMessage("Eneter a answer.");
                return;
            }

            saveFAQ();
            recordUserActivity("Add FAQ");
            showMessage("New FAQ has been added!");
            resetFields();
        }

        private void saveFAQ()
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
                conn.Close();
            }
        }

        private void resetFields()
        {
            ddlGroup.SelectedValue = "-";
            txtQuestion.Text = string.Empty;
            txtAnswer.Text = string.Empty;
        }
    }
}