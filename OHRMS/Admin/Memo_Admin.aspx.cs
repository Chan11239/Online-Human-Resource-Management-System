using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Windows;

namespace OHRMS.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        MySqlConnection conn = new MySqlConnection(connstring);
        MySqlCommand cmd;
        DataSet ds = new DataSet();
        static string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DateTime date = DateTime.Now;
                txtDate_Memo.Text = date.ToString("yyyy-MM-dd");
            }
        }

        public void ShowMessage(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        public void clear()
        {
            txtTo_Memo.Text = string.Empty; txtMemoNumber.Text = string.Empty;
            txtBody_Memo.Text = string.Empty; txtCC_Memo.Text = string.Empty;
            txtFrom_Memo.Text = string.Empty; txtSubject_Memo.Text = string.Empty;
            txtMemoNumber.Focus();
        }

        protected void btnSubmit_Memo_Click(object sender, EventArgs e)
        {
            string strFilePath = string.Empty;

            if (fileUpload.HasFile)
            {
                try
                {
                    string extension = System.IO.Path.GetExtension(fileUpload.FileName);
                    strFilePath = txtMemoNumber.Text+ DateTime.Now.ToString("yyyyMMdd")+ ".pdf";
                    fileUpload.PostedFile.SaveAs(Server.MapPath("~/MemorandumFiles/" + strFilePath.Trim()));
                    string filename = "~/MemorandumFiles/" + strFilePath;

                    conn = new MySqlConnection(connstring);
                    conn.Open();
                    string query1 = "Insert into Emp_Memos Values (@Num, @To, @cc, @from, @date, @Subject, @body, @files)";
                    cmd = new MySqlCommand(query1, conn);

                    cmd.Parameters.AddWithValue("@Num", txtMemoNumber.Text);
                    cmd.Parameters.AddWithValue("@To", txtTo_Memo.Text);
                    cmd.Parameters.AddWithValue("@cc", txtCC_Memo.Text);
                    cmd.Parameters.AddWithValue("@from", txtFrom_Memo.Text);
                    cmd.Parameters.AddWithValue("@date", txtDate_Memo.Text);
                    cmd.Parameters.AddWithValue("@Subject", txtSubject_Memo.Text);
                    cmd.Parameters.AddWithValue("@body", txtBody_Memo.Text);
                    cmd.Parameters.AddWithValue("@files", filename);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    ShowMessage("Memorandum Send...");
                    clear();
                }

                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
    }
}