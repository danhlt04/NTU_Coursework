using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace AttendanceAPI.Data;

public class AppDbContextFactory : IDesignTimeDbContextFactory<AppDbContext>
{
    public AppDbContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<AppDbContext>();
        optionsBuilder.UseSqlServer(
            "Server=tenmaytoi\\SQLEXPRESS01;Database=AttendanceDB;Trusted_Connection=True;TrustServerCertificate=True;"
        );
        return new AppDbContext(optionsBuilder.Options);
    }
}