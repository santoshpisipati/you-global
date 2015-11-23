using System;
using System.Data;
using System.Web.Mvc;
using System.Xml;
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

        public ActionResult LoginPopUp()
        {
            return View();
        }

        public ActionResult Register()
        {
            GetPhoneCodes();
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
                if (!string.IsNullOrEmpty(model.UserName))
                {
                    DataTable dt = new DataTable();
                    Login login = new Login();
                    if (!string.IsNullOrEmpty(model.Password))
                    {
                        login.EmailId = model.UserName;
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
                    ModelState.AddModelError("", "password cannot be empty.");
                    return PartialView("Login", model);
                }
                ModelState.AddModelError("", "username cannot be empty.");
                return PartialView("Login", model);
            }

            ModelState.AddModelError("", "The user name or password provided is incorrect.");
            return PartialView("Login", model);
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult LoginPopUp(LoginModel model, string returnUrl)
        {
            if (model != null)
            {
                DataTable dt = new DataTable();
                Login login = new Login();
                if (!string.IsNullOrEmpty(model.Password))
                {
                    login.EmailId = model.UserName;
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
            if (ModelState.IsValid)
            {
                if (model != null)
                {
                    if (!captchaValid)
                    {
                        ViewData["Message"] = "Invalid Captcha.";
                        ModelState.AddModelError("captcha", captchaErrorMessage);
                    }
                    else
                    {
                        Member member = new Member();
                        member.EmailId = model.Email;
                        member.FirstName = model.FirstName;
                        member.LastName = model.LastName;
                        string[] result = model.PhoneCode.Split(new char[] { '(', ')' }, StringSplitOptions.RemoveEmptyEntries);
                        member.PhoneNo = !string.IsNullOrEmpty(model.PhoneNumber) ? string.Format("{0} {1}", result[0], model.AreaCode, model.PhoneNumber) : "";
                        if (!string.IsNullOrEmpty(model.Password))
                        {
                            member.Password = CryptorEngine.Encrypt(model.Password, true);
                            member.CreatedOn = DateTime.Now;
                            member.isActive = true;
                            if (!string.IsNullOrEmpty(model.Password))
                            {
                                Int32 memberID = Logininfo.GetMemberId(model.Email, "");
                                if (memberID > 0)
                                {
                                    ViewData["Message"] = string.Format("Emailid {0} already exists.please try alternate email.", model.Email);
                                }
                                else
                                {
                                    Logininfo.AddMember(member);
                                    ViewData["Message"] = "Registration Successful.";
                                }
                            }
                            return View();
                        }
                    }
                }
            }
            return View("Register");
        }

        private void GetPhoneCodes()
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("~/countryphonecodes.xml"));
            XmlNodeList nodeList = xmlDoc.DocumentElement.SelectNodes("/countries/country");
            DataTable dt = new DataTable();
            dt.Columns.Add("phoneCode");
            for (int i = 0; i < nodeList.Count; i++)
            {
                DataRow dr;
                dr = dt.NewRow();
                dr[0] = string.Format("(+{0}) {1}", nodeList[i].Attributes["phoneCode"].Value, nodeList[i].Attributes["name"].Value);
                dt.Rows.Add(dr);
            }
            Session.Add("PhoneCodes", dt);
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