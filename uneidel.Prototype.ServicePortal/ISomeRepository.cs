using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uneidel.Prototype.ServicePortal
{
    public interface ISomeRepository
    {
        SessionToken GetSessionToken();
    }

    public class SomeRepository : ISomeRepository
    {
        private readonly ISessionValidator sessionValidator;

        public SomeRepository(ISessionValidator sessionValidator)
        {
            this.sessionValidator = sessionValidator;
        }

        public SessionToken GetSessionToken()
        {
            return sessionValidator.ValidateSession();
        }
    }
}