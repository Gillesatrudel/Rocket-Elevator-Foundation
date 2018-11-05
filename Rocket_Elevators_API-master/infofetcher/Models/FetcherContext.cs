using Microsoft.EntityFrameworkCore;

namespace infofetcher.Models
{
    public class FetcherContext : DbContext
    {
        public FetcherContext(DbContextOptions<FetcherContext> options)
            : base(options)
        {
        }

        public DbSet<Elevators> elevators { get; set; }
    }
}