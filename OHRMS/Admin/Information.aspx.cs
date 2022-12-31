using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using System;
using System.Configuration;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OHRMS.Admin
{
    public partial class WebForm3 : AbstractWebPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    hidEmployeeNo.Value = Request.QueryString["id"];
                }
                populateEmployeeDetails();
                populateEmployeeFiles();
                getFamBack();
                //getChildren();
            }
        }

        public void populateEmployeeDetails()
        {
            try
            {
                string pic = null;
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * FROM " +
                                   "details a " +
                                   "INNER JOIN  persons b " +
                                   "ON a.employeeNo = b.employeeNo " +
                                   "WHERE employeeNo='" + hidEmployeeNo.Value + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        lblEmpNum_Profile.Text = reader["employeeNo"].ToString();
                        lblPosition.Text = reader["position"].ToString();
                        lblDepartment.Text = reader["department"].ToString();
                        DateTime d = DateTime.Parse(reader["dateAppointment"].ToString());
                        lblDOA.Text = d.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                        lblRanks.Text = reader["Emp_Rank"].ToString();
                        lblSalary.Text = reader["salaryRate"].ToString();
                        lblStatus.Text = reader["statusOfEmployement"].ToString();

                        lblName_Profile.Text = reader["fullName"].ToString();
                        txtAddress.Text = reader["address"].ToString();
                        txtBirthplace.Text = reader["birthPlace"].ToString();
                        DateTime dt = DateTime.Parse(reader["birthday"].ToString());
                        lblbday.Text = dt.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                        txtCitizenship.Text = reader["citizenship"].ToString();
                        lblContact_Profile.Text = reader["contactNumber"].ToString();
                        lblEmail_Profile.Text = reader["emailAddress"].ToString();
                        txtHeight.Text = reader["height"].ToString();
                        txtWeight.Text = reader["weight"].ToString();
                        txtGender.Text = reader["gender"].ToString();
                        txtReligion.Text = reader["religion"].ToString();
                        txtSSS.Text = reader["sssId"].ToString();
                        txtTin.Text = reader["tinId"].ToString();
                        txtHDMF.Text = reader["hdmfId"].ToString();
                        txtPhilhealth.Text = reader["philHealthId"].ToString();

                        pic = reader["picture"].ToString().Replace("~", "..");
                    }
                    connection.Close();
                    img_Profile.ImageUrl = pic;
                }
            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }

        public void populateEmployeeFiles()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM employeeFiles " +
                                   "WHERE employeeNo = '" + hidEmployeeNo.Value + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        lnkResume.Text = reader["resume"].ToString();
                        lnkTor.Text = reader["tor"].ToString();
                        lnkDiploma.Text = reader["diploma"].ToString();
                        lnkCert.Text = reader["certificate"].ToString();
                        lnkCOE.Text = reader["coe"].ToString();
                        lnkSSS.Text = reader["sssId"].ToString();
                        lnkPhilhealth.Text = reader["philHealthId"].ToString();
                        lnktin.Text = reader["tinId"].ToString();
                        lnkPagibig.Text = reader["pagIbigId"].ToString();
                        lnkMedical.Text = reader["medicalResult"].ToString();
                        lnkHealthCard.Text = reader["healthId"].ToString();
                    }
                }

            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }

        public void getFamBack()
        {
            try
            {
                //string id = Session["ID"].ToString();

                //conn = new MySqlConnection(connstring);
                //string query = "SELECT * FROM Emp_FamilyBackground WHERE Emp_FamID = '" + id.ToString() + "'";

                //conn.Open();
                //cmd = new MySqlCommand(query, conn);
                //cmd.Connection = conn;

                //reader = cmd.ExecuteReader();
                //while (reader.Read())
                //{
                //    txtFatherName.Text = reader["Emp_FatherName"].ToString();
                //    txtFatherAge.Text = reader["Emp_FatherAge"].ToString();
                //    txtFatherOccupation.Text = reader["Emp_FatherOccupation"].ToString();
                //    txtMotherName.Text = reader["Emp_MotherName"].ToString();
                //    txtMotherAge.Text = reader["Emp_MotherAge"].ToString();
                //    txtMotherOccupation.Text = reader["Emp_MotherOccupation"].ToString();
                //    txtSpouseName.Text = reader["Emp_SpouseName"].ToString();
                //    txtSpouseAge.Text = reader["Emp_SpouseAge"].ToString();
                //    txtSpouseOccupation.Text = reader["Emp_SpouseOccupation"].ToString();

                //}
                //conn.Close();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //public void getChildren()
        //{
        //    try
        //    {

        //        MySqlConnection conn = new MySqlConnection(getConnetionStrings);
        //        string query = "Select * from Emp_Children where Emp_ChildID = '" + lblEmpNum_Profile.Text + "'";

        //        MySqlCommand cmd = new MySqlCommand(query, conn);
        //        MySqlDataReader reader = cmd.ExecuteReader();
        //        if (reader.HasRows)
        //        {
        //            HtmlTable.Append("<tr>");
        //            while (reader.Read())
        //            {
        //                HtmlTitle.Append("<td>" +
        //                    "<label>Name</label> " +
        //                    "<br />< label > " + reader["Emp_ChildName"] + " </ label > " +
        //                    "</td>" +
        //                    "<td>" +
        //                    "<label>Age</label> " +
        //                    "<br /> " +
        //                    "<label>" + reader["Emp_ChildAge"] + "</label>" +
        //                    "</td>" +
        //                    "<td>" +
        //                    "<label>Occupation</label> " +
        //                    "<br /> " +
        //                    "<label>" + reader["Emp_ChildOccupation"] + "</label>" +
        //                    "</td>");
        //            }
        //            htmlTable.Append("</tr>");
        //            ph.Controls.Add(new Literal
        //            {
        //                Text = HtmlTable.ToString()
        //            });
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }
        //}

        //protected void btnshwEmp_Info_Click(object sender, EventArgs e)
        //{
        //    Emp_Info.Visible = true;
        //    personal_info.Visible = false;
        //    files.Visible = false;
        //}

        //protected void btnshwdetials_Click(object sender, EventArgs e)
        //{
        //    Emp_Info.Visible = false;
        //    personal_info.Visible = true;
        //    files.Visible = false;
        //}

        //protected void btnshwfiles_Click(object sender, EventArgs e)
        //{
        //    Emp_Info.Visible = false;
        //    personal_info.Visible = false;
        //    files.Visible = true;
        //}

        protected void lnkResume_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/";

            Session["file"] = newpath + lnkResume.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkTor_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/";

            Session["file"] = newpath + lnkTor.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkDiploma_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/";

            Session["file"] = newpath + lnkDiploma.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkCert_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/Certificate/";

            Session["file"] = newpath + lnkCert.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkCOE_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/";

            Session["file"] = newpath + lnkCOE.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnktin_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/";

            Session["file"] = newpath + lnktin.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkPagibig_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/";

            Session["file"] = newpath + lnkPagibig.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkMedical_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/";

            Session["file"] = newpath + lnkMedical.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkHealthCard_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/";

            Session["file"] = newpath + lnkHealthCard.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkSSS_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/";

            Session["file"] = newpath + lnkSSS.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void lnkPhilhealth_Click(object sender, EventArgs e)
        {
            string newpath = "~/EmployeeFiles/" + lblEmpNum_Profile.Text + "/";

            Session["file"] = newpath + lnkPhilhealth.Text;

            string URL = ResolveClientUrl("~") + "/Show.aspx";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
            "shwwindow('" + URL + "');", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Update Personal Information Tab
            try
            {
                //conn = new MySqlConnection(connstring);
                //string query = "UPDATE Emp_PersonalInfo SET " +
                //    "Emp_Address=@address, Emp_Birthplace=@birthpalce, Emp_Citizenship=@citizenship, Emp_Religion=@religion, Emp_Gender=@gender, " +
                //    "Emp_Height=@height, Emp_Weight=@weight, Emp_Tin=@tin, Emp_SSS=@sss, Emp_Philhealth=@philhealth, Emp_HDMF=@hdmf " +
                //    "WHERE Emp_PerosnalID='" + lblEmpNum_Profile.Text + "'";

                //conn.Open();
                //cmd = new MySqlCommand(query, conn);


                //cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                //cmd.Parameters.AddWithValue("@birthpalce", txtBirthplace.Text);
                //cmd.Parameters.AddWithValue("@citizenship", txtCitizenship.Text);
                //cmd.Parameters.AddWithValue("@religion", txtReligion.Text);
                //cmd.Parameters.AddWithValue("@gender", txtGender.Text);
                //cmd.Parameters.AddWithValue("@height", txtHeight.Text);
                //cmd.Parameters.AddWithValue("@weight", txtWeight.Text);
                //cmd.Parameters.AddWithValue("@tin", txtTin.Text);
                //cmd.Parameters.AddWithValue("@sss", txtSSS.Text);
                //cmd.Parameters.AddWithValue("@philhealth", txtPhilhealth.Text);
                //cmd.Parameters.AddWithValue("@hdmf", txtHDMF.Text);

                //cmd.ExecuteNonQuery();
                //conn.Close();
                //MessageBox.Show("Information Updated!");
                //getData();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //Personal Info Tab
            txtAddress.Enabled = true;
            txtBirthplace.Enabled = true;
            txtCitizenship.Enabled = true;
            txtSSS.Enabled = true;
            txtPhilhealth.Enabled = true;
            txtTin.Enabled = true;
            txtHDMF.Enabled = true;
            txtGender.Enabled = true;
            txtHeight.Enabled = true;
            txtWeight.Enabled = true;
            txtReligion.Enabled = true;
        }
    }
}