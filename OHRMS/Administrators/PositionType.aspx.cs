using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Administrators
{
    public partial class PositionType : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateDropDownListDepartments(ddlClassification.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    hidId.Value = Request.QueryString["id"];
                    populatePosition(int.Parse(hidId.Value));
                }
            }
        }

        private void populatePosition(int id)
        {
            string query = "SELECT * " +
                           "FROM position " +
                           "WHERE id = " + id + "";
            DataRow drDepartments = webHelperService.getByDataRow(query);
            if (drDepartments != null)
            {
                ddlClassification.SelectedValue = drDepartments["classificationName"].ToString();
                txtPosition.Text = drDepartments["positionName"].ToString();
            }
        }

        private void insertPosition()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "INSERT INTO position " +
                                   "(classificationName, departmentName, positionName) " +
                                   "VALUES " +
                                   "(@classification, @department, @positionName) ";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@classification", ddlClassification.SelectedValue);
                    command.Parameters.AddWithValue("@department", ddlDepartment.SelectedValue);
                    command.Parameters.AddWithValue("@positionName", txtPosition.Text);

                    command.ExecuteNonQuery();
                    connection.Close();

                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }


        private void updatePosition()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    connection.Open();
                    string query = "UPDATE position " +
                                   "SET " +
                                   "classificationName=@classification, departmentName=@department, positionName=@positionName " +
                                   "WHERE id=@id";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@id", hidId.Value);
                    command.Parameters.AddWithValue("@classification", ddlClassification.SelectedValue);
                    command.Parameters.AddWithValue("@department", ddlDepartment.SelectedValue);
                    command.Parameters.AddWithValue("@positionName", txtPosition.Text);
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }

        private void populateDropDownListDepartments(string classification)
        {
            string query = "SELECT departmentName FROM departments WHERE classificationName = '" + classification + "' ";
            DataTable dt = webHelperService.getByDataTable(query);

            ddlDepartment.Items.Clear();
            ddlDepartment.DataSource = dt;
            ddlDepartment.DataValueField = dt.Columns["departmentName"].ToString();
            ddlDepartment.DataTextField = dt.Columns["departmentName"].ToString();
            ddlDepartment.DataBind();
            //ddlDepartment.Items.Insert(0, new ListItem("- Select -", "-"));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtPosition.Text.Trim() == string.Empty)
            {
                showMessage("Position is required.");
                return;
            }
            if (ddlDepartment.SelectedValue == "-")
            {
                showMessage("Need to Select Department.");
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
                insertPosition();
                string message = "New record added!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Administrators/PositionList.aspx'};</script>");
                //this.showMessage("New Position Added!");
                //lockFields();
                this.recordUserActivity("New Position Added");
            }
            else
            {
                updatePosition();
                string message = "Record updated successfully!";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script type = 'text/javascript'>window.onload=new function(){alert('" + message + "');window.location='/Administrators/PositionList.aspx'};</script>");
                //this.showMessage("Record updated successfully!");
                //lockFields();
                this.recordUserActivity("Position Updated");
            }
        }

        private void lockFields()
        {
            txtPosition.Enabled = false;
            ddlClassification.Enabled = false;
            btnSubmit.Enabled = false;
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrators/PositionList.aspx");
        }

        protected void ddlClassification_SelectedIndexChanged(object sender, EventArgs e)
        {
            populateDropDownListDepartments(ddlClassification.SelectedValue);
        }
    }
}