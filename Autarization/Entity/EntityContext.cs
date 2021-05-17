using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Autarization.Entity
{
    public partial class EntityContext : DbContext
    {
        public EntityContext()
            : base("name=EntityContext")
        {
        }

        public virtual DbSet<Client> Clients { get; set; }
        public virtual DbSet<Manager> Managers { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Client>()
                .HasMany(e => e.Orders)
                .WithMany(e => e.Clients)
                .Map(m => m.ToTable("ClientHasOrder").MapLeftKey("ClientId").MapRightKey("OrderId"));

            modelBuilder.Entity<Order>()
                .HasMany(e => e.Products)
                .WithMany(e => e.Orders)
                .Map(m => m.ToTable("ListOfProductsInOrder").MapLeftKey("OrderID").MapRightKey("ProductID"));

            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .HasPrecision(7, 2);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Managers)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);
        }
    }
}
