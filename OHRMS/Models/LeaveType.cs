using System;

namespace OHRMS.Models
{
    public class LeaveType
    {
        public int id { set; get; }
        public string leaveTypeCode { set; get; }
        public string leaveTypeName { set; get; }
        public string leaveTypeDescription { set; get; }
        public int maximumAllottedDays { set; get; }
    }
}