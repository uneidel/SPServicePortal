﻿//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;
//using System.Web.Routing;
//using Castle.Windsor;

//namespace uneidel.Prototype.ServicePortal
//{
//    public class WindsorControllerFactory : DefaultControllerFactory
//    {
//        private readonly IWindsorContainer windsorContainer;

//        public WindsorControllerFactory(IWindsorContainer windsorContainer)
//        {
//            this.windsorContainer = windsorContainer;
//        }

//        protected override IController GetControllerInstance(RequestContext requestContext, Type controllerType)
//        {
//            return windsorContainer.Resolve(controllerType) as IController;
//        }

//        public override void ReleaseController(IController controller)
//        {
//            var disposableController = controller as IDisposable;
//            if (disposableController != null)
//            {
//                disposableController.Dispose();
//            }

//            windsorContainer.Release(controller);
//        }
//    }
//}