﻿using CPSeed.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CPSeed.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //viet thư  muon lay TITLE_INFO 
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
    }
}