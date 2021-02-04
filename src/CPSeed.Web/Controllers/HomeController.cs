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
            var a = data.CategoryPosts.Where(n => n.CategoryPostID == 1);
            return PartialView(a.Single());
        }

    }
}