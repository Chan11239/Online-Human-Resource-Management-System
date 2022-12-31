using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace OHRMS
{
    /// <summary>
    /// Summary description for Jobs
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Jobs : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetAllJob()
        {
            List<Job> employeelist = new List<Job>();

            string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
            using (MySqlConnection con = new MySqlConnection(connstring))
            {
                MySqlCommand cmd = new MySqlCommand("Select * from Jobs", con);
                con.Open();

                MySqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Job employee = new Job();
                    employee.ID = rdr["JobID"].ToString();
                    employee.Title = rdr["Job_Title"].ToString();
                    employee.Category = rdr["Job_Category"].ToString();
                    employee.Desctiption = rdr["Job_Description"].ToString();
                    employee.Type = rdr["Job_Type"].ToString();
                    employee.Qualification = rdr["Job_Qualification"].ToString();
                    employee.Minimum = rdr["Job_MinimumReq"].ToString();
                    employee.GenQuali = rdr["Job_GeneralQuali"].ToString();

                    employeelist.Add(employee);
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(employeelist));
        }
    }
}
