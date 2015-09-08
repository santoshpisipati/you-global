using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace YouGlobal_D
{
    public class Global : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            //routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //routes.MapRoute(
            //    "Default", // Route name
            //    "{controller}/{action}/{id}", // URL with parameters
            //    new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            //);

            routes.MapRoute(name: "PostJob", url: "Jobs/PostJob.aspx", defaults: new { controller = "Jobs", action = "PostJob", id = UrlParameter.Optional });
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute("ApplyOnline", "Work/ApplyOnline/{id}.shtml", new { controller = "Work", action = "ApplyOnline", id = "" });
            routes.MapRoute("EMailAFriend", "Work/EMailAFriend/{id}.shtml", new { controller = "Work", action = "EMailAFriend", id = "" });
            routes.MapRoute("SearchJobDescription", "Work/SearchJobDescription.shtml", new { controller = "Work", action = "SearchJobDescription" });
            routes.MapRoute("JobDescription", "Jobs/JobDescription/{id}.shtml", new { controller = "Jobs", action = "JobDescription", id = "" });
            routes.MapRoute("Default", "{controller}/{action}.shtml", new { controller = "Home", action = "Home" });
            routes.MapRoute("Home", "", new { controller = "Home", action = "Home" });
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }

        protected void Application_PreRequestHandlerExecute(object sender, EventArgs e)
        {
            //Only access session state if it is available
            if (Context.Handler is IRequiresSessionState || Context.Handler is IReadOnlySessionState)
            {
                //If we are authenticated AND we dont have a session here.. redirect to login page.
                HttpCookie authenticationCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                if (authenticationCookie != null)
                {
                    FormsAuthenticationTicket authenticationTicket = FormsAuthentication.Decrypt(authenticationCookie.Value);
                    if (!authenticationTicket.Expired)
                    {
                    }
                }
            }
        }
    }
}