using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Windows;

namespace OHRMS
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        MySqlConnection conn;
        MySqlCommand cmd;
        MySqlDataAdapter da;
        DataSet ds = new DataSet();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getJobs();
            }
        }
        
        public void ShowMessage(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string category = drpdwnlst_cat.Items[drpdwnlst_cat.SelectedIndex].Text;
            string type = drpdwnlst_type.Items[drpdwnlst_type.SelectedIndex].Text;
            string quali = drpdwnlst_qual.Items[drpdwnlst_qual.SelectedIndex].Text;
            string exp = drpdwnlst_exp.Items[drpdwnlst_exp.SelectedIndex].Text;
            try
            {
                
                conn = new MySqlConnection(connstring);
                string query = "Insert into Jobs (Job_Title, Job_Description, Job_Category, Job_Type, Job_Qualification, Job_MinimumReq, Job_GeneralQuali) Values (@title, @desc, @category, @type, @quali, @minimum, @genquali)";

                conn.Open();
                cmd = new MySqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@title", txtJobTitle.Text);
                cmd.Parameters.AddWithValue("@desc", txtjob_desc.Text);
                cmd.Parameters.AddWithValue("@category", category);
                cmd.Parameters.AddWithValue("@type", type);
                cmd.Parameters.AddWithValue("@quali", quali);
                cmd.Parameters.AddWithValue("@minimum", exp);
                cmd.Parameters.AddWithValue("@genquali", txtGenQuali.Text);

                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Job Posted!");
            } 
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        
        public void getJobs()
        {
            try
            {
                conn = new MySqlConnection(connstring);
                string query = "Select Job_Title, Job_Type, Job_Category from Jobs";

                conn.Open();
                cmd = new MySqlCommand(query, conn);
                cmd.Connection = conn;
                da = new MySqlDataAdapter(cmd);
                da.Fill(ds);
                cmd.ExecuteNonQuery();
                gdview_Job.DataSource = ds;
                gdview_Job.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }
        }
    }
}