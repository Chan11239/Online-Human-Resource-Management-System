namespace OHRMS.Models
{
    public class RegistrationProfile
    {
        public int id { set; get; }
        public string FirstName { set; get; }
        public string LastName { set; get; }
        public string Email { set; get; }
        public bool isActivate { set; get; }
        public bool isExpired { set; get; }
    }
}