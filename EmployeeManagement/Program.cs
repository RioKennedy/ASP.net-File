var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
ILogger logger = app.Logger;


IConfiguration configuration = app.Configuration;
app.Use(async (a,next) => 
{
    logger.LogInformation("MW1: Incoming Request");
    await next();
    logger.LogInformation("MW1: Outgoing Response");
});

app.Use(async (a,next) => 
{
    logger.LogInformation("MW2: Incoming Request");
    await next();
    logger.LogInformation("MW2: Outgoing Response");
});

app.Run(async a => 
{
    await a.Response.WriteAsync("MW3: Request handled and response produced");
    logger.LogInformation("MW3: Request handled and response");
});
app.Run();
