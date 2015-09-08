using System;
using System.Data;
using System.Web.Mvc;
using YG_Business;
using YouGlobal_D.Classes;
using YouGlobal_D.Models;

namespace YouGlobal_D.Controllers
{
    public class AccountController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        public ActionResult AppliedJobDetails()
        {
            return View();
        }

        public ActionResult logOff()
        {
            Session["username"] = null;
            return RedirectToAction("Home", "Home");
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model, string returnUrl)
        {
            if (model != null)
            {
                DataTable dt = new DataTable();
                Login login = new Login();
                login.EmailId = model.UserName;
                if (!string.IsNullOrEmpty(model.Password))
                {
                    login.Password = CryptorEngine.Encrypt(model.Password, true);
                    dt = Logininfo.GetLoginDetails(login);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        if (ModelState.IsValid)
                        {
                            Session["loggedinas"] = model.LoggedInAs;
                            string userName = dt.Rows[0][1].ToString();
                            Session["username"] = string.Format("Hello,{0}", userName);
                            return RedirectToLocal(returnUrl);
                        }
                    }
                }
            }

            ModelState.AddModelError("", "The user name or password provided is incorrect.");
            return RedirectToAction("Home", "Home");
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Home", "Home");
            }
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        [Recaptcha.RecaptchaControlMvc.CaptchaValidator]
        public ActionResult Register(RegisterModel model, bool captchaValid, string captchaErrorMessage)
        {
            if (model != null)
            {
                if (!captchaValid)
                {
                    ModelState.AddModelError("captcha", captchaErrorMessage);
                }
                else
                {
                    Member member = new Member();
                    member.EmailId = model.Email;
                    member.FirstName = model.FirstName;
                    member.LastName = model.LastName;
                    member.PhoneNo = !string.IsNullOrEmpty(model.PhoneNumber) ? Convert.ToInt64(model.PhoneNumber) : 0;
                    if (!string.IsNullOrEmpty(model.Password))
                    {
                        member.Password = CryptorEngine.Encrypt(model.Password, true);
                        member.CreatedOn = DateTime.Now;
                        member.isActive = true;
                        Logininfo.AddMember(member);
                        LoginModel login = new LoginModel();
                        login.UserName = model.Email;
                        login.Password = CryptorEngine.Encrypt(model.Password, true);
                        return this.Login(login, "");
                    }
                }
            }
            return View("Register");
        }

        public ActionResult ResetPassword(PasswordModel model)
        {
            if (model != null)
            {
                Int32 memberID = Logininfo.GetMemberId(model.EmailId, "");
                if (memberID > 0)
                {
                    if (!string.IsNullOrEmpty(model.NewPassword))
                    {
                        string newPassword = CryptorEngine.Encrypt(model.NewPassword, true);
                        Int32 Id = Logininfo.ResetPassword(newPassword, memberID);
                        if (Id > 0)
                        {
                            LoginModel login = new LoginModel();
                            login.UserName = model.EmailId;
                            login.Password = newPassword;
                            return this.Login(login, "");
                        }
                    }
                }
            }
            Session["username"] = null;
            return RedirectToAction("Home", "Home");
        }
    }
}