using System;

namespace OHRMS.Models
{
    public class Applicant : AbstractModel
    {
        public string firstName { set; get; }
        public string lastName { set; get; }
        public string middleName { set; get; }
        public string fullName { set; get; }
        public string appliedPosition { set; get; }
        public string attachedResume { set; get; }
        public string intialInterview { set; get; }
        public DateTime intialInterviewDate { set; get; }
        public TimeSpan intialInterviewTime { set; get; }
        public string intialInterviewPlace { set; get; }
        public string teachingDemo { set; get; }
        public DateTime teachingDemoDate { set; get; }
        public TimeSpan teachingDemoTime { set; get; }
        public string teachingDemoPlace { set; get; }
        public string examination { set; get; }
        public DateTime examinationDate { set; get; }
        public TimeSpan examinationTime { set; get; }
        public string examinationPlace { set; get; }
        public string finalInterview { set; get; }
        public DateTime finalInterviewDate { set; get; }
        public TimeSpan finalInterviewTime { set; get; }
        public string finalInterviewPlace { set; get; }
        public string status { set; get; }
        public string email { set; get; }
        public DateTime hiredDate { set; get; }
        public DateTime rejectedDate { set; get; }
        public int postedJobReferenceId { set; get; }
    }
}