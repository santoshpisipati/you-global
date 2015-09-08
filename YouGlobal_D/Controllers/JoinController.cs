using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace YG_MVC.Controllers
{
    [HandleError]
    public class JoinController : BaseController
    {
        public ActionResult JoinUs()
        {
            return this.Index();
        }

        public override string DefaultViewName
        {
            get
            {
                return "JoinUs";
            }
        }
    }
}
