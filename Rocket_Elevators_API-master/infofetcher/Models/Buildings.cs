using System;
using System.Collections.Generic;

namespace infofetcher.Models
{
    public partial class Buildings
    {
        public Buildings()
        {
            Batteries = new HashSet<Batteries>();
            BuildingDetails = new HashSet<BuildingDetails>();
        }

        public long Id { get; set; }
        public long? CustomerId { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public long? AddressId { get; set; }
        public string AdministratorFullName { get; set; }
        public string AdministratorPhone { get; set; }
        public string AdministratorEmail { get; set; }
        public string TechnicianFullName { get; set; }
        public string TechnicianPhone { get; set; }
        public string TechnicianEmail { get; set; }
        public string BuildingName { get; set; }

        public virtual Addresses Address { get; set; }
        public virtual Customers Customer { get; set; }
        public virtual ICollection<Batteries> Batteries { get; set; }
        public virtual ICollection<BuildingDetails> BuildingDetails { get; set; }
    }
}
