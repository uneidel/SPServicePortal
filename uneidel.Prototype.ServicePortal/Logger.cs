using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uneidel.Prototype.ServicePortal
{
    internal class Logger
    {
        static Entities container = new Entities();
       
        internal static void LogMsg(string msg, string currentUser)
        {
            Logging log = new Logging();
            log.Id = Guid.NewGuid();
            log.Action = msg;
            log.DateTime = DateTime.Now;
            log.User = currentUser;
            container.AddToLoggings(log);
            container.SaveChanges();
        }
    }
}