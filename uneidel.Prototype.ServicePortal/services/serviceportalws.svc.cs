using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace uneidel.Prototype.ServicePortal.services
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class serviceportalws
    {
        
        [OperationContract]
        public void ApproveOrder(Guid orderid, string action, string reason)
        {
            Entities ctx = new Entities();

            var order = (from x in ctx.OrderEntities where x.Id.CompareTo(orderid) == 0 select x).FirstOrDefault();
            if (order != null)
            {
                if (action.ToLower() == "true")
                    order.Approval = "Approved";
                else
                { 
                    order.Approval = "Rejected";
                    order.Comment = reason;
                }
                    ctx.SaveChanges();
            }
        }
        [OperationContract]

        public bool VerifySCName(string scname)
        {
            Entities ctx = new Entities();
            bool bret = false;
            var order = (from x in ctx.SCEntities where x.Name.StartsWith(scname) select x).FirstOrDefault();
            if (order != null)
            {
                bret = true;
            }
            return bret;
        }
        [OperationContract]
        //[WebInvoke(ResponseFormat = WebMessageFormat.Json)]
        public string GetSCDetails(string orderId)
        {
            Guid g = new Guid(orderId);
            if (g == null)
                return null; ;
            var ctx = new Entities();

            var entret = from sc in ctx.SCEntities
                         join be in ctx.BehoerdenEntities on sc.BehoerdenId equals be.Id
                         where sc.Order.CompareTo(g) == 0
                         select new
                         {
                             sc.Name, 
                             sc.Description,
                             sc.Quota,
                             sc.SCOwner,
                             sc.Template,
                             be.BehoerdenName
                         
                         };
           
            var json = JsonConvert.SerializeObject(entret.FirstOrDefault());
            return json; //TODO : Move to NewtonSoft

        }



    }
}
