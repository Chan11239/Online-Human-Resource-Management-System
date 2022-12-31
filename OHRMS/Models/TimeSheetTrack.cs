using Ganss.Excel;

namespace OHRMS.Models
{
    public class TimeSheetTrack
    {
        [Column(1)]
        public string Department { set; get; }
        [Column(2)]
        public string EmployeeNo { set; get; }
        [Column(3)]
        public string EmployeeName { set; get; }
        [Column(4)]
        public string TrackDateTime { set; get; }
        [Column(5)]
        public string Status { set; get; }
        [Column(6)]
        public string TerminalNo { set; get; }
    }
}