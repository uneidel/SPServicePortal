using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uneidel.Prototype.ServicePortal
{
    public class SessionToken
    {
        public bool IsValid { get; set; }
        public System.Net.IPAddress IpAddress { get; set; }
    }
}