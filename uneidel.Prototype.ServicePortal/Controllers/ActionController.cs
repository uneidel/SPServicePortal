using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace uneidel.Prototype.ServicePortal.Controllers
{
    public class ActionController : Controller
    {
        //
        // GET: /Action/
        [Authorize]
        public ActionResult CreateSiteCollection()
        {
            Logger.LogMsg("View CreateSiteCollection called", this.User.Identity.Name);
            List<SelectListItem> templateItems = new List<SelectListItem>() {
                new SelectListItem(){ Text="Collaboration",Value="Collaboration"},
                new SelectListItem(){ Text="Blank Site",Value="BlankSite"},
                new SelectListItem(){ Text="Document Workspace",Value="DocumentWorkspace"}
            };
            List<SelectListItem> Quotas = new List<SelectListItem>() {
                new SelectListItem(){ Text="Small(5GB)",Value="5GB"},
                new SelectListItem(){ Text="Middle(10GB)",Value="10GB"},
                new SelectListItem(){ Text="Large(20GB)",Value="20GB"}
            };

            Entities ctx = new Entities();
            var be = from q in ctx.BehoerdenEntities select new { q.BehoerdenName, q.Id };
            List<SelectListItem> Behoerden = new List<SelectListItem>();
            be.ToList().ForEach(i => Behoerden.Add(new SelectListItem(){ Text= i.BehoerdenName, Value=i.Id.ToString()}));
            ViewData["Quotas"] = new SelectList(Quotas, "Value", "Text");
            ViewData["Template"] = new SelectList(templateItems, "Text", "Value");
            ViewData["Behoerden"] = new SelectList(Behoerden, "Value", "Text");
            return View();
        }

        [Authorize]
        public ActionResult AdjustQuota()
        {
            Logger.LogMsg("Adjust Quota Called", this.User.Identity.Name);
           var ctx = new Entities();
            var names = from x in ctx.SCEntities select x.Name;
            List<SelectListItem> Quotas = new List<SelectListItem>() {
                new SelectListItem(){ Text="Small(5GB)",Value="5GB"},
                new SelectListItem(){ Text="Middle(10GB)",Value="10GB"},
                new SelectListItem(){ Text="Large(20GB)",Value="20GB"}
            };        
            ViewData["SiteCollection"] = new SelectList(names, "Text");
            ViewData["Quotas"] = new SelectList(Quotas, "Text", "Value");
            return View();
        }

        [uneidel.Prototype.ServicePortal.MvcApplication.CustomAuthorize(Roles = "admin")]
        public ActionResult ShowLog()
        {
            ServicePortal.Entities ctx = new  Entities();
            var model = ctx.Loggings.ToList();
            return View(model);            
        }
        public ActionResult ShowStatistics()
        {
            ServicePortal.Entities ctx = new Entities();
            var model = ctx.SampleDatas.ToList();
            return View(model);
        }
        //
        // GET: /Action/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Action/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Action/Create
        [HttpPost]
        public ActionResult AdjustQuota(FormCollection collection)
        {

            try
            {
                Entities ctx = new Entities();
                
                OrderEntity oe = new OrderEntity();
                
                oe.User = this.User.Identity.Name;
                oe.Type = "AdjustQuota";
                oe.Id = Guid.NewGuid();
                oe.CreateDate = DateTime.Now;
                oe.Status = "Open";
                oe.Approval = "AutoApproved";
                ctx.AddToOrderEntities(oe);
                ctx.SaveChanges();

                
                QuotaEntity q = new QuotaEntity();
                q.Id = Guid.NewGuid();
                q.Name = collection["Name"];
                q.Quota = collection["Quota"];
                q.Order = oe.Id;
                ctx.AddToQuotaEntities(q);
                ctx.SaveChanges();
                
               
                Logger.LogMsg(String.Format("Quota {0} queued", collection["Name"]), this.User.Identity.Name);
                ViewData["Status"] = "Request successfully queued";
            }
            catch (Exception ex)
            {
                Logger.LogMsg(ex.Message, this.User.Identity.Name);
                ViewData["Status"] = "Error queuing Request";

            }
            return RedirectToAction("CreateSiteCollectionSuccess", "Action");
        }
        [HttpPost]
        public ActionResult CreateSiteCollection(FormCollection collection)
        {            
            try
            {
                Entities ctx = new Entities();
                
                OrderEntity oe = new OrderEntity();
                oe.Status = "Open";
                oe.User = this.User.Identity.Name;
                oe.Type = "SiteCollectionCreation";
                oe.Id = Guid.NewGuid();
                oe.CreateDate = DateTime.Now;
                oe.Approval = "NeedApproval";
                oe.Status = "Open";
                ctx.AddToOrderEntities(oe);
                ctx.SaveChanges();

                SCEntity sc = new SCEntity();
                sc.Id = Guid.NewGuid();
                sc.Template = collection["Template"];
                sc.Name = collection["Name"];
                sc.Description = collection["Description"];
                sc.Quota = collection["Quota"];
                sc.SCOwner = collection["SCOwner"];
                sc.BehoerdenId = Convert.ToInt32(collection["BehoerdenId"]);
                sc.Order = oe.Id;
                ctx.AddToSCEntities(sc);
                ctx.SaveChanges();
                Logger.LogMsg(String.Format("SiteCollection {0} queued", collection["Name"]),this.User.Identity.Name);
                ViewData["Status"] = "Request successfully queued";
            }
            catch (Exception ex)
            {
                Logger.LogMsg(ex.Message, this.User.Identity.Name);
                ViewData["Status"] = "Error queuing Request";
                
            }
            return RedirectToAction("CreateSiteCollectionSuccess", "Action");
        }

        [Authorize]
        public ActionResult ShowOrderQueue()
        {
            
            IEnumerable<OrderEntity> result;
            string role = "";
            Entities ctx = new Entities();
            
                var acc = (from x in ctx.SimpleAccessModels
                           where x.UserName == this.User.Identity.Name
                           select x).FirstOrDefault();
                if (acc != null)
                    role = acc.Role;
            
            if (role.ToLower() == "admin")
            {

                
                result = from oe in ctx.OrderEntities select oe;
                         
                         
                ViewData["ViewType"] = "Showing all Orders";
                ViewData["Role"] = "admin";
            }
            else
            {
                result = from q in ctx.OrderEntities where q.User == this.User.Identity.Name select q;
                ViewData["ViewType"] = String.Format("Showing Orders for User: ", this.User.Identity.Name);
                ViewData["Role"] = "user";
            }
           
            return View(result);

        }
      

        

        //
        // POST: /Action/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult CreateSiteCollectionSuccess()
        {
            return View();
        }
    }
}
