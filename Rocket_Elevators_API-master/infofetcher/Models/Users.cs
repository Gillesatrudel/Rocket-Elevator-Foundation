using System;
using System.Collections.Generic;

namespace infofetcher.Models
{
    public partial class Users
    {
        public Users()
        {
            Customers = new HashSet<Customers>();
            Employees = new HashSet<Employees>();
        }

        public long Id { get; set; }
        public string Email { get; set; }
        public string EncryptedPassword { get; set; }
        public string ResetPasswordToken { get; set; }
        public DateTime? ResetPasswordSentAt { get; set; }
        public DateTime? RememberCreatedAt { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Title { get; set; }
        public string ConfirmationToken { get; set; }
        public DateTime? ConfirmedAt { get; set; }
        public DateTime? ConfirmationSentAt { get; set; }
        public string UnconfirmedEmail { get; set; }
        public int FailedAttempts { get; set; }
        public string UnlockToken { get; set; }
        public DateTime? LockedAt { get; set; }

        public virtual ICollection<Customers> Customers { get; set; }
        public virtual ICollection<Employees> Employees { get; set; }
    }
}
