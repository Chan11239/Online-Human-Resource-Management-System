using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;


namespace OHRMS
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        MySqlConnection conn;
        MySqlCommand cmd;
        MySqlDataReader reader;
        MySqlDataAdapter da;
        DataSet ds = new DataSet();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getNewApplicant();
                getInProgress();
            }
        }
        public void getNewApplicant()
        {
            try
            {
                conn = new MySqlConnection(connstring);
                string query = "Select * from Users where Status='New Applicant'";

                conn.Open();
                cmd = new MySqlCommand(query, conn);
                cmd.Connection = conn;
                da = new MySqlDataAdapter(cmd);
                da.Fill(ds);
                cmd.ExecuteNonQuery();
                rptr_NewApplicant.DataSource = ds;
                rptr_NewApplicant.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public void getInProgress()
        {
            try
            {
                conn = new MySqlConnection(connstring);
                string query = "Select * from Users where Status='In Progress'";

                conn.Open();
                cmd = new MySqlCommand(query, conn);
                cmd.Connection = conn;
                da = new MySqlDataAdapter(cmd);
                DataSet ds1 = new DataSet();
                da.Fill(ds1);
                cmd.ExecuteNonQuery();
                rptProgress.DataSource = ds1;
                rptProgress.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public DataTable getData(string query)
        {
            using (MySqlConnection con = new MySqlConnection(connstring))
            {
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void rptr_NewApplicant_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                var id = e.CommandArgument;
                string file = null;
                try
                {
                    conn = new MySqlConnection(connstring);
                    string query = "Select Resume from Users where UserID='"+id.ToString()+"'";

                    conn.Open();
                    cmd = new MySqlCommand(query, conn);
                    cmd.Connection = conn;
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        file = reader["Resume"].ToString();
                    }

                    conn.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }


                Session["file"] = file;
                string URL = ResolveClientUrl("~") + "/Show.aspx";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "show window",
                "shwwindow('" + URL + "');", true);
            }
        }

        protected void rptr_NewApplicant_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Find the DropDownList in the Repeater Item.
                DropDownList ddlInitial = (e.Item.FindControl("drpdwnInitial") as DropDownList);
                ddlInitial.Items.Add("Passed");
                ddlInitial.Items.Add("Failed");

                DropDownList ddlDemo = (e.Item.FindControl("drpdwnDemo") as DropDownList);
                ddlDemo.Items.Add("Passed");
                ddlDemo.Items.Add("Failed");

                DropDownList ddlExam = (e.Item.FindControl("drpdwnExam") as DropDownList);
                ddlExam.Items.Add("Passed");
                ddlExam.Items.Add("Failed");

                DropDownList ddlFinal = (e.Item.FindControl("drpdwnFinal") as DropDownList);
                ddlFinal.Items.Add("Passed");
                ddlFinal.Items.Add("Failed");

                ddlInitial.Items.Insert(0, new ListItem("Please select"));
                ddlDemo.Items.Insert(0, new ListItem("Please select"));
                ddlExam.Items.Insert(0, new ListItem("Please select"));
                ddlFinal.Items.Insert(0, new ListItem("Please select"));

                ddlDemo.Enabled = false;
                ddlExam.Enabled = false;
                ddlFinal.Enabled = false;
            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            //Reference the Repeater Item using Button.
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            //Reference the DropDownList.
            DropDownList ddlIntial = item.FindControl("drpdwnInitial") as DropDownList;

            Label lblname = item.FindControl("lblName") as Label;

            if (ddlIntial.SelectedValue != null)
            {
                //Get the Selected Text.
                string selectedText = ddlIntial.SelectedItem.Text;

                //Get the Selected Value.
                string selectedValue = ddlIntial.SelectedItem.Value;

                try
                {
                    conn = new MySqlConnection(connstring);
                    string query = "Update Users Set Status=@status, Initial_Interview=@initial where Name='" + lblname.Text + "'";

                    conn.Open();
                    cmd = new MySqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@status", "In Progress");
                    cmd.Parameters.AddWithValue("@initial", selectedText);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    getInProgress();
                    foreach (RepeaterItem rptItem in rptr_NewApplicant.Items)
                    {
                        if (rptItem.FindControl("btnFailed_Initial") != null)
                        {
                            ((Button)rptItem.FindControl("btnFailed_Initial")).Enabled = false;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }

        protected void rptProgress_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
       
        protected void rptProgress_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblname = e.Item.FindControl("lblName") as Label;

                //Find the DropDownList in the Repeater Item.
                DropDownList ddlInitial = (e.Item.FindControl("drpdwnInitial") as DropDownList);
                ddlInitial.DataSource = this.getData("SELECT Initial_Interview from Users where Status='In Progress'");
                ddlInitial.DataTextField = "Initial_Interview";
                ddlInitial.DataValueField = "Initial_Interview";
                ddlInitial.DataBind();
                string initial = (e.Item.DataItem as DataRowView)["Initial_Interview"].ToString();
                ddlInitial.Items.FindByValue(initial).Selected = true;

                ddlInitial.Enabled = false;

                DropDownList ddlDemo = (e.Item.FindControl("drpdwnDemo") as DropDownList);


                //ddlDemo.DataSource = this.getData("SELECT Teaching_Demo from Users where Status='In Progress' and Name='"+lblname.Text+"'");
                //ddlDemo.DataTextField = "Teaching_Demo";
                //ddlDemo.DataValueField = "Teaching_Demo";
                //ddlDemo.DataBind();

                //string demo = (e.Item.DataItem as DataRowView)["Teaching_Demo"].ToString();
                //ddlDemo.Items.FindByValue(demo).Selected = true;
                //if (demo != "Please select")
                //{
                //    ddlDemo.Enabled = false;
                //}
                //else if (demo == "")
                //{
                    //ddlDemo.Enabled = true;
                    ddlDemo.Items.Add("Passed");
                    ddlDemo.Items.Add("Failed");
                //}

                DropDownList ddlExam = (e.Item.FindControl("drpdwnExam") as DropDownList);
                ddlExam.Items.Add("Passed");
                ddlExam.Items.Add("Failed");

                DropDownList ddlFinal = (e.Item.FindControl("drpdwnFinal") as DropDownList);
                ddlFinal.Items.Add("Passed");
                ddlFinal.Items.Add("Failed");

                ddlDemo.Items.Insert(0, new ListItem("Please select"));
                ddlExam.Items.Insert(0, new ListItem("Please select"));
                ddlFinal.Items.Insert(0, new ListItem("Please select"));

            }
        }

        protected void btnOk_Click1(object sender, EventArgs e)
        {
            //Reference the Repeater Item using Button.
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            //Reference the DropDownList.
            DropDownList ddlDemo = item.FindControl("drpdwnDemo") as DropDownList;

            Label lblname = item.FindControl("lblName") as Label;

            if (ddlDemo.SelectedValue != null)
            {
                //Get the Selected Text.
                string selectedText = ddlDemo.SelectedItem.Text;

                //Get the Selected Value.
                string selectedValue = ddlDemo.SelectedItem.Value;

                try
                {
                    conn = new MySqlConnection(connstring);
                    string query = "Update Users Set Teaching_Demo=@initial where Name='" + lblname.Text + "'";

                    conn.Open();
                    cmd = new MySqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@initial", selectedText);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    getInProgress();

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }
    }
}