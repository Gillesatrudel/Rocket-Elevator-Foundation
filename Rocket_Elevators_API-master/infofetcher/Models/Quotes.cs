using System;
using System.Collections.Generic;

namespace infofetcher.Models
{
    public partial class Quotes
    {
        public long Id { get; set; }
        public string Type { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public int? NbAppartments { get; set; }
        public int? NbBasements { get; set; }
        public string QuoteType { get; set; }
        public string FullName { get; set; }
        public string BusinessName { get; set; }
        public string Email { get; set; }
        public string NbFloors { get; set; }
        public int? NbApt { get; set; }
        public int? NbBase { get; set; }
        public int? NbCies { get; set; }
        public int? NbParking { get; set; }
        public int? NbShaft { get; set; }
        public int? NbCorp { get; set; }
        public int? NbPerson { get; set; }
        public int? BusHours { get; set; }
        public int? ReqElev { get; set; }
        public string Option { get; set; }
        public int? NbElev { get; set; }
        public float? PricePerElev { get; set; }
        public float? ElevTotal { get; set; }
        public float? CostInstall { get; set; }
        public float? Total { get; set; }
    }
}
