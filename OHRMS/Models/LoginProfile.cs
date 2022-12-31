namespace OHRMS.Models
{
    public class LoginProfile
    {
        public int id { set; get; }
        public string UserName { set; get; }
        public string FirstName { set; get; }
        public string LastName { set; get; }
        public string MiddleName { set; get; }
        public string UserType { set; get; }
        public string Position { set; get; }
        public string Department { set; get; }
        public string Password { set; get; }
        public string EmployeeClassification { set; get; }
    }
}