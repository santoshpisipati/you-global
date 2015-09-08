using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace YG_MVC.Controllers
{
    [HandleError]
    public class ContactController : BaseController
    {
        public ActionResult ContactUs()
        {
            return this.Index();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SendQuery(FormCollection formCollection)
        {
            if (!base.ProcessUpload())
            {
                return base.View("MessageFailure");
            }
            return base.View("Thankyou");
        }

        public override string DefaultViewName
        {
            get
            {
                return "ContactUs";
            }
        }
    }
}
