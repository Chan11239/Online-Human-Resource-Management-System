using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI.WebControls;

namespace OHRMS.Services
{
    public class WebHelperControllerService :AbstractService
    {
        private string emailHost = ConfigurationManager.AppSettings["EmailHost"].ToString();
        private string emailUser = ConfigurationManager.AppSettings["EmailUser"].ToString();
        private string emailPassword = ConfigurationManager.AppSettings["EmailPassword"].ToString();
        private string emailPort = ConfigurationManager.AppSettings["EmailPort"].ToString();

        public DataTable getByDataTable(string query)
        {
            DataTable result = null;
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        result = new DataTable();
                        result.Load(dataReader);
                    }
                    connection.Close();
                }
                return result;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return null;
            }
        }

        public DataRow getByDataRow(string query)
        {
            DataRow result = null;
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        DataTable dataTable = new DataTable();
                        dataTable.Load(dataReader);
                        foreach(DataRow dataRow in dataTable.Rows)
                        {
                            result = dataRow;
                        }
                    }
                    connection.Close();
                }

                return result;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return null;
            }
        }

        public string getRandonString(int length)
        {
            const string src = "abcdefghijklmnopqrstuvwxy0123456789";
            var sb = new StringBuilder();
            Random RNG = new Random();
            for (var i = 0; i < length; i++)
            {
                var c = src[RNG.Next(0, src.Length)];
                sb.Append(c);
            }

            return sb.ToString();
        }

        public bool populateGridViewByQuery(GridView gridViewObjectName, string sqlStatement)
        {
            try
            {
                bool result = false;

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = sqlStatement;

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);

                    gridViewObjectName.DataSource = dataSet;
                    gridViewObjectName.DataBind();

                    dataSet.Dispose();
                    connection.Close();
                    result = true;
                }

                return result;
            }
            catch (Exception ex)
            {
                return this.handlingErrorResult(gridViewObjectName, ex);
            }
        }

        public bool populateGridViewByTableName(GridView gridViewObjectName, string tableName)
        {
            try
            {
                bool result = false;

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM " + tableName;

                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataAdapter dataAdapter = new MySqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);

                    gridViewObjectName.DataSource = dataSet;
                    gridViewObjectName.DataBind();

                    dataSet.Dispose();
                    connection.Close();
                    result = true;
                }

                return result;
            }
            catch (Exception ex)
            {
                return this.handlingErrorResult(gridViewObjectName, ex);
            }
        }

        public void sendEmailNotification(string emailTo, string title, string message)
        {
            try
            {
                using (MailMessage mm = new MailMessage(emailUser, emailTo))
                {
                    string body = message;

                    mm.Subject = title;
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    mm.From = new MailAddress(emailUser, "STI Baliuag OHRMS");

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = emailHost;
                    smtp.EnableSsl = true;

                    smtp.UseDefaultCredentials = false;
                    NetworkCredential NetworkCred = new NetworkCredential(emailUser, emailPassword);
                    smtp.Credentials = NetworkCred;
                    smtp.Port = int.Parse(emailPort);
                    smtp.Send(mm);
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
            }
        }

        public int stringDayOfWeekToInteger(string week)
        {
            try
            {
                DayOfWeek dayOfWeek = (DayOfWeek)Enum.Parse(typeof(DayOfWeek), week);
                return (int)dayOfWeek;
            }
            catch (Exception)
            {
                throw new Exception(week + "is invalid week name.");
            }

        }

        public string stringLatinTimeToMilitaryTime(string time)
        {
            string result = string.Empty;

            try
            {
                if (time.Contains("AM") || time.Contains("am") || time.Contains("Am") || time.Contains("aM"))
                {
                    string timeConvert = time.Trim().ToLower().Replace(" am", "");

                    char[] charSeparators = new char[] { ':' };

                    string[] times = timeConvert.Split(charSeparators);

                    int ctr = 0;
                    foreach (var x in times)
                    {
                        if (ctr == 0)
                        {
                            if (int.Parse(x) == 12)
                            {
                                result = (int.Parse(x) + 12).ToString() + ":";
                            }
                            else
                            {
                                result = int.Parse(x).ToString() + ":";
                            }
                            ctr++;
                        }
                        else
                        {
                            result += x + ":";
                        }
                    }

                    result = result.Remove(result.Length - 1, 1);

                }
                else if (time.Contains("PM") || time.Contains("pm") || time.Contains("Pm") || time.Contains("pM"))
                {
                    string timeConvert = time.Trim().ToLower().Replace(" pm", "");

                    char[] charSeparators = new char[] { ':' };

                    string[] times = timeConvert.Split(charSeparators);

                    int ctr = 0;
                    foreach (var x in times)
                    {
                        if (ctr == 0)
                        {
                            if (int.Parse(x) == 12)
                            {
                                result = int.Parse(x).ToString() + ":";
                            }
                            else
                            {
                                result = (int.Parse(x) + 12).ToString() + ":";
                            }
                            ctr++;
                        } 
                        else
                        {
                            result += x + ":";
                        }
                    }

                    result = result.Remove(result.Length - 1, 1);
                }
                else
                {
                    result = time;
                }

                return result;
            }
            catch (Exception)
            {
                throw new Exception(time + "is invalid week name.");
            }
        }

        public string getHtmlContent(string Url)
        {
            HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(Url);
            myRequest.Method = "GET";
            WebResponse myResponse = myRequest.GetResponse();
            StreamReader sr = new StreamReader(myResponse.GetResponseStream(), Encoding.UTF8);
            string result = sr.ReadToEnd();
            sr.Close();
            myResponse.Close();

            return result;
        }

        private bool handlingErrorResult(GridView gridView, Exception ex)
        {
            Console.Error.WriteLine("Service Error: " + ex.Message);
            gridView.DataSource = null;
            gridView.DataBind();
            return false;
        }
    }
}