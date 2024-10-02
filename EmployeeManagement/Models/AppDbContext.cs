using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace EmployeeManagement.Models
{
    public class AppDbContext : IdentityDbContext<ApplicationUser>
    {

        // protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        // {
        //     // var connectionString = "server=localhost;user=root;password=1234;database=EmployeeDB";
        //     // var serverVersion = new MySqlServerVersion(new Version(10,4,28));
        //     // optionsBuilder.UseMySql(connectionString,serverVersion);
        // }
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
            
        }
        public DbSet<Employee> Employees { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Seed();

            foreach(var foreignKey in modelBuilder.Model.GetEntityTypes().SelectMany(e => e.GetForeignKeys()))
            {
                foreignKey.DeleteBehavior = DeleteBehavior.Restrict;
            }
        }
    }
}