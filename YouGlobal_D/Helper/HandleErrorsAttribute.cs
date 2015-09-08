using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Globalization;


namespace YG_MVC.Helpers
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public sealed class HandleErrorsAttribute : HandleErrorAttribute
    {
        /// <summary>
        /// Called when an exception occurs.
        /// </summary>
        /// <param name="filterContext">The action-filter context.</param>
        /// <exception cref="T:System.ArgumentNullException">The <paramref name="filterContext"/> parameter is null.</exception>
        public override void OnException(ExceptionContext filterContext)
        {
            if (filterContext == null) return;
            if (filterContext.HttpContext != null)
            {
                HttpContextBase ctx = filterContext.HttpContext;
                if (filterContext.Exception != null)
                {
                    if (!filterContext.ExceptionHandled && ctx.IsCustomErrorEnabled)
                    {
                        string controller = filterContext.RouteData.Values["controller"].ToString();
                        string action = filterContext.RouteData.Values["action"].ToString();


                        var model = new HandleErrorInfo(
                            filterContext.Exception,
                            controller,
                            action
                            );

                        var result = new ViewResult
                        {
                            ViewName = View,
                            MasterName =  Master,
                            ViewData = new ViewDataDictionary<HandleErrorInfo>(model),
                            TempData = filterContext.Controller.TempData
                        };

                        filterContext.Result = result;
                        filterContext.ExceptionHandled = true;
                        ctx.Response.Clear();
                        ctx.Response.StatusCode = 500;
                        ctx.Response.TrySkipIisCustomErrors = true;
                        return;
                    }
                }
            }
            base.OnException(filterContext);
        }
    }
}