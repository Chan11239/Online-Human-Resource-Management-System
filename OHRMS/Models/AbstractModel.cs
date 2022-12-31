using System;

namespace OHRMS.Models
{
    public abstract class AbstractModel
    {
        public int id { get; set; }
        public DateTime lastModifiedDate { get; set; } = DateTime.Now;
        public bool isActive { get; set; } = true;
    }
}