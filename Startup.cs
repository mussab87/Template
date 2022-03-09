using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Service.DataLayer.Connection.Configuration;
using Service.DataLayer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Service.DataLayer.Security;
using Service.DataLayer;
using System.IO;
using Newtonsoft.Json;
using System.Dynamic;
using Newtonsoft.Json.Converters;

namespace Template
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            ////string username = "sa";
            ////string password = "123";
            ////string SecretKey = "RSLFEncrypti0nConnect0n@Username&K6yPasswordRSLF";
            ////var testReturnUsername = Crypto.EncryptStringDES(username, SecretKey);
            ////var testReturnPassword = Crypto.EncryptStringDES(password, SecretKey);
            ///

            //change AppSettings file*********************
            //var appSettingsPath = Path.Combine(System.IO.Directory.GetCurrentDirectory(), "appsettings.json");
            //var json = File.ReadAllText(appSettingsPath);

            //var jsonSettings = new JsonSerializerSettings();
            //jsonSettings.Converters.Add(new ExpandoObjectConverter());
            //jsonSettings.Converters.Add(new StringEnumConverter());

            //dynamic config = JsonConvert.DeserializeObject<ExpandoObject>(json, jsonSettings);

            //config.DebugEnabled = true;
            //config.WeatherClientConfig.IsEnabled = true;
            //config.WeatherClientConfig.TemperatureUnits = "Test";

            //var newJson = JsonConvert.SerializeObject(config, Formatting.Indented, jsonSettings);

            //File.WriteAllText(appSettingsPath, newJson);

            //*********************************

            //for decrypt username & password
            string DatabaseConn = DBAppConfigHelper.ConnDb(
                 Configuration.GetConnectionString("ServiceDBConnection"),
                 Configuration.GetConnectionString("DBUsername"),
                 Configuration.GetConnectionString("DBPassword")
                 );            

            

            services.AddEntityFrameworkSqlServer();

            services.AddDbContext<AppDbContext>(
            options => options.UseSqlServer(DatabaseConn));

            services.AddIdentity<ApplicationUser, IdentityRole>(
                o =>
                {
                    // configure identity options
                    o.Password.RequireDigit = false;
                    o.Password.RequireLowercase = false;
                    o.Password.RequireUppercase = false;
                    o.Password.RequireNonAlphanumeric = false;
                    o.Password.RequiredLength = AppConstants.Account.Login.UserPasswordLength;
                }).
                AddEntityFrameworkStores<AppDbContext>()
                .AddDefaultTokenProviders();

            //Auto logout on session expire
            services.ConfigureApplicationCookie(options =>
            {
                options.ExpireTimeSpan = TimeSpan.FromMinutes(AppConstants.Account.Login.UserSessionTimeOut);
                options.LoginPath = "/Account/Login";
                options.SlidingExpiration = true;
            });
            //options => options.UseSqlServer(Configuration.GetConnectionString("ServiceDBConnection")));

            

            //services.AddAuthorization(options =>
            //{
            //    options.AddPolicy("EditRolePolicy", policy =>
            //        policy.AddRequirements(new ManageAdminRolesAndClaimsRequirement()));
            //});

            //services.AddDbContextPool<EmployeeContext>(
            //options => options.UseSqlServer(_config.GetConnectionString("ServiceDBConnection")));

            //services.AddIdentity<IdentityUser, IdentityRole>().
            //    AddEntityFrameworkStores<AppDbContext>();

            services.AddMvc(config => {
                var policy = new AuthorizationPolicyBuilder()
                                .RequireAuthenticatedUser()
                                .Build();
                config.Filters.Add(new AuthorizeFilter(policy));
            });
            services.AddControllersWithViews();

            //services.AddTransient<IEmployeeRepository, MockEmployeeRepository>();
            //services.AddTransient<IOfficeRepository, SQLOfficeRepository>();
            //services.AddTransient<IWorkerRepository, SQLWorkerRepository>();
            services.AddTransient<SeedData>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, SeedData seeder)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            //app.UseSession();
            app.UseStaticFiles();
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            seeder.SeedAdminUser();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
            
        }
    }
}
