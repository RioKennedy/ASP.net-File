using EmployeeManagement.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
var connectionString = "server=localhost;user=root;password=1234;database=EmployeeDB";
var serverVersion = new MySqlServerVersion(new Version(10,4,28));
builder.Services.AddDbContextPool<AppDbContext>(options => options
                .UseMySql(connectionString:connectionString,serverVersion: serverVersion)
                .LogTo(Console.WriteLine, LogLevel.Information)
                .EnableSensitiveDataLogging()
                .EnableDetailedErrors());
builder.Services.AddMvc(option => option.EnableEndpointRouting = false).AddXmlSerializerFormatters();
builder.Services.AddScoped<IEmployeeRepository,SQLEmployeeRepository>();
var app = builder.Build();
ILogger logger = app.Logger;
IConfiguration configuration = app.Configuration;
IWebHostEnvironment environment = app.Environment;

if (environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseStatusCodePagesWithReExecute("/Error/{0}");
}


app.UseStaticFiles();
// app.UseMvcWithDefaultRoute();
app.UseMvc(route => {
    route.MapRoute("default", "{controller=Home}/{action=Index}/{id?}");
});

// app.Run(async a => 
// {
//     await a.Response.WriteAsync(builder.Configuration.GetConnectionString("database") ?? "");
// });
app.Run();



