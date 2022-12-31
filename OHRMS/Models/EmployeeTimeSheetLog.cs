using System;

namespace OHRMS.Models
{
    public class EmployeeTimeSheetLog
    {
        public string batchId { set; get; }
        public string employeeNo { set; get; }
        public DateTime timeLog { set; get; }
        public string dayOfWeek { set; get; }
        public string subject { set; get; }
        public TimeSpan subjectTimeIn { set; get; }
        public TimeSpan subjectTimeOut { set; get; }
        public TimeSpan employeeTimeIn { set; get; }
        public TimeSpan employeeTimeOut { set; get; }
    }
}