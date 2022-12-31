namespace OHRMS.Models
{
    public class AutoNumber : AbstractModel
    {
        public string prefix { set; get; }
        public string suffix { set; get; }
        public int currentSequence { set; get; } = 0;
        public int zeroPadding { set; get; }
        public string displaySequence { set; get; } = string.Empty;
        public string groupType { set; get; }
    }
}