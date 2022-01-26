using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Service.DataLayer.Template.ViewModels;
using Service.DataLayer.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Service.DataLayer.Models;
using System.Security.Claims;
using Service.DataLayer;

namespace Template.Controllers
{
    
    public class AccountController : Controller
    {
        private readonly UserManager<ApplicationUser> userManager;
        private readonly SignInManager<ApplicationUser> signInManager;
        private readonly RoleManager<IdentityRole> roleManager;

        private readonly AppDbContext _context;

        public AccountController(UserManager<ApplicationUser> userManager,
           SignInManager<ApplicationUser> signInManager,
           RoleManager<IdentityRole> roleManager,
           AppDbContext context)

        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.roleManager = roleManager;
            _context = context;
        }


        [HttpGet]
        [AllowAnonymous]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                //var message = default(string);

                var result = await signInManager.PasswordSignInAsync(
                    model.Username, model.Password, false, false);

                if (result.Succeeded)
                {
                    if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
                    {
                        ModelState.AddModelError(string.Empty, "لايمكن الدخول يرجى مراجعة قسم تقنية المعلومات");
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        //log every user login in db
                        var userName = model.Username;
                        ApplicationUser user = await userManager.FindByNameAsync(userName);

                        //check user has not logged in past 3 months if yes lock account
                        //when disable lock must put true in MonthLockStatus to allow user to login after lock
                        if (user.MonthLockStatus != true)
                        {
                            var rersult = await CheckLastUserLoginAsync(user);

                            if (rersult && userManager.FindByNameAsync(userName).Result.MaxMonthLock == true)
                            {
                                ModelState.AddModelError(string.Empty, "المستخدم لم يسجل الدخول لمدة تزيد عن 3 اشهر.. يرجى التواصل مع قسم تقنية المعلومات");
                                return View(model);
                            }
                        }

                        await SaveLoginTransaction(user);

                        return RedirectToAction("Home", "Home");
                    }

                }

                //count login times
                var userNameagain = model.Username;
                ApplicationUser useragain = await userManager.FindByNameAsync(userNameagain);
                //var userFailed = await userManager.GetUserAsync(User);
                if (useragain != null)
                {
                    useragain.AccessFailedCount = useragain.AccessFailedCount + 1;
                    await userManager.UpdateAsync(useragain);
                }
                //in case try login more than 3 times
                var useragain2 = await userManager.FindByNameAsync(userNameagain);
                if (useragain2 != null && useragain2.AccessFailedCount > AppConstants.Account.Login.AccessFailedCount)
                {
                    useragain2.LockoutEnabled = true;
                    await userManager.UpdateAsync(useragain2);
                    ModelState.AddModelError(string.Empty, "لقد تم تعطيل الحساب بسبب إدخال كلمة المرور أكثر من 3 مرات، يرجى التواصل مع قسم تقنية المعلومات لتفعيل الحساب");

                    return View(model);
                }

                //if (useragain.LockoutEnabled)
                //{                    
                //    ModelState.AddModelError(string.Empty, "لقد تم تعطيل الحساب بسبب إدخال كلمة المرور أكثر من 3 مرات، يرجى التواصل مع قسم تقنية المعلومات لتفعيل الحساب");
                //}

                ModelState.AddModelError(string.Empty, "المستخدم غير موجود او كلمة السر خطأ  .. رجاء اعادة المحاولة");
            }

            return View(model);
        }

        private async Task SaveLoginTransaction(ApplicationUser user)
        {
            UserTransaction userLoggedIn = new UserTransaction();
            userLoggedIn.UserId = user.Id;
            userLoggedIn.LogginDateTime = DateTime.Now;

            await _context.UserTransaction.AddAsync(userLoggedIn);
            await _context.SaveChangesAsync(userLoggedIn.UserId);
        }

        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            //log every user login in db
            var user = await userManager.GetUserAsync(User);

            UserTransaction userLoggedIn = new UserTransaction();
            userLoggedIn.UserId = user.Id;
            userLoggedIn.LoggedOutDateTime = DateTime.Now;

            await _context.UserTransaction.AddAsync(userLoggedIn);
            await _context.SaveChangesAsync(User?.FindFirst(ClaimTypes.NameIdentifier).Value);

            await signInManager.SignOutAsync();
            return RedirectToAction("Login");
        }

        [Authorize]
        [HttpGet]
        public IActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await userManager.GetUserAsync(User);
                if (user == null)
                {
                    return RedirectToAction("Login");
                }

                // ChangePasswordAsync changes the user password
                var result = await userManager.ChangePasswordAsync(user,
                    model.CurrentPassword, model.NewPassword);

                // The new password did not meet the complexity rules or
                // the current password is incorrect. Add these errors to
                // the ModelState and rerender ChangePassword view
                if (!result.Succeeded)
                {
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError(string.Empty, error.Description);
                    }
                    return View();
                }

                // Upon successfully changing the password refresh sign-in cookie
                await signInManager.RefreshSignInAsync(user);

                //Log the password values in 
                UserPassword userPassword = new UserPassword();
                userPassword.UserId = user.Id;
                userPassword.PasswordChange = DateTime.Now;
                userPassword.OldPassword = model.CurrentPassword;
                userPassword.NewPassword = model.NewPassword;

               await _context.UserPassword.AddAsync(userPassword);
               await _context.SaveChangesAsync(User?.FindFirst(ClaimTypes.NameIdentifier).Value);

                //update isFisrt sign in field in db
                user.FirstLogin = false;
               await userManager.UpdateAsync(user);

               return RedirectToAction("Home", "Home");
            }

            return View(model);
        }

        public async Task<bool> CheckLastUserLoginAsync(ApplicationUser user)
        {
            try
            {
                var LoginTrs = _context.UserTransaction.Where(u => u.UserId == user.Id).ToList();
                //var count = LoginTrs.Count-1;
                if (LoginTrs.Count > 0)
                {
                    if (LoginTrs.Last().LogginDateTime.ToString("dd/mm/yyyy") != "01/00/0001")
                    {
                        var TotalAvg1 = DateTime.Now.Date - LoginTrs.Last().LogginDateTime.Date;
                        if (TotalAvg1.TotalDays > AppConstants.Account.Login.MaxLimitToLockUser)
                        {
                            var useragain2 = await userManager.FindByNameAsync(user.UserName);

                            useragain2.MaxMonthLock = true;
                            await userManager.UpdateAsync(useragain2);
                            return true;
                        }
                        return false;
                    }
                    var TotalAvg = DateTime.Now.Date - LoginTrs.Last().LoggedOutDateTime.Date;
                    if (TotalAvg.TotalDays > AppConstants.Account.Login.MaxLimitToLockUser)
                    {
                        var useragain2 = await userManager.FindByNameAsync(user.UserName);
                        
                            useragain2.MaxMonthLock = true;
                            await userManager.UpdateAsync(useragain2);
                        return true;
                    }
                    return false;
                }
                return false;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
