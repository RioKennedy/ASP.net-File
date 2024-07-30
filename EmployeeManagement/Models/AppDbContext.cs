using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace EmployeeManagement.Models
{
    public class AppDbContext : DbContext
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
            modelBuilder.Seed();
        }
    }
}