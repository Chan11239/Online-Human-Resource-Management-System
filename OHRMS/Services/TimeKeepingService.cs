using MySql.Data.MySqlClient;
using OHRMS.Enums;
using OHRMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;

namespace OHRMS.Services
{
    public class TimeKeepingService
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
        private WebHelperControllerService webHelperService = new WebHelperControllerService();

        public bool saveTimeKeepingRecord(TimeSheetTrack timeSheetTrack, string batchId, string originFileName, string systemFileName)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO TimeKeepingRecords " +
                                   "(batchId, departmentName, employeeNumber, employeeName, recordDateTime, timeRecordType, " +
                                   "machineTerminalNo, originalFileName, uploadFileName, recordDate, recordTime) " +
                                   "VALUES " +
                                   "(@batchId, @departmentName, @employeeNumber, @employeeName, @recordDateTime, @timeRecordType, " +
                                   "@machineTerminalNo, @originalFileName, @uploadFileName, @recordDate, @recordTime)";

                    DateTime trackDateTime = DateTime.Parse(timeSheetTrack.TrackDateTime);

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@batchId", batchId);
                    command.Parameters.AddWithValue("@departmentName", timeSheetTrack.Department);
                    command.Parameters.AddWithValue("@employeeNumber", timeSheetTrack.EmployeeNo);
                    command.Parameters.AddWithValue("@employeeName", timeSheetTrack.EmployeeName);
                    command.Parameters.AddWithValue("@recordDateTime", trackDateTime);
                    command.Parameters.AddWithValue("@timeRecordType", timeRecordType(timeSheetTrack.Status));
                    command.Parameters.AddWithValue("@machineTerminalNo", timeSheetTrack.TerminalNo);
                    command.Parameters.AddWithValue("@originalFileName", originFileName);
                    command.Parameters.AddWithValue("@uploadFileName", systemFileName);
                    command.Parameters.AddWithValue("@recordDate", trackDateTime.ToString("yyyy-MM-dd"));
                    command.Parameters.AddWithValue("@recordTime", trackDateTime.ToString("HH:mm:ss"));
                    command.ExecuteNonQuery();

