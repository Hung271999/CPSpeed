using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace CPSeed.Models
{
    public partial class CPSeedContext : DbContext
    {
        public CPSeedContext()
            : base("name=CPSeedConnectString")
        {
        }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Inventory> Inventories { get; set; }
        public virtual DbSet<InventoryHistory> InventoryHistories { get; set; }
        public virtual DbSet<Invoice> Invoices { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductType> ProductTypes { get; set; }
        public virtual DbSet<ProductUnit> ProductUnits { get; set; }
        public virtual DbSet<Promotion> Promotions { get; set; }
        public virtual DbSet<Provider> Providers { get; set; }
        public virtual DbSet<Store> Stores { get; set; }
        public virtual DbSet<Unit> Units { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Post> Posts { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Slide> Slides { get; set; }
        public virtual DbSet<News> News { get; set; }
        public virtual DbSet<NewDetail> NewDetails { get; set; }

        public virtual DbSet<Images> Images { get; set; }
        public virtual DbSet<Contactus> Contactus { get; set; }
        public virtual DbSet<Order> Orders { get; set; }

        public virtual DbSet<OrderDetail> OrderDetails { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Employee>()
                .Property(e => e.BasicSalary)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Inventory>()
                .Property(e => e.BuyPrice)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Inventory>()
                .Property(e => e.SellPrice)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Inventory>()
                .Property(e => e.Quantity)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Inventory>()
                .Property(e => e.QuantityOrder)
                .HasPrecision(18, 0);

            modelBuilder.Entity<InventoryHistory>()
                .Property(e => e.Quantity)
                .HasPrecision(18, 0);

            modelBuilder.Entity<InventoryHistory>()
                .Property(e => e.QuantityOffer)
                .HasPrecision(18, 0);

            modelBuilder.Entity<InventoryHistory>()
                .Property(e => e.BuyPrice)
                .HasPrecision(19, 4);

            modelBuilder.Entity<InventoryHistory>()
                .Property(e => e.SellPrice)
                .HasPrecision(19, 4);

            modelBuilder.Entity<InventoryHistory>()
                .Property(e => e.AmountBuy)
                .HasPrecision(19, 4);

            modelBuilder.Entity<InventoryHistory>()
                .Property(e => e.AmountSell)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.Amount)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.TotalAmount)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Product>()
                .Property(e => e.BuyPriceCurrent)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Product>()
                .Property(e => e.BuyPricePrevious)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Product>()
                .Property(e => e.BuyPriceAverage)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Product>()
                .Property(e => e.SellPrice)
                .HasPrecision(19, 4);

            modelBuilder.Entity<ProductUnit>()
                .Property(e => e.Quantity)
                .HasPrecision(18, 0);
        }
    }
}
