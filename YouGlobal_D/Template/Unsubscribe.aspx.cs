using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using YG_Business;

namespace YG_MVC.Template
{
    public partial class Unsubscribe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["aD"] != null)
            {
                int alertid = Convert.ToInt32(Request.QueryString["aD"]);
                JobAlert obj = new JobAlert();
                obj.AlertDelete(alertid,0,"","","");
                divConfirm.Visible = true;
            }
        }
    }
}