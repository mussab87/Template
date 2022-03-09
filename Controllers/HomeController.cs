using Template.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Service.DataLayer.Security;
using Service.DataLayer.Models;
using System.IO;
using Newtonsoft.Json;
using System.Dynamic;
using Newtonsoft.Json.Converters;

namespace Template.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        //private readonly ILogger<HomeController> _logger;

        private readonly UserManager<ApplicationUser> userManager;
        private readonly SignInManager<ApplicationUser> signInManager;
        private readonly RoleManager<IdentityRole> roleManager;
        private readonly AppDbContext _context;

        public HomeController(UserManager<ApplicationUser> userManager,
           SignInManager<ApplicationUser> signInManager,
           RoleManager<IdentityRole> roleManager,
           AppDbContext context)

        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.roleManager = roleManager;
            _context = context;
        }

        //[AllowAnonymous]
        public IActionResult Index()
        {
            return View();
        }

        //[Authorize]
        //[AllowAnonymous]
        public async Task<IActionResult> Home() 
        {
            var appSettingsPath = Path.Combine(System.IO.Directory.GetCurrentDirectory(), "appsettings.json");
            var json = System.IO.File.ReadAllText(appSettingsPath);

            var jsonSettings = new JsonSerializerSettings();
            jsonSettings.Converters.Add(new ExpandoObjectConverter());
            jsonSettings.Converters.Add(new StringEnumConverter());

            dynamic config = JsonConvert.DeserializeObject<ExpandoObject>(json, jsonSettings);

            config.DebugEnabled = true;
            config.WeatherClientConfig.IsEnabled = true;
            config.WeatherClientConfig.TemperatureUnits = "Test";

            var newJson = JsonConvert.SerializeObject(config, Formatting.Indented, jsonSettings);

            System.IO.File.WriteAllText(appSettingsPath, newJson);

            //check if first time for login redirect user to change password page before process anything on the system
            var user = await userManager.GetUserAsync(User);
            if (user.FirstLogin == null)
            {
                ViewBag.changePassword = "true";
               return RedirectToAction("ChangePassword", "Account");
            }
                

            return View();
        }        

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
