using System;
using System.Collections.Generic;

namespace infofetcher.Models
{
    public partial class Elevators
    {
        public long id { get; set; }
        public long? column_id { get; set; }
        public int? serial_number { get; set; }
        public string model { get; set; }
        public string building_type { get; set; }
        public string status { get; set; }
        public DateTime? in_service_since { get; set; }
        public DateTime? last_inspection { get; set; }
        public string inspection_certificate { get; set; }
        public string information { get; set; }
        public string notes { get; set; }
        public DateTime created_at { get; set; }
        public DateTime updated_at { get; set; }

        public virtual Columns Column { get; set; }
    }
}
