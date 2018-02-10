//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using Castle.Windsor;
//using Castle.Facilities.FactorySupport;
//using Castle.MicroKernel.Registration;
//using System.Web.Mvc;
//using Castle.MicroKernel.SubSystems.Configuration;

//namespace uneidel.Prototype.ServicePortal
//{
//    public class WindsorInstaller : IWindsorInstaller
//    {
//        public void Install(IWindsorContainer container, IConfigurationStore store)
//        {
//            // Register all controllers from this assembly
//            container.Register(
//                AllTypes.FromThisAssembly()
//                .BasedOn<Controller>()
//                .Configure(c => c.LifeStyle.PerWebRequest)
//            );

//            // Register HttpContext(Base) and HttpRequest(Base) so it automagically can be injected using IoC
//            container.AddFacility<FactorySupportFacility>();
//            container.Register(Component.For<HttpRequestBase>().LifeStyle.PerWebRequest
//                     .UsingFactoryMethod(() => new HttpRequestWrapper(HttpContext.Current.Request)));
//            container.Register(Component.For<HttpContextBase>().LifeStyle.PerWebRequest
//                    .UsingFactoryMethod(() => new HttpContextWrapper(HttpContext.Current)));

//            // Respository and Service registrations
//            container.Register(Component.For<ISomeRepository>().ImplementedBy<SomeRepository>());
//            container.Register(Component.For<ISessionValidator>().ImplementedBy<SessionValidator>().LifeStyle.PerWebRequest);
//        }
//    }
//}