using System;

namespace OHRMS.Models
{
    public class PostedJob : AbstractModel
    {
        public string title { set; get; }
        public string classification { set; get; }
        public string department { set; get; }
        public string jobType { set; get; }
        public DateTime postDuration { set; get; }
        public string educationalQualification { set; get; }
        public string yearExperience { set; get; }
        public string generalQualifiacation { set; get; }
        public string jobResponsibilities { set; get; }
    }
}