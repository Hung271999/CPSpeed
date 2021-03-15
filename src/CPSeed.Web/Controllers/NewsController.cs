using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPSeed.Models;
using PagedList;
using PagedList.Mvc;

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
        public ActionResult events()
        {
            var events = data.NewDetails.Where(n => n.NewsID==2).Take(3).OrderBy(n=>n.CreateDate);
            return PartialView(events);
        }
        public ActionResult News(int ? status)
        { 
            ViewBag.Status = status;
            var News = data.NewDetails.Where(n => n.NewsID == 1).Take(3).OrderBy(n => n.CreateDate);
            return PartialView(News);
        }
        public ActionResult Imagegallery()
        {
            var Imagegallery = data.NewDetails.Where(n => n.NewsID == 3).Take(10).OrderBy(n => n.CreateDate);
            return PartialView(Imagegallery);
        }
        public ActionResult Communicationcategory(int? id)
        {
            var News = data.News.ToList();
            ViewBag.Status = id;
            return PartialView(News);
        }
        public ActionResult CT(int id)
        {
            var news = data.NewDetails.Where(n => n.NewDetailID == id).Single();
            return View(news);
        }
        public ActionResult AllNews(int ? id, int ?page)
        {
            int pagesize = 3;
            ViewBag.Name = "Tin";
            int pageNum = (page ?? 1);
            var AllNews = data.NewDetails.Where(n=>n.Priority==0).ToList();
            return PartialView(AllNews.OrderBy(n=>n.CreateDate).ToPagedList(pageNum, pagesize));
        }
        public ActionResult NewsDetail(int? id, int? page)
        {
            int pagesize = 3;
            int pageNum = (page ?? 1);
            var AllNews = data.NewDetails.Where(n => n.NewsID == id).ToList();
            return PartialView(AllNews.OrderBy(n => n.CreateDate).ToPagedList(pageNum, pagesize));
        }
    }
}