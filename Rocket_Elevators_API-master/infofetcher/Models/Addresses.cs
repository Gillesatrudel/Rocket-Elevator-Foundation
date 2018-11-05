using System;
using System.Collections.Generic;

namespace infofetcher.Models
{
    public partial class Addresses
    {
        public Addresses()
        {
            Buildings = new HashSet<Buildings>();
            Customers = new HashSet<Customers>();
        }

        public long Id { get; set; }
        public string AddressType { get; set; }
        public string Status { get; set; }
        public string Entity { get; set; }
        public string StreetAddress { get; set; }
        public string SuiteOrApt { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string Country { get; set; }
        public string Notes { get; set; }
        public string State { get; set; }

        public virtual ICollection<Buildings> Buildings { get; set; }
        public virtual ICollection<Customers> Customers { get; set; }
    }
}
