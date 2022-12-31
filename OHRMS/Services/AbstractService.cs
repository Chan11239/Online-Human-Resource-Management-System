using System.Configuration;

namespace OHRMS.Services
{
    public abstract class AbstractService
    {
        public string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStrings"].ToString();
    }
}