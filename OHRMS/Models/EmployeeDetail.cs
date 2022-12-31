using System;

namespace OHRMS.Models
{
    public class EmployeeDetail
    {
        public string  employeeNo { set; get; }
        public string lastName { set; get; }
        public string firstName { set; get; }
        public string middleName { set; get; }
        public string fullName { set; get; }
        public string department { set; get; }
        public string position { set; get; }
        public string classification { set; get; }
        public string rankEmployee { set; get; }
        public double salaryRate { set; get; }
        public DateTime dateAppointment { set; get; }
        public string statusOfEmployement { set; get; }
        public string employmentType { set; get; }
        public string newDateAppointment { set; get; }
        public string newDepartment { set; get; }
        public string newPosition { set; get; }
        public DateTime dateSeparation { set; get; }
        public string natureOfSeparation { set; get; }
        public int point { set; get; }
    }
}