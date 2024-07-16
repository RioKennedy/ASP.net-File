var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();


IConfiguration configuration = app.Configuration;
app.MapGet("/", () => configuration["MyKey"]);


app.Run();
