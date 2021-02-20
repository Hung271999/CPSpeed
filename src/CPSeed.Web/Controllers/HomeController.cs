using CPSeed.Models;
using CPSeed.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CPSeed.Controllers
{
    public class HomeController : Controller
    {
        CPSeedContext data = new CPSeedContext();
        public ActionResult Index()
        {
           
         string abc =  Common.GetResouceString("MSG_ERROR_INPUT");


            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Vision_mission()
        {
            CategoryPost CategoryPosts = data.CategoryPosts.Where(n => n.CategoryPostID == 1).SingleOrDefault();
            ViewBag.Message = CategoryPosts;
            var vs = data.Posts.Where(n => n.CategoryPostID == 1).ToList();
            return PartialView(vs);
        }
        public ActionResult ProductType()
        {

            var productType = data.ProductTypes.ToList();
            return PartialView(productType);
        }


    }
}