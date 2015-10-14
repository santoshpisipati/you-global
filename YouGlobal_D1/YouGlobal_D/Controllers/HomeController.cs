using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace YG_MVC.Controllers
{
    [HandleError]
    public class HomeController : BaseController
    {
        public ActionResult AboutUs()
        {
            return base.View();
        }

        public ActionResult Home()
        {
            return this.Index();
        }

        public override string DefaultViewName
        {
            get
            {
                return "Home";
            }
        }

    }
}
