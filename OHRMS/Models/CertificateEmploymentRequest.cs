using System;

namespace OHRMS.Models
{
    public class CertificateEmploymentRequest : AbstractModel
    {
        public string employeeNo { set; get; }
        public string employeeName { set; get; }
        public string department { set; get; }
        public string purpose { set; get; }
        public double salary { set; get; }
        public DateTime prescribeAquireDate { set; get; }
        public string coeType { set; get; }
        public string status { set; get; }
        public bool isPrinted { set; get; }
    }
}