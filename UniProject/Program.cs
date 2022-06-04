using Microsoft.AspNetCore.Authentication.Cookies;
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
builder.Services.AddScoped<IReservRepository, ReservRepository>();
#endregion

#region Authentication
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(option =>
    {
        option.LoginPath = "/User/Login";
        option.LogoutPath = "/User/Logout";
        option.ExpireTimeSpan = TimeSpan.FromDays(200);
    });
#endregion


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
