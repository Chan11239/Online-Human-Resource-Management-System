using MySql.Data.MySqlClient;
using OHRMS.Helpers;
using OHRMS.Services;
using System;
using System.Data;

namespace OHRMS.Administrators
{
    public partial class RankType : AbstractWebPage
    {
        private WebHelperControllerService webHelperService = new WebHelperControllerService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtClassification.Text = "Teaching";
                if (Request.QueryString["id"] != null)
                {
                    hidId.Value = Request.QueryString["id"];
                    populateRank(int.Parse(hidId.Value));
                }
            }
        }

        private void populateRank(int id)
        {
            string query = "SELECT * " +
                           "FROM rankMaintenance " +
                           "WHERE id = " + id + "";
            DataRow drDepartments = webHelperService.getByDataRow(query);
            if (drDepartments != null)
            {
                txtClassification.Text = drDepartments["classificationName"].ToString();
                txtStartPoint.Text = drDepartments["startPoints"].ToString();
                txtEndPoint.Text = drDepartments["endPoint"].ToString();
                ddlType.SelectedValue = drDepartments["type"].ToString();
                txtRank.Text = drDepartments["rankName"].ToString();
                txtSalaryRate.Text = drDepartments["salaryRate"].ToString();
            }
        }

        private void insertRank()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    if (ddlType.SelectedValue == "Full Time")
                    {
                        string salaryperhour = txtSalaryRate.Text;
                        double convertToDouble = double.Parse(salaryperhour);
                        double salaryperMonth = convertToDouble * 160;
                        connection.Open();
                        string query = "INSERT INTO rankMaintenance " +
                                       "(classificationName, startPoints, endPoint, type, rankName, salaryRate) " +
                                       "VALUES " +
                                       "(@classification, @startPoints, @endPoint, @type, @rankName, @salaryRate) ";
                        MySqlCommand command = new MySqlCommand(query, connection);
                        command.Parameters.AddWithValue("@classification", txtClassification.Text);
                        command.Parameters.AddWithValue("@startPoints", txtStartPoint.Text);
                        command.Parameters.AddWithValue("@endPoint", txtEndPoint.Text);
                        command.Parameters.AddWithValue("@type", ddlType.SelectedValue);
                        command.Parameters.AddWithValue("@rankName", txtRank.Text);
                        command.Parameters.AddWithValue("@salaryRate", salaryperMonth);

                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                    else
                    {
                        connection.Open();
                        string query = "INSERT INTO rankMaintenance " +
                                       "(classificationName, startPoints, endPoint, type, rankName, salaryRate) " +
                                       "VALUES " +
                                       "(@classification, @startPoints, @endPoint, @type, @rankName, @salaryRate) ";
                        MySqlCommand command = new MySqlCommand(query, connection);
                        command.Parameters.AddWithValue("@classification", txtClassification.Text);
                        command.Parameters.AddWithValue("@startPoints", txtStartPoint.Text);
                        command.Parameters.AddWithValue("@endPoint", txtEndPoint.Text);
                        command.Parameters.AddWithValue("@type", ddlType.SelectedValue);
                        command.Parameters.AddWithValue("@rankName", txtRank.Text);
                        command.Parameters.AddWithValue("@salaryRate", txtSalaryRate.Text);

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

        private void updateRank()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(getConnetionStrings))
                {
                    if (ddlType.SelectedValue == "Full Time")
                    {
                        string salaryperhour = txtSalaryRate.Text;
                        double convertToDouble = double.Parse(salaryperhour);
                        double salaryperMonth = convertToDouble * 160;
                        connection.Open();
                        string query = "UPDATE rankMaintenance " +
                                       "SET " +
                                       "startPoints=@startPoints, endPoint=@endPoint, type=@type, rankName=@rankName, salaryRate=@salaryRate " +
                                       "WHERE id=@id";
                        MySqlCommand command = new MySqlCommand(query, connection);
                        command.Parameters.AddWithValue("@classification", txtClassification.Text);
                        command.Parameters.AddWithValue("@startPoints", txtStartPoint.Text);
                        command.Parameters.AddWithValue("@endPoint", txtEndPoint.Text);
                        command.Parameters.AddWithValue("@type", ddlType.SelectedValue);
                        command.Parameters.AddWithValue("@rankName", txtRank.Text);
                        command.Parameters.AddWithValue("@salaryRate", salaryperMonth);

                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                    else
                    {
                        connection.Open();
                        string query = "UPDATE rankMaintenance " +
                                       "SET " +
                                       "startPoints=@startPoints, endPoint=@endPoint, type=@type, rankName=@rankName, salaryRate=@salaryRate " +
                                       "WHERE id=@id";
                        MySqlCommand command = new MySqlCommand(query, connection);
                        command.Parameters.AddWithValue("@classification", txtClassification.Text);
                        command.Parameters.AddWithValue("@startPoints", txtStartPoint.Text);
                        command.Parameters.AddWithValue("@endPoint", txtEndPoint.Text);
                        command.Parameters.AddWithValue("@type", ddlType.SelectedValue);
                        command.Parameters.AddWithValue("@rankName", txtRank.Text);
                        command.Parameters.AddWithValue("@salaryRate", txtSalaryRate.Text);

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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtStartPoint.Text.Trim() == string.Empty)
            {
                showMessage("Start Points is required.");
                return;
            }
            if (txtEndPoint.Text.Trim() == string.Empty)
            {
                showMessage("End Points is required.");
                return;
            }
            if (ddlType.SelectedValue.Trim() == string.Empty)
            {
                showMessage("Type is required.");
                return;
            }
            if (txtRank.Text.Trim() == string.Empty)
            {
                showMessage("Rank is required.");
                return;
            }
            if (txtSalaryRate.Text.Trim() == string.Empty)
            {
                showMessage("Salary is required.");
                return;
            }
            if (txtClassification.Text == "-")
            {
                showMessage("Need to Select Classification.");
                return;
            }
            int id = hidId.Value == string.Empty ? 0 : int.Parse(hidId.Value.ToString());
            if (hidId.Value == string.Empty)
            {
                insertRank();
                this.showMessage("New Rank Added! Successful");
                lockFields();
                Response.Redirect("~/Administrators/RankList.aspx");
            }
            else
            {
                updateRank();
                this.showMessage("Update Rank! Successful");
                lockFields();
                Response.Redirect("~/Administrators/RankList.aspx");
            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrators/RankList.aspx");
        }
        private void lockFields()
        {
            txtStartPoint.Enabled = false;
            txtEndPoint.Enabled = false;
            txtRank.Enabled = false;
            txtSalaryRate.Enabled = false;
            txtClassification.Enabled = false;
            btnSubmit.Enabled = false;
        }
    }
}