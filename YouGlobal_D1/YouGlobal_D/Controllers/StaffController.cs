using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace YG_MVC.Controllers
{
    public class StaffController : BaseController
    {
        public ActionResult LookingForStaff()
        {
            return this.Index();
        }

        public ActionResult PositionDescription()
        {
            return base.View();
        }

        public override string DefaultViewName
        {
            get
            {
                return "LookingForStaff";
            }
        }

    }
}
