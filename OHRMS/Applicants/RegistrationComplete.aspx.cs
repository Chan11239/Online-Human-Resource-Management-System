using MySql.Data.MySqlClient;
using OHRMS.Models;
using System;
using System.Configuration;

namespace OHRMS.Applicants
{
    public partial class RegistrationComplete : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var code = Request.QueryString["code"];
                if (code != null)
                {
                    this.processUserRegistration(code);
                }
                else
                {
                    lnkLogIn.Visible = false;
                    lnkRegistration.Visible = true;
                }
            }
            
        }

        private void processUserRegistration(string code)
        {
            try
            {

                RegistrationProfile profile = this.checkRegistedApplicant(code);
                if (profile != null)
                {
                    this.registerUser(profile);
                    lblTitle.Text = profile.LastName + ", " + profile.FirstName;
                    lblMessage.Text = "You have successfully registered to our system. Please click then login link to continue.";
                    lnkRegistration.Visible = false;
                    lnkLogIn.Visible = true;


                }
            }
            catch (Exception)
            {
                lblTitle.Text = "System Notification";
                lblMessage.Text = "Encounter an error while process your registration code verification. Please contact administrator.";
                lnkLogIn.Visible = false;
            }
        }

        private RegistrationProfile registerUser(RegistrationProfile profile)
        {
            string query = string.Empty;
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    query = "UPDATE Registrations " +
                            "SET isActivate = 1 " +
                            "WHERE id = " + profile.id;
                    MySqlCommand commandRegistration = new MySqlCommand(query, connection);
                    commandRegistration.ExecuteNonQuery();
                    
                    connection.Close();
                }

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {

                    connection.Open();
                    query = "INSERT INTO Users " +
                            "(userName, password, userType, firstName, lastName) " +
                            "VALUES " +
                            "(@userName, @password, @userType, @firstName, @lastName)";
                    MySqlCommand commandUser = new MySqlCommand(query, connection);
                    commandUser.Parameters.AddWithValue("@userName", profile.Email);
                    commandUser.Parameters.AddWithValue("@password", string.Empty);
                    commandUser.Parameters.AddWithValue("@userType", "APPLICANT");
                    commandUser.Parameters.AddWithValue("@firstName", profile.FirstName);
                    commandUser.Parameters.AddWithValue("@lastName", profile.LastName);
                    commandUser.ExecuteNonQuery();

                    connection.Close();
                }

                return profile;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private RegistrationProfile checkRegistedApplicant(string activationCode)
        {
            RegistrationProfile profile = new RegistrationProfile();
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT id, firstName, lastName, email, isActivate, IF(expiryDate >= CAST(NOW() AS DATE), 0, 1) isExpired " +
                                   "FROM Registrations " +
                                   "WHERE activationCode = '" + activationCode + "' ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        while (dataReader.Read())
                        {
                            profile.id = int.Parse(dataReader["id"].ToString());
                            profile.FirstName = dataReader["firstName"].ToString();
                            profile.LastName = dataReader["lastName"].ToString();
                            profile.Email = dataReader["email"].ToString();
                            profile.isActivate = dataReader["isActivate"].ToString() == "0" ? false: true;
                            profile.isExpired = dataReader["isExpired"].ToString() == "0" ? false : true;
                        }
                    }
                    connection.Close();
                }

                if (profile == null)
                {
                    lblTitle.Text = "System Notification";
                    lblMessage.Text = "Invalid registration code. Please contact administrator.";
                    lnkLogIn.Visible = false;
                    lnkRegistration.Visible = true;
                } 
                else
                {
                    if(profile.isActivate == true)
                    {
                        lblTitle.Text = profile.LastName + ", " + profile.FirstName;
                        lblMessage.Text = "Your activation code is already been used.";
                        lnkLogIn.Visible = false;
                        lnkRegistration.Visible = true;
                        return null;
                    }

                    if (profile.isExpired == true)
                    {
                        lblTitle.Text = profile.LastName + ", " + profile.FirstName;
                        lblMessage.Text = "Your activation code is has already expired.";
                        lnkLogIn.Visible = false;
                        lnkRegistration.Visible = true;
                        return null;
                    }
                }

                return profile;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}