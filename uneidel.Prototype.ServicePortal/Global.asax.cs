using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.Security.Principal;
using uneidel.Prototype.ServicePortal;

namespace uneidel.Prototype.ServicePortal
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=939480

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            AppDomain.CurrentDomain.SetData("SQLServerCompactEditionUnderWebHosting", true);
            RegisterRoutes(RouteTable.Routes);
        }
        [AttributeUsage(AttributeTargets.Method | AttributeTargets.Class, Inherited = true, AllowMultiple = true)]
        public class CustomAuthorizeAttribute : AuthorizeAttribute
        {
            public override void OnAuthorization(AuthorizationContext filterContext)
            {
                string cookieName = FormsAuthentication.FormsCookieName;

                if (!filterContext.HttpContext.User.Identity.IsAuthenticated ||
                    filterContext.HttpContext.Request.Cookies == null ||
                    filterContext.HttpContext.Request.Cookies[cookieName] == null
                )
                {
                    HandleUnauthorizedRequest(filterContext);
                    return;
                }

                var authCookie = filterContext.HttpContext.Request.Cookies[cookieName];
                var authTicket = FormsAuthentication.Decrypt(authCookie.Value);
                
                List<string> roles = new List<string>();
                //crappy but enough for poc

                using (var ctx = new Entities())
                {
                    var acc = (from x in ctx.SimpleAccessModels
                               where x.UserName == authTicket.Name
                               select x).FirstOrDefault();
                    if (acc != null)
                        roles.Add(acc.Role);
                }
                var userIdentity = new GenericIdentity(authTicket.Name);
                var userPrincipal = new GenericPrincipal(userIdentity, roles.ToArray());

                filterContext.HttpContext.User = userPrincipal;
                base.OnAuthorization(filterContext);
            }
        }

    }
}