using Microsoft.EntityFrameworkCore;
using ApiEmpresa.Models;

var builder = WebApplication.CreateBuilder(args);
string? cadenaMysql = builder.Configuration.GetConnectionString("MYSQL_LOCAL") ?? "";
string? cadenaSqlServer = builder.Configuration.GetConnectionString("SQL_SERVER_LOCAL") ?? "";

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddOpenApi();
builder.Services.AddDbContext<Conexiones>(opt =>
    //opt.UseSqlServer(cadenaSqlServer)); // Para utilizar SQL Server como BD
    opt.UseMySQL(cadenaMysql)); // Para utilizar MySQL Server como BD

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
    app.UseSwaggerUi(options =>
    {
        options.DocumentPath = "/openapi/v1.json";
    });
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();
app.Run();
