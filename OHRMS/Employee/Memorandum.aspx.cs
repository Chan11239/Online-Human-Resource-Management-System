using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace OHRMS.Employee
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        MySqlConnection conn;
        MySqlCommand cmd;
        MySqlDataReader reader;
        MySqlDataAdapter da;
        DataSet ds = new DataSet();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        string name = null;
        Label lblName = new Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Emp_name"] != null)
            {
                lblName.Text = Session["Emp_name"].ToString();
            }
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        public void BindData()
        {
            try
            {
                conn = new MySqlConnection(connstring);
                string query = "Select Memo_To from Emp_Memos";
                cmd = new MySqlCommand(query);
                conn.Open();
                cmd.Connection = conn;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    name = reader["Memo_To"].ToString();
                }
                    if (name == lblName.Text)
                    {
                        conn = new MySqlConnection(connstring);
                        string query1 = "Select Memo_Num, Memo_File From Emp_Memos where Memo_To='"+name+"'";
                        cmd = new MySqlCommand(query1);
                        cmd.Connection = conn;
                        da = new MySqlDataAdapter(cmd);
                        da.Fill(ds);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        gridview_Employee.DataSource = ds;
                        gridview_Employee.DataBind();
                        conn.Close();
                    }
            } catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            
        }
        protected void gridview_Employee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Message")
            {
                try {
                    var fileid = (e.CommandArgument);
                    conn = new MySqlConnection(connstring);
                    string query1 = "Select * from Emp_Memos where Memo_Num='" + fileid.ToString() + "'";
                    cmd = new MySqlCommand(query1);
                    conn.Open();
                    cmd.Connection = conn;
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        lblMemoNum.Text = reader["Memo_Num"].ToString();
                        lblTo_Memo.Text = reader["Memo_To"].ToString();
                        lblCC_Memo.Text = reader["Memo_CC"].ToString();
                        lblFrom_Memo.Text = reader["Memo_From"].ToString();
                        lblDate_Memo.Text = reader["Memo_Date"].ToString();
                        lblSubject.Text = reader["Memo_Subject"].ToString();
                        lblBody_Memo.Text = reader["Memo_Body"].ToString();
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            if (e.CommandName == "View")
            {
                try
                {
                    var fileid = (e.CommandArgument);
                    conn = new MySqlConnection(connstring);
                    string query1 = "Select Memo_File From Emp_Memos where Memo_Num='" + fileid.ToString() + "'";
                    string filename = null;
                    string fullpath = null;
                    cmd = new MySqlCommand(query1);
                    conn.Open();
                    cmd.Connection = conn;
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        filename = reader["Memo_File"].ToString();
                        fullpath = filename + ".pdf";
                    }
                    conn.Close();

                    Session["file"] = filename.Trim();
                    string URL = ResolveClientUrl("~") + "/Show.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
                    "shwwindow('" + URL + "');", true);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
    }
}