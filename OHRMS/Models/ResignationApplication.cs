using System;

namespace OHRMS.Models
{
    public class ResignationApplication : AbstractModel
    {
        public string employeeNo { set; get; }
        public string employeeName { set; get; }
        public string deliverTo { set; get; }
        public string message { set; get; }
        public DateTime effectivityDate { set; get; } = DateTime.Now;
        public string status { set; get; }
        public string approver { set; get; }
        public string fileName { set; get; }
    }
}