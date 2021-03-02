using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPSeed.Models;

namespace CPSeed.Controllers
{
    public class NewsController : Controller
    {
        CPSeedContext data = new CPSeedContext();
        // GET: News
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Newss(int? id)
        {
            var news = data.NewDetails.Where(n => n.NewsID == id).Take(4);
            return View(news);
        }
        public ActionResult events()
        {
            var events = data.NewDetails.Where(n => n.NewsID==2).Take(3).OrderBy(n=>n.CreateDate);
            return PartialView(events);
        }
        public ActionResult News()
        {
            var News = data.NewDetails.Where(n => n.NewsID == 1).Take(3).OrderBy(n => n.CreateDate);
            return PartialView(News);
        }
        public ActionResult Imagegallery()
        {
            var Imagegallery = data.NewDetails.Where(n => n.NewsID == 3).Take(10).OrderBy(n => n.CreateDate);
            return PartialView(Imagegallery);
        }
        public ActionResult Communicationcategory()
        {
            var Communicationcategory = data.News.ToList();
            return PartialView(Communicationcategory);
        }

    }
}