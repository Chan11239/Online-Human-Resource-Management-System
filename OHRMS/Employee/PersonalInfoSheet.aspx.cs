using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Windows;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Globalization;
using OHRMS.Helpers;
using OHRMS.Models;
using System.Data;
using OHRMS.Services;

namespace OHRMS
{
    public partial class WebForm4 : AbstractWebPage
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoginProfile profile = getUserProfile();

                pnlEmp_INfo.Enabled = false;
                populateDetails(profile.UserName);
                populatePersons(profile.UserName);
                populateFamilyInfo(profile.UserName);
                populateChildren(profile.UserName);
                populateEducBG(profile.UserName);
                populateEligibilities(profile.UserName);
                populateCertsTrainings(profile.UserName);
                populateSeminar(profile.UserName);
                populateWork(profile.UserName);
            }

            // TODO : Change code add textbox
            AddAndRemoveDynamicControls();
            SemAddAndRemoveDynamicControls();
            WorkAddAndRemoveDynamicControls();
            ChildAddAndRemoveDynamicControls();
            eligibilityAddAndRemoveDynamicControls();
        }

       
        public Control GetPostBackControl(Page page)
        {
            Control control = null;

            string ctrlname = page.Request.Params.Get("__EVENTTARGET");
            if ((ctrlname != null) & ctrlname != string.Empty)
            {
                control = page.FindControl(ctrlname);
            }
            else
            {
                foreach (string ctl in page.Request.Form)
                {
                    Control c = page.FindControl(ctl);
                    if (c is System.Web.UI.WebControls.Button)
                    {
                        control = c;
                        break;
                    }
                }
            }
            return control;
        }
        private void AddAndRemoveDynamicControls()
        {
            Control c = GetPostBackControl(Page);

            if ((c != null))
            {
                if (c.ID.ToString() == "btnAdd")
                {
                    ltlCount.Text = (Convert.ToInt16(ltlCount.Text) + 1).ToString();
                }
            }

            ph1.Controls.Clear();

            int ControlID = 0;

            for (int i = 0; i <= (Convert.ToInt16(ltlCount.Text) - 1); i++)
            {
                UserControl DynamicControl = (UserControl)LoadControl("~/Cert.ascx");

                DynamicControl.ID = "uc1" + ControlID;

                ph1.Controls.Add(DynamicControl);

                ControlID += 1;
            }
        }
        

        public void insertCert()
        {
            foreach (Control c in ph1.Controls)
            {
                if (c.GetType().Name.ToLower() == "cert_ascx")
                {
                    UserControl uc = (UserControl)c;
                    TextBox tbCert = uc.FindControl("txtCert_PIS") as TextBox;
                    TextBox tbInstitution = uc.FindControl("txtInstitution_PIS") as TextBox;
                    TextBox tbDate = uc.FindControl("txtCertDate_PIS") as TextBox;
                    if (!string.IsNullOrEmpty(tbInstitution.Text.Trim()) && !string.IsNullOrEmpty(tbCert.Text.Trim()) && !string.IsNullOrEmpty(tbDate.Text.Trim()))
                    {
                        Insert(txtEmpID_PIS.Text, tbCert.Text.Trim(), tbDate.Text.Trim(), tbInstitution.Text.Trim());
                    }
                }
            }
        }
        private void Insert(string id, string cert, string date, string intitute)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "INSERT INTO certificates " +
                        "(employeeId, typeCertification, institution, inclusiveDates)" +
                        "VALUES " +
                        "(@id, @name, @institute, @date)";
                    using (MySqlCommand cmd = new MySqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@name", cert);
                        cmd.Parameters.AddWithValue("@institute", intitute);
                        cmd.Parameters.AddWithValue("@date", date);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        string message = "New Certification/Training Added.";
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }
        //Seminar
        public Control SeminarGetPostBackControl(Page page)
        {
            Control control = null;

            string ctrlname = page.Request.Params.Get("__EVENTTARGET");
            if ((ctrlname != null) & ctrlname != string.Empty)
            {
                control = page.FindControl(ctrlname);
            }
            else
            {
                foreach (string ctl in page.Request.Form)
                {
                    Control c = page.FindControl(ctl);
                    if (c is System.Web.UI.WebControls.Button)
                    {
                        control = c;
                        break;
                    }
                }
            }
            return control;
        }
        private void SemAddAndRemoveDynamicControls()
        {
            //Determine which control fired the postback event. 
            Control c = SeminarGetPostBackControl(Page);

            if ((c != null))
            {
                //If the add button was clicked, increase the count to let the page know we want to display an additional user control
                if (c.ID.ToString() == "btnAddSeminar")
                {
                    ltlCountSem.Text = (Convert.ToInt16(ltlCountSem.Text) + 1).ToString();
                }
            }

            //Be sure everything in the placeholder control is cleared out
            phSeminar.Controls.Clear();

            int ControlID = 0;

            //Since these are dynamic user controls, re-add them every time the page loads.
            for (int i = 0; i <= (Convert.ToInt16(ltlCountSem.Text) - 1); i++)
            {
                UserControl DynamicControl = (UserControl)LoadControl("~/Seminar.ascx");

                //If this particular control id has been deleted from the page, DO NOT use it again.  If we do, it will
                //pick up the viewstate data from the old item that had this control id, instead of generating
                //a completely new control.  Instead, increment the control id so we're guaranteed to get a "new"
                //control that doesn't have any lingering information in the viewstate.       

                //Note that if the item has not been deleted from the page, we DO want it to use the same control id
                //as it used before, so it will automatically maintain the viewstate information of the user control
                //for us.
                DynamicControl.ID = "uc2" + ControlID;

                //Add an event handler to this control to raise an event when the delete button is clicked
                //on the user control
                //DynamicControl.RemoveUserControl += this.HandleRemoveUserControl;

                //Finally, add the user control to the panel
                phSeminar.Controls.Add(DynamicControl);

                //Increment the control id for the next round through the loop
                ControlID += 1;
            }
        }
      
        public void insertSeminar()
        {
            foreach (Control c in phSeminar.Controls)
            {
                //Find the specific user control that we added to this placeholder, and then get the selected values
                //for the dropdownlist, checkbox, and textbox and print them to the screen.
                if (c.GetType().Name.ToLower() == "seminar_ascx")
                {
                    UserControl uc = (UserControl)c;
                    TextBox tbSeminar = uc.FindControl("txtName_Seminar") as TextBox;
                    TextBox tbInstitution = uc.FindControl("txtInstitution_Seminar") as TextBox;
                    TextBox tbDate = uc.FindControl("txtSeminar_Date") as TextBox;
                    if (!string.IsNullOrEmpty(tbInstitution.Text.Trim()) && !string.IsNullOrEmpty(tbSeminar.Text.Trim()) && !string.IsNullOrEmpty(tbDate.Text.Trim()))
                    {
                        InsertSem(txtEmpID_PIS.Text, tbSeminar.Text.Trim(), tbDate.Text.Trim(), tbInstitution.Text.Trim());
                    }
                }
            }
        }
        private void InsertSem(string id, string cert, string date, string intitute)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "INSERT INTO seminar " +
                                   "(employeeId, typeSeminar, institution, inclusiveDates)" +
                                   "VALUES " +
                                   "(@id, @name, @institute, @date)";
                    using (MySqlCommand cmd = new MySqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@name", cert);
                        cmd.Parameters.AddWithValue("@institute", intitute);
                        cmd.Parameters.AddWithValue("@date", date);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        string message = "New Seminar Added.";
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }

        //Work Experience
        public Control WorkGetPostBackControl(Page page)
        {
            Control control = null;

            string ctrlname = page.Request.Params.Get("__EVENTTARGET");
            if ((ctrlname != null) & ctrlname != string.Empty)
            {
                control = page.FindControl(ctrlname);
            }
            else
            {
                foreach (string ctl in page.Request.Form)
                {
                    Control c = page.FindControl(ctl);
                    if (c is System.Web.UI.WebControls.Button)
                    {
                        control = c;
                        break;
                    }
                }
            }
            return control;
        }
        private void WorkAddAndRemoveDynamicControls()
        {
            //Determine which control fired the postback event. 
            Control c = WorkGetPostBackControl(Page);

            if ((c != null))
            {
                //If the add button was clicked, increase the count to let the page know we want to display an additional user control
                if (c.ID.ToString() == "btnAddWork")
                {
                    ltlCountWork.Text = (Convert.ToInt16(ltlCountWork.Text) + 1).ToString();
                }
            }

            //Be sure everything in the placeholder control is cleared out
            phWork.Controls.Clear();

            int ControlID = 0;

            //Since these are dynamic user controls, re-add them every time the page loads.
            for (int i = 0; i <= (Convert.ToInt16(ltlCountWork.Text) - 1); i++)
            {
                UserControl DynamicControl = (UserControl)LoadControl("~/Work.ascx");

                //If this particular control id has been deleted from the page, DO NOT use it again.  If we do, it will
                //pick up the viewstate data from the old item that had this control id, instead of generating
                //a completely new control.  Instead, increment the control id so we're guaranteed to get a "new"
                //control that doesn't have any lingering information in the viewstate.           
                
                //Note that if the item has not been deleted from the page, we DO want it to use the same control id
                //as it used before, so it will automatically maintain the viewstate information of the user control
                //for us.
                DynamicControl.ID = "uc3" + ControlID;

                //Add an event handler to this control to raise an event when the delete button is clicked
                //on the user control
                //DynamicControl.RemoveUserControl += this.HandleRemoveUserControl;

                //Finally, add the user control to the panel
                phWork.Controls.Add(DynamicControl);

                //Increment the control id for the next round through the loop
                ControlID += 1;
            }
        }
        
        public void insertWork()
        {
            foreach (Control c in phWork.Controls)
            {
                //Find the specific user control that we added to this placeholder, and then get the selected values
                //for the dropdownlist, checkbox, and textbox and print them to the screen.
                if (c.GetType().Name.ToLower() == "work_ascx")
                {
                    UserControl uc = (UserControl)c;
                    TextBox tbCompany = uc.FindControl("txtCompany") as TextBox;
                    TextBox tbPosition = uc.FindControl("txtPosition") as TextBox;
                    TextBox tbDate = uc.FindControl("txtDateWork") as TextBox;
                    TextBox tbSeparation = uc.FindControl("txtNatureSeparation") as TextBox;
                    if (!string.IsNullOrEmpty(tbCompany.Text.Trim()) && !string.IsNullOrEmpty(tbPosition.Text.Trim()) && !string.IsNullOrEmpty(tbDate.Text.Trim()) && !string.IsNullOrEmpty(tbSeparation.Text.Trim()))
                    {
                        InsertWork(txtEmpID_PIS.Text, tbCompany.Text.Trim(), tbPosition.Text.Trim(), tbDate.Text.Trim(), tbSeparation.Text.Trim());
                    }
                }
            }
        }
        private void InsertWork(string id, string company, string position, string date, string separation)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "INSERT INTO workExperience " +
                                   "(employeeId, company, position, inclusiveDates, natureOfSeparation)" +
                                   "VALUES " +
                                   "(@id, @company, @position, @date, @separation)";
                    using (MySqlCommand cmd = new MySqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@company", company);
                        cmd.Parameters.AddWithValue("@position", position);
                        cmd.Parameters.AddWithValue("@date", date);
                        cmd.Parameters.AddWithValue("@separation", separation);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        string message = "New Work Experience Added.";
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }

        //insert Children
        public Control ChildrenGetPostBackControl(Page page)
        {
            Control control = null;

            string ctrlname = page.Request.Params.Get("__EVENTTARGET");
            if ((ctrlname != null) & ctrlname != string.Empty)
            {
                control = page.FindControl(ctrlname);
            }
            else
            {
                foreach (string ctl in page.Request.Form)
                {
                    Control c = page.FindControl(ctl);
                    if (c is System.Web.UI.WebControls.Button)
                    {
                        control = c;
                        break;
                    }
                }
            }
            return control;
        }
        private void ChildAddAndRemoveDynamicControls()
        {
            //Determine which control fired the postback event. 
            Control c = ChildrenGetPostBackControl(Page);

            if ((c != null))
            {
                //If the add button was clicked, increase the count to let the page know we want to display an additional user control
                if (c.ID.ToString() == "btnAddChild")
                {
                    ltlCountChild.Text = (Convert.ToInt16(ltlCountChild.Text) + 1).ToString();
                }
            }

            //Be sure everything in the placeholder control is cleared out
            phchild.Controls.Clear();

            int ControlID = 0;

            //Since these are dynamic user controls, re-add them every time the page loads.
            for (int i = 0; i <= (Convert.ToInt16(ltlCountChild.Text) - 1); i++)
            {
                UserControl DynamicControl = (UserControl)LoadControl("~/Children.ascx");

                //If this particular control id has been deleted from the page, DO NOT use it again.  If we do, it will
                //pick up the viewstate data from the old item that had this control id, instead of generating
                //a completely new control.  Instead, increment the control id so we're guaranteed to get a "new"
                //control that doesn't have any lingering information in the viewstate.           

                //Note that if the item has not been deleted from the page, we DO want it to use the same control id
                //as it used before, so it will automatically maintain the viewstate information of the user control
                //for us.
                DynamicControl.ID = "uc4" + ControlID;

                //Add an event handler to this control to raise an event when the delete button is clicked
                //on the user control
                //DynamicControl.RemoveUserControl += this.HandleRemoveUserControl;

                //Finally, add the user control to the panel
                phchild.Controls.Add(DynamicControl);

                //Increment the control id for the next round through the loop
                ControlID += 1;
            }
        }

        public void insertChild()
        {
            foreach (Control c in phchild.Controls)
            {
                //Find the specific user control that we added to this placeholder, and then get the selected values
                //for the dropdownlist, checkbox, and textbox and print them to the screen.
                if (c.GetType().Name.ToLower() == "children_ascx")
                {
                    UserControl uc = (UserControl)c;
                    TextBox tbName = uc.FindControl("txtChildrenName") as TextBox;
                    TextBox tbAge = uc.FindControl("txtChildrenAge") as TextBox;
                    TextBox tbOccu = uc.FindControl("txtChildrenOccupaion") as TextBox;
                    Button btnSvChild = uc.FindControl("btnSaveChild") as Button;
                    if (!string.IsNullOrEmpty(tbName.Text.Trim()) && !string.IsNullOrEmpty(tbAge.Text.Trim()) && !string.IsNullOrEmpty(tbOccu.Text.Trim()))
                    {
                        InsertChild(txtEmpID_PIS.Text, tbName.Text.Trim(), tbAge.Text.Trim(), tbOccu.Text.Trim());
                    }
                }
            }
        }
        private void InsertChild(string id, string name, string age, string occu)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "INSERT INTO children " +
                                   "(employeeId, childrenName, childrenAge, childrenOccupation)" +
                                   "VALUES " +
                                   "(@id, @name, @age, @occu)";
                    using (MySqlCommand cmd = new MySqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@age", age);
                        cmd.Parameters.AddWithValue("@occu", occu);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }

        //eligibility
        public Control eligibilityGetPostBackControl(Page page)
        {
            Control control = null;

            string ctrlname = page.Request.Params.Get("__EVENTTARGET");
            if ((ctrlname != null) & ctrlname != string.Empty)
            {
                control = page.FindControl(ctrlname);
            }
            else
            {
                foreach (string ctl in page.Request.Form)
                {
                    Control c = page.FindControl(ctl);
                    if (c is System.Web.UI.WebControls.Button)
                    {
                        control = c;
                        break;
                    }
                }
            }
            return control;
        }
        private void eligibilityAddAndRemoveDynamicControls()
        {
            //Determine which control fired the postback event. 
            Control c = eligibilityGetPostBackControl(Page);

            if ((c != null))
            {
                //If the add button was clicked, increase the count to let the page know we want to display an additional user control
                if (c.ID.ToString() == "btnAddEligibility")
                {
                    ltlCountEligibility.Text = (Convert.ToInt16(ltlCountEligibility.Text) + 1).ToString();
                }
            }

            //Be sure everything in the placeholder control is cleared out
            phEligibility.Controls.Clear();

            int ControlID = 0;

            //Since these are dynamic user controls, re-add them every time the page loads.
            for (int i = 0; i <= (Convert.ToInt16(ltlCountEligibility.Text) - 1); i++)
            {
                UserControl DynamicControl = (UserControl)LoadControl("~/Eligibility.ascx");

                //If this particular control id has been deleted from the page, DO NOT use it again.  If we do, it will
                //pick up the viewstate data from the old item that had this control id, instead of generating
                //a completely new control.  Instead, increment the control id so we're guaranteed to get a "new"
                //control that doesn't have any lingering information in the viewstate.           
               

                //Note that if the item has not been deleted from the page, we DO want it to use the same control id
                //as it used before, so it will automatically maintain the viewstate information of the user control
                //for us.
                DynamicControl.ID = "uc" + ControlID;

                //Add an event handler to this control to raise an event when the delete button is clicked
                //on the user control
                //DynamicControl.RemoveUserControl += this.HandleRemoveUserControl;

                //Finally, add the user control to the panel
                phEligibility.Controls.Add(DynamicControl);

                //Increment the control id for the next round through the loop
                ControlID += 1;
            }
        }
        public void insertEligibility()
        {
            foreach (Control c in phEligibility.Controls)
            {
                //Find the specific user control that we added to this placeholder, and then get the selected values
                //for the dropdownlist, checkbox, and textbox and print them to the screen.
                if (c.GetType().Name.ToLower() == "eligibility_ascx")
                {
                    UserControl uc = (UserControl)c;
                    TextBox tbLicType = uc.FindControl("txtLicType") as TextBox;
                    TextBox tbLicNo = uc.FindControl("txtLicNo") as TextBox;
                    TextBox tbValidity = uc.FindControl("txtValidity") as TextBox;
                    if (!string.IsNullOrEmpty(tbLicType.Text.Trim()) && !string.IsNullOrEmpty(tbLicNo.Text.Trim()) && !string.IsNullOrEmpty(tbValidity.Text.Trim()))
                    {
                        insertEligibility(txtEmpID_PIS.Text, tbLicType.Text.Trim(), tbLicNo.Text.Trim(), tbValidity.Text.Trim());
                    }
                }
            }
        }
        private void insertEligibility(string id, string type, string licenseNo, string dateValid)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "INSERT INTO eligibility " +
                                   "(employeeId, typeLicense, licenseNo, dateValid) " +
                                   "VALUES " +
                                   "(@employeeNo, @txtLicType, @txtLicNo, @dateValid)";
                    using (MySqlCommand command = new MySqlCommand(query))
                    {
                        command.Connection = con;
                        command.Parameters.AddWithValue("@employeeNo", id);
                        command.Parameters.AddWithValue("@txtLicType", type);
                        command.Parameters.AddWithValue("@txtLicNo", licenseNo);
                        command.Parameters.AddWithValue("@dateValid", dateValid);

                        con.Open();
                        command.ExecuteNonQuery();
                        con.Close();
                        string message = "New Eligibility Added.";
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                this.showMessage(ex.Message);
            }
        }
        //display Employee Information
        private void populateDetails(string employeeNo)
        {

            string query = "SELECT * " +
                           "FROM employeeDetails " +
                           "WHERE employeeNo='" + employeeNo + "'";

            DataRow drEmployeeDetail = webHelperService.getByDataRow(query);
            if (drEmployeeDetail != null)
            {
                txtEmpID_PIS.Text = drEmployeeDetail["employeeNo"].ToString();
                txtDepartment_PIS.Text = drEmployeeDetail["department"].ToString();
                txtPosition_PIS.Text = drEmployeeDetail["position"].ToString();
                txtClassification_PIS.Text = drEmployeeDetail["classification"].ToString();
                txtRank_PIS.Text = drEmployeeDetail["rankEmployee"].ToString();
                txtSalary_PIS.Text = drEmployeeDetail["salaryRate"].ToString();
                DateTime d = DateTime.Parse(drEmployeeDetail["dateAppointment"].ToString());
                txtDateAppoint_PIS.Text = d.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                txtStatus_PIS.Text = drEmployeeDetail["statusOfEmployement"].ToString();
                //txtNewDateAppoint_PIS.Text = drEmployeeDetail["newDateAppointment"].ToString();
                DateTime d1 = DateTime.Parse(drEmployeeDetail["newdateAppointment"].ToString());
                txtNewDateAppoint_PIS.Text = d1.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                txtNewPosition_PIS.Text = drEmployeeDetail["newPosition"].ToString();
                DateTime d2 = DateTime.Parse(drEmployeeDetail["dateSeparation"].ToString());
                //txtDateSeparation_PIS.Text = drEmployeeDetail["dateSeparation"].ToString();
                txtDateSeparation_PIS.Text = d2.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                txtSeparation.Text = drEmployeeDetail["natureOfSeparation"].ToString();
                txtName_PIS.Text = drEmployeeDetail["fullName"].ToString();
            }
        }

        //display Employee Details
        public void populatePersons(string employeeNo)
        {
            try
            {
                string filename = string.Empty;
                string query = "SELECT * " +
                               "FROM persons " +
                               "WHERE employeeNo = '" + employeeNo + "' ";
                DataRow drPersonalInformation = webHelperService.getByDataRow(query);
                if (drPersonalInformation != null)
                {
                    txtName_PIS.Text = drPersonalInformation["fullName"].ToString();
                    txtAddress_PIS.Text = drPersonalInformation["address"].ToString();
                    txtContactNo_PIS.Text = drPersonalInformation["contactNumber"].ToString();
                    txtEmail_PIS.Text = drPersonalInformation["emailAddress"].ToString();
                    txtBirthplace_PIS.Text = drPersonalInformation["birthPlace"].ToString();
                    DateTime d = DateTime.Parse(drPersonalInformation["birthday"].ToString());
                    txtBirthday_PIS.Text = d.ToString("yyyy/MM/dd", CultureInfo.InvariantCulture);
                    txtCitizenship_PIS.Text = drPersonalInformation["citizenship"].ToString();
                    ddlStatus.SelectedValue = drPersonalInformation["civilStatus"].ToString();
                    txtReligion_PIS.Text = drPersonalInformation["religion"].ToString();
                    ddl_Gender.SelectedValue = drPersonalInformation["gender"].ToString();
                    txtHeight_PIS.Text = drPersonalInformation["height"].ToString();
                    txtWeight_PIS.Text = drPersonalInformation["weight"].ToString();
                    txtTin_PIS.Text = drPersonalInformation["tinId"].ToString();
                    txtPhilhealth_PIS.Text = drPersonalInformation["philHealthId"].ToString();
                    txtSSS_PIS.Text = drPersonalInformation["sssId"].ToString();
                    txtHDMF_PIS.Text = drPersonalInformation["hdmfId"].ToString();
                    txtNameEmergency_PIS.Text = drPersonalInformation["contactPerson"].ToString();
                    txtRelationship_PIS.Text = drPersonalInformation["relationship"].ToString();
                    txtContactEmergency_PIS.Text = drPersonalInformation["contactPersonNumber"].ToString();
                    filename = drPersonalInformation["picture"].ToString();
                }

                img_twoXtwo.ImageUrl = filename;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        public void populateFamilyInfo(string employeeNo)
        {
            try
            {
                string query = "SELECT * " +
                               "FROM familybackground " +
                               "WHERE employeeNo = '" + employeeNo + "' ";
                DataRow drFamilyBackground = webHelperService.getByDataRow(query);
                if (drFamilyBackground != null)
                {
                    txtFatherName_PIS.Text = drFamilyBackground["fatherName"].ToString();
                    txtFatherAge_PIS.Text = drFamilyBackground["fatherAge"].ToString();
                    txtFatherOccu_PIS.Text = drFamilyBackground["fatherOccupation"].ToString();
                    txtMotherName_PIS.Text = drFamilyBackground["motherName"].ToString();
                    txtMotherAge_PIS.Text = drFamilyBackground["motherAge"].ToString();
                    txtMotherOccu_PIS.Text = drFamilyBackground["motherOccupation"].ToString();
                    txtSpouseName_PIS.Text = drFamilyBackground["spouseName"].ToString();
                    txtSpouseAge_PIS.Text = drFamilyBackground["spouseAge"].ToString();
                    txtSpouseOccu_PIS.Text = drFamilyBackground["spouseOccupation"].ToString();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        public void populateEducBG(string employeeNo)
        {
            try
            {
                string query = "SELECT * " +
                               "FROM educationalbackground " +
                               "WHERE employeeId = '" + employeeNo + "' ";
                DataRow drFamilyBackground = webHelperService.getByDataRow(query);
                if (drFamilyBackground != null)
                {
                    txtNameElem_PIS.Text = drFamilyBackground["elementaryName"].ToString();
                    txtCourseElem_PIS.Text = drFamilyBackground["elementaryCourse"].ToString();
                    txtDatesElem_PIS.Text = drFamilyBackground["elementaryDate"].ToString();
                    txtAwardsElem_PIS.Text = drFamilyBackground["elementaryAward"].ToString();
                    txtSecondaryName_PIS.Text = drFamilyBackground["highSchoolName"].ToString();
                    txtSecondaryCourse_PIS.Text = drFamilyBackground["highSchoolCourse"].ToString();
                    txtSecondaryDates_PIS.Text = drFamilyBackground["highSchoolDate"].ToString();
                    txtSecondaryAwards_PIS.Text = drFamilyBackground["highSchoolAward"].ToString();
                    txtVocationalName_PIS.Text = drFamilyBackground["vocationalName"].ToString();
                    txtVocationalCourse_PIS.Text = drFamilyBackground["vocationalCourse"].ToString();
                    txtVocationalDates_PIS.Text = drFamilyBackground["vocationalDate"].ToString();
                    txtVocationalAwards_PIS.Text = drFamilyBackground["vocationalAward"].ToString();
                    txtBachelorName_PIS.Text = drFamilyBackground["bachelorsName"].ToString();
                    txtBachelorCourse_PIS.Text = drFamilyBackground["bachelorsCourse"].ToString();
                    txtBachelorDates_PIS.Text = drFamilyBackground["bachelorsDate"].ToString();
                    txtBachelorAwards_PIS.Text = drFamilyBackground["bachelorsAward"].ToString();
                    txtMasterName_PIS.Text = drFamilyBackground["mastersName"].ToString();
                    txtMasterCourse_PIS.Text = drFamilyBackground["mastersCourse"].ToString();
                    txtMasterDates_PIS.Text = drFamilyBackground["mastersDate"].ToString();
                    txtMasterAwards_PIS.Text = drFamilyBackground["mastersAward"].ToString();
                    txtDoctorName_PIS.Text = drFamilyBackground["doctorsName"].ToString();
                    txtDoctorCoursePIS.Text = drFamilyBackground["doctorsCourse"].ToString();
                    txtDoctorDates_PIS.Text = drFamilyBackground["doctorsDate"].ToString();
                    txtDoctorAwards_PIS.Text = drFamilyBackground["doctorsAward"].ToString();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        public void populateChildren(string employeeNo)
        {
            try
            {
                string query = "SELECT * " +
                               "FROM children " +
                               "WHERE employeeId = '" + employeeNo + "' ORDER BY childrenAge DESC ";

                WebHelperControllerService webHelperService = new WebHelperControllerService();
                webHelperService.populateGridViewByQuery(gvChildren, query);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        public void populateWork(string employeeNo)
        {
            try
            {
                string query = "SELECT * " +
                               "FROM workexperience " +
                               "WHERE employeeId = '" + employeeNo + "' ORDER BY inclusiveDates DESC ";

                WebHelperControllerService webHelperService = new WebHelperControllerService();
                webHelperService.populateGridViewByQuery(gvWorkExperience, query);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        public void populateSeminar(string employeeNo)
        {
            try
            {
                string query = "SELECT * " +
                               "FROM seminar " +
                               "WHERE employeeId = '" + employeeNo + "' ORDER BY institution ASC ";

                WebHelperControllerService webHelperService = new WebHelperControllerService();
                webHelperService.populateGridViewByQuery(gvSeminar, query);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        public void populateEligibilities(string employeeNo)
        {
            try
            {
                string query = "SELECT * " +
                               "FROM eligibility " +
                               "WHERE employeeId = '" + employeeNo + "' ORDER BY typeLicense ASC ";

                WebHelperControllerService webHelperService = new WebHelperControllerService();
                webHelperService.populateGridViewByQuery(gvEligibilities, query);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        public void populateCertsTrainings(string employeeNo)
        {
            try
            {
                string query = "SELECT * " +
                               "FROM certificates " +
                               "WHERE employeeId = '" + employeeNo + "' ORDER BY inclusiveDates DESC ";

                WebHelperControllerService webHelperService = new WebHelperControllerService();
                webHelperService.populateGridViewByQuery(gvCertTrainings, query);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        //update employee information
        private void insertPersonalDetails()
        {
            try
            {
                bool updateMode = false;
                LoginProfile profile = this.getUserProfile();
                string employeeNo = profile.UserName;
                string chkquery = "SELECT employeeNo " +
                               "FROM persons " +
                               "WHERE employeeNo = '" + employeeNo + "' ";
                DataRow drPersonSearch = webHelperService.getByDataRow(chkquery);
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
                    using (MySqlConnection connection = new MySqlConnection(connectionString))
                    {
                        //LoginProfile profile = this.getUserProfile();
                        //string employeeNo = profile.UserName;
                        string fullName = profile.LastName + ", " + profile.FirstName;
                        connection.Open();
                        string query = "INSERT INTO persons " +
                                       "(employeeNo, fullName, address, contactNumber, emailAddress, birthplace, birthday, citizenship, civilStatus, religion, gender, height, weight, tinId, philHealthId, sssId, hdmfId, contactPerson, relationship, contactPersonNumber) " +
                                       "VALUES " +
                                       "(@employeeNo, @fullName, @address, @contactNumber, @emailAddress, @birthplace, @birthday, @citizenship, @civilStatus, @religion, @gender, @height, @weight, @tin, @philhealth, @sss, @hdmf, @contactPerson, @relationship, @contactPersonNumber)";
                        MySqlCommand command = new MySqlCommand(query, connection);

                        command.Parameters.AddWithValue("@employeeNo", employeeNo);
                        command.Parameters.AddWithValue("@fullName", txtName_PIS.Text);
                        command.Parameters.AddWithValue("@address", txtAddress_PIS.Text);
                        command.Parameters.AddWithValue("@contactNumber", txtContactNo_PIS.Text);
                        command.Parameters.AddWithValue("@emailAddress", txtEmail_PIS.Text);
                        command.Parameters.AddWithValue("@birthplace", txtBirthplace_PIS.Text);
                        command.Parameters.AddWithValue("@birthday", txtBirthday_PIS.Text);
                        command.Parameters.AddWithValue("@citizenship", txtCitizenship_PIS.Text);
                        command.Parameters.AddWithValue("@civilStatus", ddlStatus.SelectedValue);
                        command.Parameters.AddWithValue("@religion", txtReligion_PIS.Text);
                        command.Parameters.AddWithValue("@gender", ddl_Gender.SelectedValue);
                        command.Parameters.AddWithValue("@height", txtHeight_PIS.Text);
                        command.Parameters.AddWithValue("@weight", txtWeight_PIS.Text);
                        command.Parameters.AddWithValue("@tin", txtTin_PIS.Text);
                        command.Parameters.AddWithValue("@philhealth", txtPhilhealth_PIS.Text);
                        command.Parameters.AddWithValue("@sss", txtSSS_PIS.Text);
                        command.Parameters.AddWithValue("@hdmf", txtHDMF_PIS.Text);
                        command.Parameters.AddWithValue("@contactPerson", txtNameEmergency_PIS.Text);
                        command.Parameters.AddWithValue("@relationship", txtRelationship_PIS.Text);
                        command.Parameters.AddWithValue("@contactPersonNumber", txtContactEmergency_PIS.Text);

                        command.ExecuteNonQuery();
                        connection.Close();
                        string message = "New Personal Details Created.";
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
                    }
                }
                else
                {
                    using (MySqlConnection connection = new MySqlConnection(connectionString))
                    {
                        //LoginProfile profile = this.getUserProfile();
                        //string employeeNo = profile.UserName;
                        connection.Open();
                        string query = "UPDATE Persons " +
                                       "SET fullName = @fullName, address = @address, " +
                                       "contactNumber = @contactNumber, emailAddress = @emailAddress, " +
                                       "birthPlace = @birthPlace, birthday = @birthday, " +
                                       "citizenship = @citizenship, civilStatus = @civilStatus, " +
                                       "religion = @religion, gender = @gender, " +
                                       "height = @height, weight = @weight, " +
                                       "tinId = @tinId, philHealthId = @philHealthId, " +
                                       "sssId = @sssId, hdmfId = @hdmfId, " +
                                       "contactPerson = @contactPerson, relationship = @relationship, " +
                                       "contactPersonNumber = @contactPersonNumber " +
                                       "WHERE employeeNo = @employeeNo";

                        MySqlCommand command = new MySqlCommand(query, connection);
                        command.Parameters.AddWithValue("@employeeNo", employeeNo);
                        command.Parameters.AddWithValue("@fullName", txtName_PIS.Text);
                        command.Parameters.AddWithValue("@address", txtAddress_PIS.Text);
                        command.Parameters.AddWithValue("@contactNumber", txtContactNo_PIS.Text);
                        command.Parameters.AddWithValue("@emailAddress", txtEmail_PIS.Text);
                        command.Parameters.AddWithValue("@birthPlace", txtBirthplace_PIS.Text);
                        command.Parameters.AddWithValue("@birthday", txtBirthday_PIS.Text);
                        command.Parameters.AddWithValue("@citizenship", txtCitizenship_PIS.Text);
                        command.Parameters.AddWithValue("@civilStatus", ddlStatus.SelectedValue);
                        command.Parameters.AddWithValue("@religion", txtReligion_PIS.Text);
                        command.Parameters.AddWithValue("@gender", ddl_Gender.SelectedValue);
                        command.Parameters.AddWithValue("@height", txtHeight_PIS.Text);
                        command.Parameters.AddWithValue("@weight", txtWeight_PIS.Text);
                        command.Parameters.AddWithValue("@tinId", txtTin_PIS.Text);
                        command.Parameters.AddWithValue("@philHealthId", txtPhilhealth_PIS.Text);
                        command.Parameters.AddWithValue("@sssId", txtSSS_PIS.Text);
                        command.Parameters.AddWithValue("@hdmfId", txtHDMF_PIS.Text);
                        command.Parameters.AddWithValue("@contactPerson", txtNameEmergency_PIS.Text);
                        command.Parameters.AddWithValue("@relationship", txtRelationship_PIS.Text);
                        command.Parameters.AddWithValue("@contactPersonNumber", txtContactEmergency_PIS.Text);
                        command.ExecuteNonQuery();

                        connection.Close();
                        //this.showMessage("Information Updated!");
                        string message = "Personal Details Updated.";
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
                    }
                }
            } 
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        //upload picture
        public void UploadPicture()
        {
            string folderPath = Server.MapPath("../UploadFiles/Picture/");

            try
            {
                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists Create it.
                    Directory.CreateDirectory(folderPath);
                }

                //Save the File to the Directory (Folder)
                uploadImage.SaveAs(folderPath + Path.GetFileName(uploadImage.FileName));

                //Display the Picture in Image control.
                //img_twoXtwo.ImageUrl = folderPath + Path.GetFileName(uploadImage.FileName);

                string filename = folderPath + Path.GetFileName(uploadImage.FileName);
                string newServerFilename = "../UploadFiles/Picture/" + (uploadImage.FileName);
                LoginProfile profile = this.getUserProfile();
                string employeeNo = profile.UserName;

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE persons " +
                                   "SET picture=@picture "+
                                   "WHERE employeeNo='" + employeeNo + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@picture", newServerFilename);

                    command.ExecuteNonQuery();
                    connection.Close();
                    string message = "Profile Photo Updated.";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
                    //this.showMessage("Information Updated!");
                }

                populatePersons(profile.UserName);

            } 
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        //Insert Family Background
        public void insertFamilyBackground()
        {
            try
            {
                bool updateMode = false;
                LoginProfile profile = this.getUserProfile();
                string employeeNo = profile.UserName;
                string chkquery = "SELECT employeeNo " +
                               "FROM familybackground " +
                               "WHERE employeeNo = '" + employeeNo + "' ";
                DataRow drFamBGSearch = webHelperService.getByDataRow(chkquery);
                if (drFamBGSearch != null)
                {
                    updateMode = true;
                }
                else
                {
                    updateMode = false;
                }


                if (updateMode == false)
                {
                    using (MySqlConnection connection = new MySqlConnection(connectionString))
                    {
                        //LoginProfile profile = this.getUserProfile();
                        //string employeeNo = profile.UserName;
                        string fullName = profile.LastName + ", " + profile.FirstName;
                        connection.Open();
                        string query = "INSERT INTO familyBackground " +
                                       "(employeeNo, fatherName, fatherAge, fatherOccupation, motherName, motherAge, motherOccupation, spouseName, spouseAge, spouseOccupation) " +
                                       "VALUES " +
                                       "(@employeeNo, @fatherName, @fatherAge, @fatherOccupation, @motherName, @motherAge, @motherOccupation, @spouseName, @spouseAge, @spouseOccupation)";
                        MySqlCommand command = new MySqlCommand(query, connection);

                        command.Parameters.AddWithValue("@employeeNo", employeeNo);
                        command.Parameters.AddWithValue("@fatherName", txtFatherName_PIS.Text);
                        command.Parameters.AddWithValue("@fatherAge", txtFatherAge_PIS.Text);
                        command.Parameters.AddWithValue("@fatherOccupation", txtFatherOccu_PIS.Text);
                        command.Parameters.AddWithValue("@motherName", txtMotherName_PIS.Text);
                        command.Parameters.AddWithValue("@motherAge", txtMotherAge_PIS.Text);
                        command.Parameters.AddWithValue("@motherOccupation", txtMotherOccu_PIS.Text);
                        command.Parameters.AddWithValue("@spouseName", txtSpouseName_PIS.Text);
                        command.Parameters.AddWithValue("@spouseAge", txtSpouseAge_PIS.Text);
                        command.Parameters.AddWithValue("@spouseOccupation", txtSpouseOccu_PIS.Text);

                        command.ExecuteNonQuery();
                        connection.Close();
                        string message = "New Family Background Added.";
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
                    }
                }
                else
                {
                    updateFamilyBackground();
                }
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void updateFamilyBackground()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    LoginProfile profile = this.getUserProfile();
                    string employeeNo = profile.UserName;
                    string fullName = profile.LastName + ", " + profile.FirstName;
                    connection.Open();
                    string query = "UPDATE familyBackground " +
                                   "SET fatherName = @fatherName, fatherAge = @fatherAge, fatherOccupation = @fatherOccupation, motherName = @motherName, motherAge = @motherAge, motherOccupation = @motherOccupation, spouseName = @spouseName, spouseAge = @spouseAge, spouseOccupation = @spouseOccupation " +
                                   "WHERE employeeNo='" + employeeNo + "'";
                    MySqlCommand command = new MySqlCommand(query, connection);

                    command.Parameters.AddWithValue("@employeeNo", employeeNo);
                    command.Parameters.AddWithValue("@fatherName", txtFatherName_PIS.Text);
                    command.Parameters.AddWithValue("@fatherAge", txtFatherAge_PIS.Text);
                    command.Parameters.AddWithValue("@fatherOccupation", txtFatherOccu_PIS.Text);
                    command.Parameters.AddWithValue("@motherName", txtMotherName_PIS.Text);
                    command.Parameters.AddWithValue("@motherAge", txtMotherAge_PIS.Text);
                    command.Parameters.AddWithValue("@motherOccupation", txtMotherOccu_PIS.Text);
                    command.Parameters.AddWithValue("@spouseName", txtSpouseName_PIS.Text);
                    command.Parameters.AddWithValue("@spouseAge", txtSpouseAge_PIS.Text);
                    command.Parameters.AddWithValue("@spouseOccupation", txtSpouseOccu_PIS.Text);

                    command.ExecuteNonQuery();
                    connection.Close();
                    string message = "Family Background Updated.";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void insertEducationalBackground()
        {
            try
            {
                bool updateMode = false;
                LoginProfile profile = this.getUserProfile();
                string employeeNo = profile.UserName;
                string chkquery = "SELECT employeeId " +
                               "FROM educationalbackground " +
                               "WHERE employeeId = '" + employeeNo + "' ";
                DataRow drPersonSearch = webHelperService.getByDataRow(chkquery);
                if (drPersonSearch != null)
                {
                    updateMode = true;
                }
                else
                {
                    updateMode = false;
                }
                if (updateMode == false)
                    using (MySqlConnection connection = new MySqlConnection(connectionString))
                    {
                        //LoginProfile profile = this.getUserProfile();
                        //string employeeNo = profile.UserName;
                        string fullName = profile.LastName + ", " + profile.FirstName;
                        connection.Open();
                        string query = "INSERT INTO educationalBackground " +
                                       "(employeeId, elementaryName, elementaryCourse, elementaryDate, elementaryAward, " +
                                       "highSchoolName, highSchoolCourse, highSchoolDate, highSchoolAward, " +
                                       "vocationalName, vocationalCourse, vocationalDate, vocationalAward, " +
                                       "bachelorsName, bachelorsCourse, bachelorsDate, bachelorsAward, " +
                                       "mastersName, mastersCourse, mastersDate, mastersAward, " +
                                       "doctorsName, doctorsCourse, doctorsDate, doctorsAward) " +
                                       "VALUES " +
                                       "(@employeeNo, @elemName, @elemCourse, @elemDate, @elemAward, " +
                                       "@hsName, @hsCourse, @hsDate, @hsAward, " +
                                       "@vocationalName, @vocationalCourse, @vocationalDate, @vocationalAward, " +
                                       "@bachelorName, @bachelorCourse, @bachelorDate, @bachelorAward, " +
                                       "@mastersName, @mastersCourse, @mastersDate, @mastersAward, " +
                                       "@doctorsName, @doctorsCourse, @doctorsDate, @doctorsAward )";
                        MySqlCommand command = new MySqlCommand(query, connection);

                        command.Parameters.AddWithValue("@employeeNo", employeeNo);
                        command.Parameters.AddWithValue("@elemName", txtNameElem_PIS.Text);
                        command.Parameters.AddWithValue("@elemCourse", txtCourseElem_PIS.Text);
                        command.Parameters.AddWithValue("@elemDate", txtDatesElem_PIS.Text);
                        command.Parameters.AddWithValue("@elemAward", txtAwardsElem_PIS.Text);
                        command.Parameters.AddWithValue("@hsName", txtSecondaryName_PIS.Text);
                        command.Parameters.AddWithValue("@hsCourse", txtSecondaryCourse_PIS.Text);
                        command.Parameters.AddWithValue("@hsDate", txtSecondaryDates_PIS.Text);
                        command.Parameters.AddWithValue("@hsAward", txtSecondaryAwards_PIS.Text);
                        command.Parameters.AddWithValue("@vocationalName", txtVocationalName_PIS.Text);
                        command.Parameters.AddWithValue("@vocationalCourse", txtVocationalCourse_PIS.Text);
                        command.Parameters.AddWithValue("@vocationalDate", txtVocationalDates_PIS.Text);
                        command.Parameters.AddWithValue("@vocationalAward", txtVocationalAwards_PIS.Text);
                        command.Parameters.AddWithValue("@bachelorName", txtBachelorName_PIS.Text);
                        command.Parameters.AddWithValue("@bachelorCourse", txtBachelorCourse_PIS.Text);
                        command.Parameters.AddWithValue("@bachelorDate", txtBachelorDates_PIS.Text);
                        command.Parameters.AddWithValue("@bachelorAward", txtBachelorAwards_PIS.Text);
                        command.Parameters.AddWithValue("@mastersName", txtMasterName_PIS.Text);
                        command.Parameters.AddWithValue("@mastersCourse", txtMasterCourse_PIS.Text);
                        command.Parameters.AddWithValue("@mastersDate", txtMasterDates_PIS.Text);
                        command.Parameters.AddWithValue("@mastersAward", txtMasterAwards_PIS.Text);
                        command.Parameters.AddWithValue("@doctorsName", txtDoctorName_PIS.Text);
                        command.Parameters.AddWithValue("@doctorsCourse", txtDoctorCoursePIS.Text);
                        command.Parameters.AddWithValue("@doctorsDate", txtDoctorDates_PIS.Text);
                        command.Parameters.AddWithValue("@doctorsAward", txtDoctorAwards_PIS.Text);

                        command.ExecuteNonQuery();
                        connection.Close();
                        string message = "New Educational Background Added.";
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");

                    }
                else
                {
                    //set to update
                    using (MySqlConnection connection = new MySqlConnection(connectionString))
                    {
                        //LoginProfile profile = this.getUserProfile();
                        //string employeeNo = profile.UserName;
                        string fullName = profile.LastName + ", " + profile.FirstName;
                        connection.Open();
                        string query = "UPDATE educationalBackground " +
                                       "SET elementaryName = @elemName, elementaryCourse = @elemCourse, elementaryDate = @elemDate, elementaryAward = @elemAward, " +
                                       "highSchoolName = @hsName, highSchoolCourse = @hsCourse, highSchoolDate = @hsDate, highSchoolAward = @hsAward, " +
                                       "vocationalName = @vocationalName, vocationalCourse = @vocationalCourse, vocationalDate = @vocationalDate, vocationalAward = @vocationalAward, " +
                                       "bachelorsName = @bachelorName, bachelorsCourse = @bachelorCourse, bachelorsDate = @bachelorDate, bachelorsAward = @bachelorAward, " +
                                       "mastersName = @mastersName, mastersCourse = @mastersCourse, mastersDate = @mastersDate, mastersAward = @mastersAward, " +
                                       "doctorsName = @doctorsName, doctorsCourse = @doctorsCourse, doctorsDate = @doctorsDate, doctorsAward = @doctorsAward " +
                                       "WHERE employeeId='" + employeeNo + "'";
                        MySqlCommand command = new MySqlCommand(query, connection);

                        //command.Parameters.AddWithValue("@employeeNo", employeeNo);
                        command.Parameters.AddWithValue("@elemName", txtNameElem_PIS.Text);
                        command.Parameters.AddWithValue("@elemCourse", txtCourseElem_PIS.Text);
                        command.Parameters.AddWithValue("@elemDate", txtDatesElem_PIS.Text);
                        command.Parameters.AddWithValue("@elemAward", txtAwardsElem_PIS.Text);
                        command.Parameters.AddWithValue("@hsName", txtSecondaryName_PIS.Text);
                        command.Parameters.AddWithValue("@hsCourse", txtSecondaryCourse_PIS.Text);
                        command.Parameters.AddWithValue("@hsDate", txtSecondaryDates_PIS.Text);
                        command.Parameters.AddWithValue("@hsAward", txtSecondaryAwards_PIS.Text);
                        command.Parameters.AddWithValue("@vocationalName", txtVocationalName_PIS.Text);
                        command.Parameters.AddWithValue("@vocationalCourse", txtVocationalCourse_PIS.Text);
                        command.Parameters.AddWithValue("@vocationalDate", txtVocationalDates_PIS.Text);
                        command.Parameters.AddWithValue("@vocationalAward", txtVocationalAwards_PIS.Text);
                        command.Parameters.AddWithValue("@bachelorName", txtBachelorName_PIS.Text);
                        command.Parameters.AddWithValue("@bachelorCourse", txtBachelorCourse_PIS.Text);
                        command.Parameters.AddWithValue("@bachelorDate", txtBachelorDates_PIS.Text);
                        command.Parameters.AddWithValue("@bachelorAward", txtBachelorAwards_PIS.Text);
                        command.Parameters.AddWithValue("@mastersName", txtMasterName_PIS.Text);
                        command.Parameters.AddWithValue("@mastersCourse", txtMasterCourse_PIS.Text);
                        command.Parameters.AddWithValue("@mastersDate", txtMasterDates_PIS.Text);
                        command.Parameters.AddWithValue("@mastersAward", txtMasterAwards_PIS.Text);
                        command.Parameters.AddWithValue("@doctorsName", txtDoctorName_PIS.Text);
                        command.Parameters.AddWithValue("@doctorsCourse", txtDoctorCoursePIS.Text);
                        command.Parameters.AddWithValue("@doctorsDate", txtDoctorDates_PIS.Text);
                        command.Parameters.AddWithValue("@doctorsAward", txtDoctorAwards_PIS.Text);

                        command.ExecuteNonQuery();
                        connection.Close();

                        string message = "Educational background updated.";
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
       
        protected void btnUpdate_PIS_Click(object sender, EventArgs e)
        {
            insertPersonalDetails();
            UploadPicture();
            insertFamilyBackground();
            insertChild();
            insertEducationalBackground();
            insertEligibility();
            insertCert();
            insertSeminar();
            insertWork();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddSeminar_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddWork_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddChild_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddEligibility_Click(object sender, EventArgs e)
        {

        }

        protected void btnSaveChild_Click(object sender, EventArgs e)
        {
            foreach (Control c in phchild.Controls)
            {
                //Find the specific user control that we added to this placeholder, and then get the selected values
                //for the dropdownlist, checkbox, and textbox and print them to the screen.
                if (c.GetType().Name.ToLower() == "children_ascx")
                {
                    UserControl uc = (UserControl)c;
                    TextBox tbName = uc.FindControl("txtChildrenName") as TextBox;
                    TextBox tbAge = uc.FindControl("txtChildrenAge") as TextBox;
                    TextBox tbOccu = uc.FindControl("txtChildrenOccupaion") as TextBox;
                    Button btnSvChild = uc.FindControl("btnSaveChild") as Button;
                    if (!string.IsNullOrEmpty(tbName.Text.Trim()) && !string.IsNullOrEmpty(tbAge.Text.Trim()) && !string.IsNullOrEmpty(tbOccu.Text.Trim()))
                    {
                        InsertChild(txtEmpID_PIS.Text, tbName.Text.Trim(), tbAge.Text.Trim(), tbOccu.Text.Trim());
                    }
                }
            }
            string message = "New Child record inserted.";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Employee/PersonalInfoSheet.aspx'};</script>");
            //Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void btnUpdatePersonalDetail_Click(object sender, EventArgs e)
        {
            insertPersonalDetails();
        }

        protected void btnUploadPhoto_Click(object sender, EventArgs e)
        {
            UploadPicture();
        }

        protected void btnUpdateFamBG_Click(object sender, EventArgs e)
        {
            insertFamilyBackground();
        }

        protected void btnUpdateEduc_Click(object sender, EventArgs e)
        {
            insertEducationalBackground();
        }

        protected void btnSaveEligibility_Click(object sender, EventArgs e)
        {
            insertEligibility();
        }

        protected void btnSaveCertTraining_Click(object sender, EventArgs e)
        {
            insertCert();
        }

        protected void btnSaveSeminar_Click(object sender, EventArgs e)
        {
            insertSeminar();
        }

        protected void btnSaveWork_Click(object sender, EventArgs e)
        {
            insertWork();
        }
    }
}