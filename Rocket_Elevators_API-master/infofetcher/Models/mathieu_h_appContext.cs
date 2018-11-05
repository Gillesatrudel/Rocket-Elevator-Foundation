using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace infofetcher.Models
{
    public partial class mathieu_h_appContext : DbContext
    {
        public mathieu_h_appContext()
        {
        }

        public mathieu_h_appContext(DbContextOptions<mathieu_h_appContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Addresses> Addresses { get; set; }
        public virtual DbSet<ArInternalMetadata> ArInternalMetadata { get; set; }
        public virtual DbSet<Batteries> Batteries { get; set; }
        public virtual DbSet<BuildingDetails> BuildingDetails { get; set; }
        public virtual DbSet<Buildings> Buildings { get; set; }
        public virtual DbSet<Columns> Columns { get; set; }
        public virtual DbSet<Customers> Customers { get; set; }
        public virtual DbSet<EfmigrationsHistory> EfmigrationsHistory { get; set; }
        public virtual DbSet<Elevators> Elevators { get; set; }
        public virtual DbSet<Employees> Employees { get; set; }
        public virtual DbSet<Leads> Leads { get; set; }
        public virtual DbSet<Quotes> Quotes { get; set; }
        public virtual DbSet<SchemaMigrations> SchemaMigrations { get; set; }
        public virtual DbSet<Users> Users { get; set; }

       

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Addresses>(entity =>
            {
                entity.ToTable("addresses");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.AddressType)
                    .HasColumnName("address_type")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.City)
                    .HasColumnName("city")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Country)
                    .HasColumnName("country")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.Entity)
                    .HasColumnName("entity")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Notes)
                    .HasColumnName("notes")
                    .HasColumnType("text");

                entity.Property(e => e.State)
                    .HasColumnName("state")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.StreetAddress)
                    .HasColumnName("street_address")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.SuiteOrApt)
                    .HasColumnName("suite_or_apt")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.ZipCode)
                    .HasColumnName("zip_code")
                    .HasColumnType("varchar(255)");
            });

            modelBuilder.Entity<ArInternalMetadata>(entity =>
            {
                entity.HasKey(e => e.Key)
                    .HasName("PRIMARY");

                entity.ToTable("ar_internal_metadata");

                entity.Property(e => e.Key)
                    .HasColumnName("key")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.Value)
                    .HasColumnName("value")
                    .HasColumnType("varchar(255)");
            });

            modelBuilder.Entity<Batteries>(entity =>
            {
                entity.ToTable("batteries");

                entity.HasIndex(e => e.BuildingId)
                    .HasName("index_batteries_on_building_id");

                entity.HasIndex(e => e.EmployeeId)
                    .HasName("index_batteries_on_employee_id");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.BuildingId)
                    .HasColumnName("building_id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.BuildingType)
                    .HasColumnName("building_type")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.EmployeeId)
                    .HasColumnName("employee_id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.InServiceSince)
                    .HasColumnName("in_service_since")
                    .HasColumnType("date");

                entity.Property(e => e.Information)
                    .HasColumnName("information")
                    .HasColumnType("text");

                entity.Property(e => e.LastInspection)
                    .HasColumnName("last_inspection")
                    .HasColumnType("date");

                entity.Property(e => e.Notes)
                    .HasColumnName("notes")
                    .HasColumnType("text");

                entity.Property(e => e.OperationsCertificate)
                    .HasColumnName("operations_certificate")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.Building)
                    .WithMany(p => p.Batteries)
                    .HasForeignKey(d => d.BuildingId)
                    .HasConstraintName("fk_rails_fc40470545");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Batteries)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("fk_rails_ceeeaf55f7");
            });

            modelBuilder.Entity<BuildingDetails>(entity =>
            {
                entity.ToTable("building_details");

                entity.HasIndex(e => e.BuildingId)
                    .HasName("index_building_details_on_building_id");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.BuildingId)
                    .HasColumnName("building_id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.InformationKey)
                    .HasColumnName("information_key")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.Value)
                    .HasColumnName("value")
                    .HasColumnType("varchar(255)");

                entity.HasOne(d => d.Building)
                    .WithMany(p => p.BuildingDetails)
                    .HasForeignKey(d => d.BuildingId)
                    .HasConstraintName("fk_rails_51749f8eac");
            });

            modelBuilder.Entity<Buildings>(entity =>
            {
                entity.ToTable("buildings");

                entity.HasIndex(e => e.AddressId)
                    .HasName("index_buildings_on_address_id");

                entity.HasIndex(e => e.CustomerId)
                    .HasName("index_buildings_on_customer_id");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.AddressId)
                    .HasColumnName("address_id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.AdministratorEmail)
                    .HasColumnName("administrator_email")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.AdministratorFullName)
                    .HasColumnName("administrator_full_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.AdministratorPhone)
                    .HasColumnName("administrator_phone")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.BuildingName)
                    .HasColumnName("building_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.CustomerId)
                    .HasColumnName("customer_id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.TechnicianEmail)
                    .HasColumnName("technician_email")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.TechnicianFullName)
                    .HasColumnName("technician_full_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.TechnicianPhone)
                    .HasColumnName("technician_phone")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.Address)
                    .WithMany(p => p.Buildings)
                    .HasForeignKey(d => d.AddressId)
                    .HasConstraintName("fk_rails_6dc7a885ab");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Buildings)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("fk_rails_c29cbe7fb8");
            });

            modelBuilder.Entity<Columns>(entity =>
            {
                entity.ToTable("columns");

                entity.HasIndex(e => e.BatteryId)
                    .HasName("index_columns_on_battery_id");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.BatteryId)
                    .HasColumnName("battery_id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.BuildingType)
                    .HasColumnName("building_type")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.FloorsServed)
                    .HasColumnName("floors_served")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Information)
                    .HasColumnName("information")
                    .HasColumnType("text");

                entity.Property(e => e.Notes)
                    .HasColumnName("notes")
                    .HasColumnType("text");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.Battery)
                    .WithMany(p => p.Columns)
                    .HasForeignKey(d => d.BatteryId)
                    .HasConstraintName("fk_rails_021eb14ac4");
            });

            modelBuilder.Entity<Customers>(entity =>
            {
                entity.ToTable("customers");

                entity.HasIndex(e => e.AddressId)
                    .HasName("index_customers_on_address_id");

                entity.HasIndex(e => e.LeadId)
                    .HasName("index_customers_on_lead_id");

                entity.HasIndex(e => e.UserId)
                    .HasName("index_customers_on_user_id");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.AddressId)
                    .HasColumnName("address_id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.BusinessDescription)
                    .HasColumnName("business_description")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.BusinessName)
                    .HasColumnName("business_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.ContactEmail)
                    .HasColumnName("contact_email")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.ContactFullName)
                    .HasColumnName("contact_full_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.ContactPhone)
                    .HasColumnName("contact_phone")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.LeadId)
                    .HasColumnName("lead_id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.OriginalFilename)
                    .HasColumnName("original_filename")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.TechnicianEmail)
                    .HasColumnName("technician_email")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.TechnicianFullName)
                    .HasColumnName("technician_full_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.TechnicianPhone)
                    .HasColumnName("technician_phone")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.UserId)
                    .HasColumnName("user_id")
                    .HasColumnType("bigint(20)");

                entity.HasOne(d => d.Address)
                    .WithMany(p => p.Customers)
                    .HasForeignKey(d => d.AddressId)
                    .HasConstraintName("fk_rails_3f9404ba26");

                entity.HasOne(d => d.Lead)
                    .WithMany(p => p.Customers)
                    .HasForeignKey(d => d.LeadId)
                    .HasConstraintName("fk_rails_a94a9623e0");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Customers)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("fk_rails_9917eeaf5d");
            });

            modelBuilder.Entity<EfmigrationsHistory>(entity =>
            {
                entity.HasKey(e => e.MigrationId)
                    .HasName("PRIMARY");

                entity.ToTable("__EFMigrationsHistory");

                entity.Property(e => e.MigrationId).HasColumnType("varchar(95)");

                entity.Property(e => e.ProductVersion)
                    .IsRequired()
                    .HasColumnType("varchar(32)");
            });

            modelBuilder.Entity<Elevators>(entity =>
            {
                entity.ToTable("elevators");

                entity.HasIndex(e => e.column_id)
                    .HasName("index_elevators_on_column_id");

                entity.Property(e => e.id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.building_type)
                    .HasColumnName("building_type")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.column_id)
                    .HasColumnName("column_id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.created_at)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.in_service_since)
                    .HasColumnName("in_service_since")
                    .HasColumnType("date");

                entity.Property(e => e.information)
                    .HasColumnName("information")
                    .HasColumnType("text");

                entity.Property(e => e.inspection_certificate)
                    .HasColumnName("inspection_certificate")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.last_inspection)
                    .HasColumnName("last_inspection")
                    .HasColumnType("date");

                entity.Property(e => e.model)
                    .HasColumnName("model")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.notes)
                    .HasColumnName("notes")
                    .HasColumnType("text");

                entity.Property(e => e.serial_number)
                    .HasColumnName("serial_number")
                    .HasColumnType("int(11)");

                entity.Property(e => e.status)
                    .HasColumnName("status")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.updated_at)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.Column)
                    .WithMany(p => p.Elevators)
                    .HasForeignKey(d => d.column_id)
                    .HasConstraintName("fk_rails_69442d7bc2");
            });

            modelBuilder.Entity<Employees>(entity =>
            {
                entity.ToTable("employees");

                entity.HasIndex(e => e.UserId)
                    .HasName("index_employees_on_user_id");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.FirstName)
                    .HasColumnName("first_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.LastName)
                    .HasColumnName("last_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Phone)
                    .HasColumnName("phone")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Title)
                    .HasColumnName("title")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.UserId)
                    .HasColumnName("user_id")
                    .HasColumnType("bigint(20)");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("fk_rails_dcfd3d4fc3");
            });

            modelBuilder.Entity<Leads>(entity =>
            {
                entity.ToTable("leads");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.CompanyName)
                    .HasColumnName("company_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.Department)
                    .HasColumnName("department")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.file_attachment)
                    .HasColumnName("file_attachment")
                    .HasColumnType("mediumblob");

                entity.Property(e => e.FullName)
                    .HasColumnName("full_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Message)
                    .HasColumnName("message")
                    .HasColumnType("text");

                entity.Property(e => e.OriginalFilename)
                    .HasColumnName("original_filename")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Phone)
                    .HasColumnName("phone")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.ProjectDescription)
                    .HasColumnName("project_description")
                    .HasColumnType("text");

                entity.Property(e => e.ProjectName)
                    .HasColumnName("project_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");
            });

            modelBuilder.Entity<Quotes>(entity =>
            {
                entity.ToTable("quotes");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.BusHours)
                    .HasColumnName("bus_hours")
                    .HasColumnType("int(11)");

                entity.Property(e => e.BusinessName)
                    .HasColumnName("business_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.CostInstall).HasColumnName("cost_install");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.ElevTotal).HasColumnName("elev_total");

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.FullName)
                    .HasColumnName("full_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.NbApt)
                    .HasColumnName("nb_apt")
                    .HasColumnType("int(11)");

                entity.Property(e => e.NbBase)
                    .HasColumnName("nb_base")
                    .HasColumnType("int(11)");

                entity.Property(e => e.NbCies)
                    .HasColumnName("nb_cies")
                    .HasColumnType("int(11)");

                entity.Property(e => e.NbCorp)
                    .HasColumnName("nb_corp")
                    .HasColumnType("int(11)");

                entity.Property(e => e.NbElev)
                    .HasColumnName("nb_elev")
                    .HasColumnType("int(11)");

                entity.Property(e => e.NbFloors)
                    .HasColumnName("nb_floors")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.NbParking)
                    .HasColumnName("nb_parking")
                    .HasColumnType("int(11)");

                entity.Property(e => e.NbPerson)
                    .HasColumnName("nb_person")
                    .HasColumnType("int(11)");

                entity.Property(e => e.NbShaft)
                    .HasColumnName("nb_shaft")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Option)
                    .HasColumnName("option")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.PricePerElev).HasColumnName("price_per_elev");

                entity.Property(e => e.QuoteType)
                    .HasColumnName("quote_type")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.ReqElev)
                    .HasColumnName("req_elev")
                    .HasColumnType("int(11)");

                entity.Property(e => e.Total).HasColumnName("total");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");
            });

            modelBuilder.Entity<SchemaMigrations>(entity =>
            {
                entity.HasKey(e => e.Version)
                    .HasName("PRIMARY");

                entity.ToTable("schema_migrations");

                entity.Property(e => e.Version)
                    .HasColumnName("version")
                    .HasColumnType("varchar(255)");
            });


            modelBuilder.Entity<Users>(entity =>
            {
                entity.ToTable("users");

                entity.HasIndex(e => e.Email)
                    .HasName("index_users_on_email")
                    .IsUnique();

                entity.HasIndex(e => e.ResetPasswordToken)
                    .HasName("index_users_on_reset_password_token")
                    .IsUnique();

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasColumnType("bigint(20)");

                entity.Property(e => e.ConfirmationSentAt)
                    .HasColumnName("confirmation_sent_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.ConfirmationToken)
                    .HasColumnName("confirmation_token")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.ConfirmedAt)
                    .HasColumnName("confirmed_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.CreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasColumnName("email")
                    .HasColumnType("varchar(255)")
                    .HasDefaultValueSql("''");

                entity.Property(e => e.EncryptedPassword)
                    .IsRequired()
                    .HasColumnName("encrypted_password")
                    .HasColumnType("varchar(255)")
                    .HasDefaultValueSql("''");

                entity.Property(e => e.FailedAttempts)
                    .HasColumnName("failed_attempts")
                    .HasColumnType("int(11)")
                    .HasDefaultValueSql("'0'");

                entity.Property(e => e.FirstName)
                    .HasColumnName("first_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.LastName)
                    .HasColumnName("last_name")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.LockedAt)
                    .HasColumnName("locked_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.RememberCreatedAt)
                    .HasColumnName("remember_created_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.ResetPasswordSentAt)
                    .HasColumnName("reset_password_sent_at")
                    .HasColumnType("datetime");

                entity.Property(e => e.ResetPasswordToken)
                    .HasColumnName("reset_password_token")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.Title)
                    .HasColumnName("title")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UnconfirmedEmail)
                    .HasColumnName("unconfirmed_email")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UnlockToken)
                    .HasColumnName("unlock_token")
                    .HasColumnType("varchar(255)");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnName("updated_at")
                    .HasColumnType("datetime");
            });
        }
    }
}
