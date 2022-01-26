using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Service.DataLayer.Security;
using Service.DataLayer.Models;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace Service.DataLayer.Models
{
    public class AppDbContext : AuditableIdentityContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            //modelBuilder.Seed();
        }

        public DbSet<Service.DataLayer.Models.Product> Product { get; set; }
        public DbSet<Service.DataLayer.Models.UserPassword> UserPassword { get; set; }
        public DbSet<Service.DataLayer.Models.UserTransaction> UserTransaction { get; set; }
    }
}