                    connection.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }

        public int countTimeKeepingRecord(string batchId)
        {
            int records = 0;
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT COUNT(*) recordCount " +
                                   "FROM TimeKeepingRecords " +
                                   "WHERE batchId = '" + batchId + "' ";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        while (dataReader.Read())
                        {
                            records = int.Parse(dataReader["recordCount"].ToString());
                            dataReader.NextResult();
                        }
                    }
                    connection.Close();
                }
                return records;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return 0;
            }
        }

        public bool saveEmployeeSchedulePlan(SchedulePlan schedulePlan, string batchId, string originFileName, string systemFileName, DateTime uploadDate, int schoolYear, string semister, DateTime semisterStartDate)
        {
            try
            {
                int weekNumber = webHelperService.stringDayOfWeekToInteger(schedulePlan.dayOfWeek);
                string periodFrom = webHelperService.stringLatinTimeToMilitaryTime(schedulePlan.periodFrom);
                string periodTo = webHelperService.stringLatinTimeToMilitaryTime(schedulePlan.periodTo);

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO EmployeeSchedulePlans " +
                                   "(employeeNumber, subjectName, dayOfWeekNo, dayOfWeekName, periodFrom, periodTo, section, originalFileName, uploadFileName, uploadedDate, schoolYear, semisterBatch, semisterStartDate) " +
                                   "VALUES " +
                                   "(@employeeNumber, @subjectName, @dayOfWeekNo, @dayOfWeekName, @periodFrom, @periodTo, @section, @originalFileName, @uploadFileName, NOW(), @schoolYear, @semisterBatch, @semisterStartDate) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNumber", schedulePlan.EmployeeNo);
                    command.Parameters.AddWithValue("@subjectName", schedulePlan.subjectName);
                    command.Parameters.AddWithValue("@dayOfWeekNo", weekNumber);
                    command.Parameters.AddWithValue("@dayOfWeekName", schedulePlan.dayOfWeek);
                    command.Parameters.AddWithValue("@periodFrom", periodFrom);
                    command.Parameters.AddWithValue("@periodTo", periodTo);
                    command.Parameters.AddWithValue("@section", schedulePlan.section);
                    command.Parameters.AddWithValue("@originalFileName", originFileName);
                    command.Parameters.AddWithValue("@uploadFileName", systemFileName);
                    command.Parameters.AddWithValue("@schoolYear", schoolYear);
                    command.Parameters.AddWithValue("@semisterBatch", semister);
                    command.Parameters.AddWithValue("@semisterStartDate", semisterStartDate.ToString("yyyy-MM-dd"));

                    command.ExecuteNonQuery();

                    connection.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }

        public bool saveEmployeeSchedulePlan(string employeeNo, string dayOfWeek, string inputPeriodFrom, string inputPeriodTo)
        {
            try
            {
                int weekNumber = webHelperService.stringDayOfWeekToInteger(dayOfWeek);
                string periodFrom = webHelperService.stringLatinTimeToMilitaryTime(inputPeriodFrom);
                string periodTo = webHelperService.stringLatinTimeToMilitaryTime(inputPeriodTo);

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO EmployeeSchedulePlans " +
                                   "(employeeNumber, dayOfWeekNo, dayOfWeekName, periodFrom, periodTo, originalFileName, uploadFileName, uploadedDate) " +
                                   "VALUES " +
                                   "(@employeeNumber, @dayOfWeekNo, @dayOfWeekName, @periodFrom, @periodTo, @originalFileName, @uploadFileName, NOW()) ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNumber", employeeNo);
                    command.Parameters.AddWithValue("@dayOfWeekNo", weekNumber);
                    command.Parameters.AddWithValue("@dayOfWeekName", dayOfWeek);
                    command.Parameters.AddWithValue("@periodFrom", periodFrom);
                    command.Parameters.AddWithValue("@periodTo", periodTo);
                    command.Parameters.AddWithValue("@originalFileName", "-");
                    command.Parameters.AddWithValue("@uploadFileName", "-");

                    command.ExecuteNonQuery();

                    connection.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }

        public bool updateEmployeeSchedulePlan(int id, string employeeNo, string dayOfWeek, string inputPeriodFrom, string inputPeriodTo)
        {
            try
            {
                int weekNumber = webHelperService.stringDayOfWeekToInteger(dayOfWeek);
                string periodFrom = webHelperService.stringLatinTimeToMilitaryTime(inputPeriodFrom);
                string periodTo = webHelperService.stringLatinTimeToMilitaryTime(inputPeriodTo);

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE EmployeeSchedulePlans " +
                                   "SET employeeNumber = @employeeNumber, " +
                                   "dayOfWeekNo = @dayOfWeekNo, " +
                                   "dayOfWeekName = @dayOfWeekName, " +
                                   "periodFrom = @periodFrom, " +
                                   "periodTo = @periodTo " +
                                   "WHERE id = @id ";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@employeeNumber", employeeNo);
                    command.Parameters.AddWithValue("@dayOfWeekNo", weekNumber);
                    command.Parameters.AddWithValue("@dayOfWeekName", dayOfWeek);
                    command.Parameters.AddWithValue("@periodFrom", periodFrom);
                    command.Parameters.AddWithValue("@periodTo", periodTo);
                    command.Parameters.AddWithValue("@originalFileName", "-");
                    command.Parameters.AddWithValue("@uploadFileName", "-");
                    command.Parameters.AddWithValue("@id", id);

                    command.ExecuteNonQuery();

                    connection.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }

        public bool existEmployeeSchedulePlan(string employeeNo, string semisterBatch, int semisterYear)
        {
            bool result = false;

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * " +
                                   "FROM EmployeeSchedulePlans " +
                                   "WHERE employeeNumber = '" + employeeNo + "' " +
                                   "AND semisterBatch = '" + semisterBatch + "' " +
                                   "AND schoolYear = " + semisterYear.ToString();
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        result = true;
                    }
                    connection.Close();
                }
                return result;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return true;
            }
        }

        public int countEmployeeSchedulePlan(string fileName)
        {
            int records = 0;
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT COUNT(*) recordCount " +
                                   "FROM EmployeeSchedulePlans " +
                                   "WHERE uploadFileName = '" + fileName + "' ";
                    MySqlCommand command = new MySqlCommand(query, connection);
                    MySqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows)
                    {
                        while (dataReader.Read())
                        {
                            records = int.Parse(dataReader["recordCount"].ToString());
                            dataReader.NextResult();
                        }
                    }
                    connection.Close();
                }
                return records;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return 0;
            }
        }

        public List<EmployeeTimeSheetLog> processEmployeeTimeLogs(string employeeNo, DateTime startDate, DateTime endDate)
        {
            DateTime processDate = startDate;
            List<EmployeeTimeSheetLog> employeeTimeLogs = new List<EmployeeTimeSheetLog>();
            string query = string.Empty;

            query = "SELECT * " +
                    "FROM TimeKeepingRecords " +
                    "WHERE employeeNumber = '" + employeeNo + "' " +
                    "AND recordDateTime BETWEEN '" + startDate.ToString("yyyy-MM-dd") + " 00:00:00' AND '" + endDate.ToString("yyyy-MM-dd") + " 23:59:59' ";
            DataTable dtTimeSheet = webHelperService.getByDataTable(query);
            if (dtTimeSheet == null)
            {
                return new List<EmployeeTimeSheetLog>();
            }

            while (processDate <= endDate)
            {
                string weekName = processDate.DayOfWeek.ToString();

                query = "SELECT * " +
                        "FROM EmployeeSchedulePlans " +
                        "WHERE employeeNumber = '" + employeeNo + "' " +
                        "AND dayOfWeekName = '" + weekName + "' " +
                        "AND isActive = 1 " +
                        "ORDER BY dayOfWeekNo ASC, dayOfWeekNo ASC";
                DataTable dt = webHelperService.getByDataTable(query);


                if (dt != null)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        EmployeeTimeSheetLog employeeTimeLog = new EmployeeTimeSheetLog();
                        employeeTimeLog.employeeNo = employeeNo;
                        employeeTimeLog.timeLog = processDate;
                        employeeTimeLog.dayOfWeek = weekName;

                        employeeTimeLog.subject = row["subjectName"].ToString();
                        employeeTimeLog.subjectTimeIn = TimeSpan.Parse(row["periodFrom"].ToString());
                        employeeTimeLog.subjectTimeOut = TimeSpan.Parse(row["periodTo"].ToString());

                        employeeTimeLogs.Add(employeeTimeLog);
                    }
                }

                if (dt == null)
                {
                    EmployeeTimeSheetLog employeeTimeLog = new EmployeeTimeSheetLog();
                    employeeTimeLog.employeeNo = employeeNo;
                    employeeTimeLog.timeLog = processDate;
                    employeeTimeLog.dayOfWeek = weekName;

                    employeeTimeLog.subject = string.Empty;
                    employeeTimeLog.subjectTimeIn = TimeSpan.Parse("00:00:00");
                    employeeTimeLog.subjectTimeOut = TimeSpan.Parse("00:00:00");

                    employeeTimeLogs.Add(employeeTimeLog);
                }

                processDate = processDate.AddDays(1);
            }


            foreach (EmployeeTimeSheetLog employeeTimeLog in employeeTimeLogs)
            {
                TimeSpan virtualTime = TimeSpan.MinValue;
                employeeTimeLog.employeeTimeIn = TimeSpan.Parse("00:00:00");
                employeeTimeLog.employeeTimeOut = TimeSpan.Parse("00:00:00");

                //if (employeeTimeLog.subject != string.Empty)
                //{
                    // TIME IN
                    query = "SELECT DAYNAME(a.recordDateTime), a.recordDateTime, a.recordDate, a.recordTime, a.timeRecordType " +
                            "FROM TimeKeepingRecords a " +
                            "WHERE a.recordDate = '" + employeeTimeLog.timeLog.ToString("yyyy-MM-dd") + "' " +
                            "AND a.timeRecordType = 'TimeIn' " +
                            "AND a.recordTime <= '" + employeeTimeLog.subjectTimeIn.ToString() + "' " +
                            "ORDER BY a.recordDateTime ASC " +
                            "LIMIT 1;";
                    DataRow UpdateRowIn = webHelperService.getByDataRow(query);
                    if (UpdateRowIn != null)
                    {
                        virtualTime = TimeSpan.Parse(UpdateRowIn["recordTime"].ToString());
                        if (employeeTimeLog.subjectTimeIn >= virtualTime)
                        {
                            employeeTimeLog.employeeTimeIn = employeeTimeLog.subjectTimeIn;
                        }
                        else
                        {
                            employeeTimeLog.employeeTimeIn = virtualTime;
                        }
                    }

                    // TIME CHECK LATE TIME
                    query = "SELECT DAYNAME(a.recordDateTime), a.recordDateTime, a.recordDate, a.recordTime, a.timeRecordType " +
                            "FROM TimeKeepingRecords a " +
                            "WHERE a.recordDate = '" + employeeTimeLog.timeLog.ToString("yyyy-MM-dd") + "' " +
                            "AND a.timeRecordType = 'TimeIn' " +
                            "AND a.recordTime <= '" + employeeTimeLog.subjectTimeOut.ToString() + "' " +
                            "ORDER BY a.recordDateTime ASC " +
                            "LIMIT 1;";
                    DataRow UpdateRowLate = webHelperService.getByDataRow(query);
                    if (UpdateRowLate != null)
                    {
                        virtualTime = TimeSpan.Parse(UpdateRowLate["recordTime"].ToString());
                        if (employeeTimeLog.employeeTimeIn == TimeSpan.Parse("00:00:00"))
                        {
                            if (virtualTime < employeeTimeLog.subjectTimeOut)
                            {
                                employeeTimeLog.employeeTimeIn = virtualTime;
                            }
                        }
                    }

                    // TIME OUT
                    query = "SELECT DAYNAME(a.recordDateTime), a.recordDateTime, a.recordDate, a.recordTime, a.timeRecordType " +
                            "FROM TimeKeepingRecords a " +
                            "WHERE a.recordDate = '" + employeeTimeLog.timeLog.ToString("yyyy-MM-dd") + "' " +
                            "AND a.timeRecordType = 'TimeOut' " +
                            "AND a.recordTime >= '" + employeeTimeLog.subjectTimeOut.ToString() + "' " +
                            "ORDER BY a.recordDateTime ASC " +
                            "LIMIT 1;";
                    DataRow UpdateRowOut = webHelperService.getByDataRow(query);
                    if (UpdateRowOut != null)
                    {
                        virtualTime = TimeSpan.Parse(UpdateRowOut["recordTime"].ToString());
                        if (employeeTimeLog.subjectTimeOut <= virtualTime)
                        {
                            employeeTimeLog.employeeTimeOut = employeeTimeLog.subjectTimeOut;
                        }
                        else
                        {
                            employeeTimeLog.employeeTimeOut = virtualTime;
                        }
                    }

                    // TIME CHECK UNDER TIME
                    query = "SELECT DAYNAME(a.recordDateTime), a.recordDateTime, a.recordDate, a.recordTime, a.timeRecordType " +
                            "FROM TimeKeepingRecords a " +
                            "WHERE a.recordDate = '" + employeeTimeLog.timeLog.ToString("yyyy-MM-dd") + "' " +
                            "AND a.timeRecordType = 'TimeOut' " +
                            "AND a.recordTime <= '" + employeeTimeLog.subjectTimeOut.ToString() + "' " +
                            "ORDER BY a.recordDateTime DESC " +
                            "LIMIT 1;";
                    DataRow UpdateRowUnderTime = webHelperService.getByDataRow(query);
                    if (UpdateRowUnderTime != null)
                    {
                        virtualTime = TimeSpan.Parse(UpdateRowUnderTime["recordTime"].ToString());
                        if (employeeTimeLog.employeeTimeOut == TimeSpan.Parse("00:00:00"))
                        {
                            if (virtualTime > employeeTimeLog.employeeTimeIn)
                            {
                                employeeTimeLog.employeeTimeOut = virtualTime;
                            }
                        }
                    }

                    if (employeeTimeLog.employeeTimeIn == TimeSpan.Parse("00:00:00") || employeeTimeLog.employeeTimeOut == TimeSpan.Parse("00:00:00"))
                    {
                        employeeTimeLog.employeeTimeIn = TimeSpan.Parse("00:00:00");
                        employeeTimeLog.employeeTimeOut = TimeSpan.Parse("00:00:00");
                    }
                //}
            }

            return employeeTimeLogs;
        }

        public bool saveEmployeeTimeLog(EmployeeTimeSheetLog employeeTimeSheetLog)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "INSERT INTO EmployeeTimeLog (" +
                                   "batchId, employeeNo, timeLog, dayOfWeek, subject, subjectTimeIn, subjectTimeOut, employeeTimeIn, employeeTimeOut) " +
                                   "VALUES (" +
                                   "@batchId, @employeeNo, @timeLog, @dayOfWeek, @subject, @subjectTimeIn, @subjectTimeOut, @employeeTimeIn, @employeeTimeOut)";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@batchId", employeeTimeSheetLog.batchId);
                    command.Parameters.AddWithValue("@employeeNo", employeeTimeSheetLog.employeeNo);
                    command.Parameters.AddWithValue("@timeLog", employeeTimeSheetLog.timeLog.ToString("yyyy-MM-dd"));
                    command.Parameters.AddWithValue("@dayOfWeek", employeeTimeSheetLog.dayOfWeek);
                    command.Parameters.AddWithValue("@subject", employeeTimeSheetLog.subject);
                    command.Parameters.AddWithValue("@subjectTimeIn", employeeTimeSheetLog.subjectTimeIn.ToString());
                    command.Parameters.AddWithValue("@subjectTimeOut", employeeTimeSheetLog.subjectTimeOut.ToString());
                    command.Parameters.AddWithValue("@employeeTimeIn", employeeTimeSheetLog.employeeTimeIn.ToString());
                    command.Parameters.AddWithValue("@employeeTimeOut", employeeTimeSheetLog.employeeTimeOut.ToString());

                    command.ExecuteNonQuery();

                    connection.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }

        public bool saveEmployeeTimeLogs(List<EmployeeTimeSheetLog> employeeTimeSheetLogs)
        {
            try
            {
                foreach(EmployeeTimeSheetLog employeeTimeSheetLog in employeeTimeSheetLogs)
                {
                    saveEmployeeTimeLog(employeeTimeSheetLog);
                }
                return true;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }

        private string timeRecordType(string val)
        {
            string result = string.Empty;
            switch (val)
            {
                case "Clock In":
                    result = TimeTrackType.TimeIn.ToString();
                    break;
                case "Clock Out":
                    result = TimeTrackType.TimeOut.ToString();
                    break;
                default:
                    result = "Invalid";
                    break;
            }
            return result;
        }
    
        public bool deleteEmployeeTimeLog(string batchId)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "DELETE FROM EmployeeTimeLog WHERE batchId = '@batchId'";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@batchId", batchId);
                    command.ExecuteNonQuery();

                    connection.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Service Error: " + ex.Message);
                return false;
            }
        }
    }
}