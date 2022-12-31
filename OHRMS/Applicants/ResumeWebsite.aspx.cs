using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Models;
using OHRMS.Services;
using System;
using System.Data;

namespace OHRMS.Applicants
{
    public partial class ResumeWebsite : AbstractWebPage
    {
        private WebHelperControllerService webHelper = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateInformation();
                populateWork();
                populateEducationalBackground();
                populatePersons();
            }
        }
        private void populatePersons()
        {
            string fullNamePersons = txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddlename.Text;
            string queryPerson = "SELECT address, contactNumber " +
                                 "FROM persons " +
                                 "WHERE fullName = '" + fullNamePersons + "' ";
            DataRow drPersons = webHelper.getByDataRow(queryPerson);
            if (drPersons != null)
            {
                txtAddress.Text = drPersons["address"].ToString();
                txtContactNumber.Text = drPersons["contactNumber"].ToString();
            }
        }
        private void populateInformation()
        {
            LoginProfile profile = this.getUserProfile();
            string fullName = profile.LastName + ", " + profile.FirstName;
            string query = "SELECT * " +
                           "FROM registrations " +
                           "WHERE fullName = '" + fullName + "' ";
            DataRow drInfo = webHelper.getByDataRow(query);
            if (drInfo != null)
            {
                txtFirstName.Text = drInfo["firstName"].ToString();
                txtLastName.Text = drInfo["lastName"].ToString();
                txtEmailAddress.Text = drInfo["email"].ToString();
                txtMiddlename.Text = drInfo["middleName"].ToString();
            }
        }

        private void populateWork()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT id, company, position, inclusiveDates, natureOfSeparation " +
                                   "FROM workExperience " +
                                   "WHERE employeeId = 'APPLICANT' ";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);

                    gvWorkExperience.DataSource = dataSet;
                    gvWorkExperience.DataBind();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                Console.Error.Write(ex.Message);
            }
        }
        private void populateEducationalBackground()
        {
            string fullName = txtLastName.Text + ", " + txtFirstName.Text;
            string query = "SELECT * " +
                           "FROM educationalBackground " +
                           "WHERE employeeId = 'APPLICANT' " +
                           "AND fullName = '" + fullName + "' ";
            DataRow drEducactionalBackground = webHelper.getByDataRow(query);
            if (drEducactionalBackground != null)
            {
                txtNameElem.Text = drEducactionalBackground["elementaryName"].ToString();
                txtCourseElem.Text = drEducactionalBackground["elementaryCourse"].ToString();
                txtDatesElem.Text = drEducactionalBackground["elementaryDate"].ToString();
                txtAwardsElem.Text = drEducactionalBackground["elementaryAward"].ToString();
                txtSecondaryName.Text = drEducactionalBackground["highSchoolName"].ToString();
                txtSecondaryCourse.Text = drEducactionalBackground["highSchoolCourse"].ToString();
                txtSecondaryDates.Text = drEducactionalBackground["highSchoolDate"].ToString();
                txtSecondaryAwards.Text = drEducactionalBackground["highSchoolAward"].ToString();
                txtBachelorName.Text = drEducactionalBackground["bachelorsName"].ToString();
                txtBachelorCourse.Text = drEducactionalBackground["bachelorsCourse"].ToString();
                txtBachelorDates.Text = drEducactionalBackground["bachelorsDate"].ToString();
                txtBachelorAwards.Text = drEducactionalBackground["bachelorsAward"].ToString();
            }
        }
        private void updateRegistration()
        {
            try
            {
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + ", " + profile.FirstName;
                using (MySqlConnection con = new MySqlConnection(getConnetionStrings))
                {
                    string query = "UPDATE registrations " +
                                   "SET middleName=@middleName " +
                                   "WHERE fullName=@name";
                    using (MySqlCommand cmd = new MySqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@name", fullName);
                        cmd.Parameters.AddWithValue("@middleName", txtMiddlename.Text);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        private void updateUsers()
        {
            try
            {
                LoginProfile profile = this.getUserProfile();
                string fullName = profile.LastName + ", " + profile.FirstName;
                using (MySqlConnection con = new MySqlConnection(getConnetionStrings))
                {
                    string query = "UPDATE users " +
                                   "SET middleName=@middleName " +
                                   "WHERE firstName=@firstName " +
                                   "AND lastName=@lastName " +
                                   "AND userType='APPLICANT' ";
                    using (MySqlCommand cmd = new MySqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@firstName", profile.FirstName);
                        cmd.Parameters.AddWithValue("@lastName", profile.LastName);
                        cmd.Parameters.AddWithValue("@middleName", txtMiddlename.Text);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        private void insertInformation()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(getConnetionStrings))
                {
                    string query = "INSERT INTO persons " +
                                   "(employeeNo, fullName, address, contactNumber, emailAddress)" +
                                   "VALUES " +
                                   "(@employeeNo, @fullName, @address, @contactNumber, @emailAddress)";
                    using (MySqlCommand cmd = new MySqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@employeeNo", "APPLICANT");
                        cmd.Parameters.AddWithValue("@fullName", txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddlename.Text);
                        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@contactNumber", txtContactNumber.Text);
                        cmd.Parameters.AddWithValue("@emailAddress", txtEmailAddress.Text);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        updateRegistration();
                        updateUsers();
                    }
                }
                this.showMessage("Add Information!");
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        protected void btnAddWorkExperience_Click(object sender, EventArgs e)
        {
            mpeWorkExperience.Show();
        }

        protected void lnkDelete_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            try
            {
                var id = e.CommandArgument;
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "DELETE FROM workExperience " +
                                   "WHERE id = @id ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@id", id);

                    command.ExecuteNonQuery();
                    connection.Close();
                }
                populateWork();
                this.showMessage("Work Experience Deleted");
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }

        protected void btnSubmitWork_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(getConnetionStrings))
                {
                    string query = "INSERT INTO workExperience " +
                                   "(employeeId, fullName, company, position, inclusiveDates, natureOfSeparation)" +
                                   "VALUES " +
                                   "(@employeeId, @fullName, @company, @position, @date, @separation)";
                    using (MySqlCommand cmd = new MySqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@employeeId", "APPLICANT");
                        cmd.Parameters.AddWithValue("@company", txtCompany.Text);
                        cmd.Parameters.AddWithValue("@fullName", txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddlename.Text);
                        cmd.Parameters.AddWithValue("@position", txtPosition.Text);
                        cmd.Parameters.AddWithValue("@date", txtInclusiveDate.Text);
                        cmd.Parameters.AddWithValue("@separation", txtSeparation.Text);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                this.showMessage("Add Work Experience!");
            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            insertInformation();
            this.showMessage("Information Save!!");
        }

        protected void btnUpdateEduc_Click(object sender, EventArgs e)
        {
            try
            {
                bool updateMode = false;
                string fullName = txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddlename.Text;
                string chkquery = "SELECT fullName " +
                               "FROM educationalbackground " +
                               "WHERE fullName = '" + fullName + "' ";
                DataRow drPersonSearch = webHelper.getByDataRow(chkquery);
                if (drPersonSearch != null)
                {
                    updateMode = true;
                }
                else
                {
                    updateMode = false;
                }
                if (updateMode == false)
                {
                    using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                    {
                        connection.Open();
                        string query = "INSERT INTO educationalBackground " +
                                       "(employeeId, fullName, elementaryName, elementaryCourse, elementaryDate, elementaryAward, " +
                                       "highSchoolName, highSchoolCourse, highSchoolDate, highSchoolAward, " +
                                       "bachelorsName, bachelorsCourse, bachelorsDate, bachelorsAward) " +
                                       "VALUES " +
                                       "(@employeeNo, @fullName, @elemName, @elemCourse, @elemDate, @elemAward, " +
                                       "@hsName, @hsCourse, @hsDate, @hsAward, " +
                                       "@bachelorName, @bachelorCourse, @bachelorDate, @bachelorAward)";
                        MySqlCommand command = new MySqlCommand(query, connection);

                        command.Parameters.AddWithValue("@employeeNo", "APPLICANT");
                        command.Parameters.AddWithValue("@fullName", txtLastName.Text + ", " + txtFirstName.Text + " " + txtMiddlename.Text);
                        command.Parameters.AddWithValue("@elemName", txtNameElem.Text);
                        command.Parameters.AddWithValue("@elemCourse", txtCourseElem.Text);
                        command.Parameters.AddWithValue("@elemDate", txtDatesElem.Text);
                        command.Parameters.AddWithValue("@elemAward", txtAwardsElem.Text);
                        command.Parameters.AddWithValue("@hsName", txtSecondaryName.Text);
                        command.Parameters.AddWithValue("@hsCourse", txtSecondaryCourse.Text);
                        command.Parameters.AddWithValue("@hsDate", txtSecondaryDates.Text);
                        command.Parameters.AddWithValue("@hsAward", txtSecondaryAwards.Text);
                        command.Parameters.AddWithValue("@bachelorName", txtBachelorName.Text);
                        command.Parameters.AddWithValue("@bachelorCourse", txtBachelorCourse.Text);
                        command.Parameters.AddWithValue("@bachelorDate", txtBachelorDates.Text);
                        command.Parameters.AddWithValue("@bachelorAward", txtBachelorAwards.Text);

                        command.ExecuteNonQuery();
                        connection.Close();
                        this.showMessage("Educational Background Save!");
                    }
                }
                else
                {
                    using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                    {
                        connection.Open();
                        string query = "UPDATE educationalBackground " +
                                       "SET elementaryName = @elemName, elementaryCourse = @elemCourse, elementaryDate = @elemDate, elementaryAward = @elemAward, " +
                                       "highSchoolName = @hsName, highSchoolCourse = @hsCourse, highSchoolDate = @hsDate, highSchoolAward = @hsAward, " +
                                       "bachelorsName = @bachelorName, bachelorsCourse = @bachelorCourse, bachelorsDate = @bachelorDate, bachelorsAward = @bachelorAward " +
                                       "WHERE fullName='" + fullName + "'";
                        MySqlCommand command = new MySqlCommand(query, connection);

                        //command.Parameters.AddWithValue("@employeeNo", employeeNo);
                        command.Parameters.AddWithValue("@elemName", txtNameElem.Text);
                        command.Parameters.AddWithValue("@elemCourse", txtCourseElem.Text);
                        command.Parameters.AddWithValue("@elemDate", txtDatesElem.Text);
                        command.Parameters.AddWithValue("@elemAward", txtAwardsElem.Text);
                        command.Parameters.AddWithValue("@hsName", txtSecondaryName.Text);
                        command.Parameters.AddWithValue("@hsCourse", txtSecondaryCourse.Text);
                        command.Parameters.AddWithValue("@hsDate", txtSecondaryDates.Text);
                        command.Parameters.AddWithValue("@hsAward", txtSecondaryAwards.Text);
                        command.Parameters.AddWithValue("@bachelorName", txtBachelorName.Text);
                        command.Parameters.AddWithValue("@bachelorCourse", txtBachelorCourse.Text);
                        command.Parameters.AddWithValue("@bachelorDate", txtBachelorDates.Text);
                        command.Parameters.AddWithValue("@bachelorAward", txtBachelorAwards.Text);

                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
    }
}