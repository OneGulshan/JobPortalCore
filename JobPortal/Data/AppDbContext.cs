using JobPortal.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace JobPortal.Data
{
    public class AppDbContext(DbContextOptions<AppDbContext> options) : IdentityDbContext<ApplicationUser>(options)
    {
        public DbSet<Employee> Employees { get; set; }
        public DbSet<JobProfile> JobProfile { get; set; }
        public DbSet<Skills> Skills { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<State> States { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Company> Companies { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<JobPost> JobPosts { get; set; }
    }
}
