using Microsoft.EntityFrameworkCore;
using UniProject.DataLayer;
using UniProject.Repositories;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<UniProjectContext>(option =>
{
    option.UseSqlServer(builder.Configuration.GetConnectionString("UniProjectContext"));
});
#region IoC
builder.Services.AddScoped<IUserRepository, UserRepository>();
#endregion


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
