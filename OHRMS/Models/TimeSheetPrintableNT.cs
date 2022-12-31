namespace OHRMS.Models
{
    public class TimeSheetPrintableNT
    {
        public string inOutTag { set; get; }
        public string employeeTimeLog { set; get; }
        public string scheduleTimeLog { set; get; }
        public string overTime { set; get; }
        public string underTime { set; get; }
        public string late { set; get; }
        public string recordedDate { set; get; }
    }
}