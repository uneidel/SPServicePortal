using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace uneidel.Prototype.ServicePortal.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "SharePoint ServicePortal Prototype uneidel/msft";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
