using Ganss.Excel;

namespace OHRMS.Models
{
    public class SchedulePlan
    {
        [Column(1)]
        public string EmployeeNo { set; get; }
        [Column(2)]
        public string subjectName { set; get; }
        [Column(3)]
        public string dayOfWeek { set; get; }
        [Column(4)]
        public string periodFrom { set; get; }
        [Column(5)]
        public string periodTo { set; get; }
        [Column(6)]
        public string section { set; get; }
    }
}