using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using System;
using System.Data;
using System.Web.UI;
using OHRMS.Services;

namespace OHRMS.Administrators
{
    public partial class DepartmentType : AbstractWebPage
    {
        WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    hidId.Value = Request.QueryString["id"];
                    populateDepartment(int.Parse(hidId.Value));
                }
            }
        }

        private void populateDepartment(int id)
        {
            string query = "SELECT * " +
                           "FROM departments " +
                           "WHERE id = "+id+ "";
            DataRow drDepartments = webHelperService.getByDataRow(query);
            if (drDepartments != null)
            {
                ddlClassification.SelectedValue = drDepartments["classificationName"].ToString();
                txtDepartment.Text = drDepartments["departmentName"].ToString();
            }
        }

        private void insertDepartment()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "INSERT INTO departments " +
                                   "(isActive, classificationName, departmentName) " +
                                   "VALUES " +
                                   "(@isActive, @classification, @department) ";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@isActive", 1);
                    command.Parameters.AddWithValue("@classification", ddlClassification.SelectedValue);
                    command.Parameters.AddWithValue("@department", txtDepartment.Text);

                    command.ExecuteNonQuery();
                    connection.Close();

                    this.showMessage("New Department Added!");
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        private void updateDepartment()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE departments " +
                                   "SET " +
                                   "classificationName=@classification, departmentName=@department " +
                                   "WHERE id=@id";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@id", hidId.Value);
                    command.Parameters.AddWithValue("@classification", ddlClassification.SelectedValue);
                    command.Parameters.AddWithValue("@department", txtDepartment.Text);
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtDepartment.Text.Trim() == string.Empty)
            {
                showMessage("Department is required.");
                return;
            }
            if (ddlClassification.SelectedValue == "-")
            {
                showMessage("Need to Select Classification.");
                return;
            }
            int id = hidId.Value == string.Empty ? 0 : int.Parse(hidId.Value.ToString());

            if (hidId.Value == string.Empty)
            {
                insertDepartment();
                string message = "New department Added!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Administrators/DepartmentList.aspx'};</script>");
                //this.showMessage("New department Added!");
                //lockFields();
            }
            else
            {
                updateDepartment();
                //this.showMessage("Record updated successfully.");

                string message = "Record updated successfully";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Administrators/DepartmentList.aspx'};</script>");

                //Response.Redirect("~/Administrators/DepartmentList.aspx");
                //lockFields();
            }
        }

        private void lockFields()
        {
            txtDepartment.Enabled = false;
            ddlClassification.Enabled = false;
            btnSubmit.Enabled = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrators/DepartmentList.aspx");
        }
    }
}