using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace CPSeed
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
               name: "Danh muc san pham",
               url: "danh-muc-san-pham",
               defaults: new { controller = "Product", action = "Index", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "san pham",
               url: "danh-muc-san-pham/{productTypeName}-{id}",
               defaults: new { controller = "Product", action = "Index", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
               name: "tin-tuc",
               url: "truyen-thong",
               defaults: new { controller = "News", action = "Index", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
               name: "tin tuc",
               url: "truyen-thong/{title}-{id}",
               defaults: new { controller = "News", action = "NewsDetail", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
               name: "tuyen dung",
               url: "tuyen-dung",
               defaults: new { controller = "Pots", action = "Index", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
               name: "lien he",
               url: "lien-he",
               defaults: new { controller = "Contact", action = "Index", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
               name: "dang-ky",
               url: "dang-ky",
               defaults: new { controller = "Account", action = "Register", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
               name: "dang-nhap",
               url: "dang-nhap",
               defaults: new { controller = "Account", action = "Login", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
               name: "chi-tiet",
               url: "san-pham/{productName}-{id}",
               defaults: new { controller = "Product", action = "productDetail", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
               name: "gio-hang",
               url: "gio-hang",
               defaults: new { controller = "Cart", action = "GioHang", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
               name: "dat-hang",
               url: "dat-hang",
               defaults: new { controller = "Cart", action = "DatHang", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
               name: "chi-tiet-tin",
               url: "chi-tiet-tin/{title}-{id}",
               defaults: new { controller = "News", action = "CT", id = UrlParameter.Optional },
               namespaces: new[] { "CPSeed.Controllers" }
           );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
           
        }
    }
}
