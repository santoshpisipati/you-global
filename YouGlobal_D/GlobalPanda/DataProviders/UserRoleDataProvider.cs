using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for UserRoleDataProvider
/// </summary>

namespace GlobalPanda.DataProviders
{
    public class UserRoleDataProvider
    {
        public enum UserRole { Administrator = 1, Consultant = 2, Candidate = 3 };
    }
}