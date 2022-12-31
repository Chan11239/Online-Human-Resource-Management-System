using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using System;
using System.Net;
using System.Net.Mail;
using System.Windows;

namespace OHRMS.Applicants
{
    public partial class Registration : AbstractWebPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                if (checkExistingEmail(txtEmail.Text))
                {
                    this.showMessage("You Have already Registered!");
                    return;
                }
                string activationCode = Guid.NewGuid().ToString().Replace("-", "").Substring(1, 8);
                registerGuestUser(activationCode);
                sendActivationCode(activationCode);
                showMessage("Please see email to complete registrations.");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void sendActivationCode(string activationCode)
        {
            try
            {
                using (MailMessage mm = new MailMessage("manuelchristian885@gmail.com", txtEmail.Text))
                {
                    string urlHost = Request.Url.GetLeftPart(UriPartial.Authority);
                    string body = "Hello " + txtLastName.Text + ", " + txtFirstName.Text + "" +
                                  "<br /><br />Please click the link to activate your account " +
                                  "<br /><a href = '" + urlHost + "/Applicants/RegistrationComplete.aspx?code=" + activationCode + "'>Click here to activate your account.</a>" +
                                  "<br /><br />Thanks";

                    mm.Subject = "Account Activation";
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    mm.From = new MailAddress("manuelchristian885@gmail.com", "STI Baliuag OHRMS");

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;

                    smtp.UseDefaultCredentials = false;
                    NetworkCredential NetworkCred = new NetworkCredential("manuelchristian885@gmail.com", "@stihrdept");
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                }
            }
            catch(Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }

        private void registerGuestUser(string activationCode)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "INSERT INTO Registrations " +
                                   "(firstName, lastName, fullName, email, activationCode, expiryDate) " +
                                   "VALUES " +
                                   "(@firstName, @lastName, @fullName, @email, @activationCode, DATE_ADD(NOW(), INTERVAL 1 DAY))";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@firstName", txtFirstName.Text);
                    command.Parameters.AddWithValue("@lastName", txtLastName.Text);
                    command.Parameters.AddWithValue("@fullName", txtLastName.Text + ", " + txtFirstName.Text);
                    command.Parameters.AddWithValue("@email", txtEmail.Text);
                    command.Parameters.AddWithValue("@activationCode", activationCode);

                    command.ExecuteNonQuery();

                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        private bool checkExistingEmail(string email)
        {
            bool checkResult = false;
            using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
            {
                connection.Open();
                string query = "SELECT email " +
                               "FROM registrations " +
                               "WHERE email = '" + email + "' ";

                MySqlCommand command = new MySqlCommand(query, connection);
                MySqlDataReader dataReader = command.ExecuteReader();
                if (dataReader.HasRows)
                {
                    checkResult = true;
                }
                connection.Close();
            }

            return checkResult;
        }
    }
}