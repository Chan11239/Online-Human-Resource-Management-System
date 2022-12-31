using System;

namespace OHRMS.Models
{
    public class EmployeeLeaveCredit : AbstractModel
    {
        public string employeeNo { set; get; }
        public string leaveTypeCode { set; get; }
        public int usedCredits { set; get; }
        public int aquiredCredits { set; get; }
        public DateTime lastUsedCreditReset { set; get; } = DateTime.Now;
    }
}