using System;
using System.Collections.Generic;

namespace infofetcher.Models
{
    public partial class BuildingDetails
    {
        public long Id { get; set; }
        public long? BuildingId { get; set; }
        public string InformationKey { get; set; }
        public string Value { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        public virtual Buildings Building { get; set; }
    }
}
