using EmployeeManagement.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.EntityFrameworkCore;
using NLog.Web;

var builder = WebApplication.CreateBuilder(args);
var connectionString = "server=localhost;user=root;password=1234;database=EmployeeDB";
var serverVersion = new MySqlServerVersion(new Version(10,4,28));
builder.Services.AddDbContextPool<AppDbContext>(options => options
                .UseMySql(connectionString:connectionString,serverVersion: serverVersion)
                .LogTo(Console.WriteLine, LogLevel.Information)
                .EnableSensitiveDataLogging()
                .EnableDetailedErrors());

builder.Services.AddIdentity<ApplicationUser, IdentityRole>(
    options =>
{
    options.Password.RequiredLength = 10;
    options.Password.RequiredUniqueChars = 3;
    
}
).AddEntityFrameworkStores<AppDbContext>();
builder.Services.AddMvc(option => 
{
    option.EnableEndpointRouting = false;
    var policy = new AuthorizationPolicyBuilder().RequireAuthenticatedUser().Build();
    option.Filters.Add(new AuthorizeFilter(policy));
}).AddXmlSerializerFormatters();

builder.Services.AddAuthorization(
    options => options.AddPolicy("DeleteRolePolicy", policy => policy.RequireClaim("Delete Role"))
    );
builder.Services.AddScoped<IEmployeeRepository,SQLEmployeeRepository>();

// builder.Logging.ClearProviders();
builder.WebHost.UseNLog();
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
    app.UseExceptionHandler("/Error");
    app.UseStatusCodePagesWithReExecute("/Error/{0}");
}


app.UseStaticFiles();
// app.UseMvcWithDefaultRoute();
app.UseAuthentication();
app.UseMvc(route => {
    route.MapRoute("default", "{controller=Home}/{action=Index}/{id?}");
});

// app.Run(async a => 
// {
//     await a.Response.WriteAsync(builder.Configuration.GetConnectionString("database") ?? "");
// });
app.Run();



