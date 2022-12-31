using System;

namespace OHRMS.Models
{
    public class LeaveApplication : AbstractModel
    {
        public string typeOfLeave { set; get; }
        public string employeeNo { set; get; }
        public string employeeName { set; get; }
        public string department { set; get; }
        public string reasons { set; get; }
        public DateTime startDate { set; get; }
        public DateTime endDate { set; get; }
        public string status { set; get; }
        public string approver { set; get; }
    }
}