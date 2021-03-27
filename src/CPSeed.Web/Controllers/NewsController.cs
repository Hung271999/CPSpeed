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
        private static log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        // GET: News
        public ActionResult Index()
        {
            return View();
        }
        // sự kiện
        public ActionResult events()
        {
            try
            {
                var events = data.NewDetails.Where(n => n.NewsID == 2).Where(n => n.Priority == 0).Take(3).OrderBy(n => n.CreateDate);
                if(events ==null)
                {
                    logger.Error("New details is null id=2, Priority");
                }
                return PartialView(events);
            }
            catch (Exception ex)
            {
                logger.Debug("events");
                return View();
            }
            
        }
        // tin tức
        public ActionResult News(int ? status)
        {
            try
            {
                ViewBag.Status = status;
                var News = data.NewDetails.Where(n => n.NewsID == 1).Where(n => n.Priority == 0).Take(3).OrderBy(n => n.CreateDate);
                if (News == null)
                {
                    logger.Error("New details is null id=1, Priority");
                }
                return PartialView(News);
                
            }
            catch (Exception ex)
            {
                logger.Debug("News");
                return View();
            }
           
        }
        // thư viện
        public ActionResult Imagegallery()
        {
            try
            {
                var Imagegallery = data.NewDetails.Where(n => n.NewsID == 3).Where(n => n.Priority == 0).Take(10).OrderBy(n => n.CreateDate);
                if (Imagegallery == null)
                {
                    logger.Error("New details is null id=3, Priority");
                }
                return PartialView(Imagegallery);

            }
            catch (Exception ex)
            {
                logger.Debug("Imagegallery");
                return View();
            }
            
        }
        //danh mục 
        public ActionResult Communicationcategory(int? id)
        {

            try
            {
                var News = data.News.ToList();
                ViewBag.Status = id;
                return PartialView(News);
            }
            catch (Exception ex) {
                logger.Debug("Communicationcategory");
                return View();
            }
           
        }
        // chi tiêt
        public ActionResult CT(int id)
        {
            try
            {
                var news = data.NewDetails.Where(n => n.NewDetailID == id).Single();
                return View(news);
            }
            catch (Exception ex) {
                logger.Debug("CT");
                return View();
            }
            
        }
        // danh sách tin
        public ActionResult AllNews(int ? id, int ?page)
        {
            try
            {
                int pagesize = 3;
                News a = data.News.Where(n => n.NewsID == id).SingleOrDefault();
                ViewBag.name = a;
                int pageNum = (page ?? 1);
                var AllNews = data.NewDetails.Where(n => n.NewsID == id).Where(n => n.Priority == 0).ToList();
                return PartialView(AllNews.OrderBy(n => n.CreateDate).ToPagedList(pageNum, pagesize));
            }
            catch (Exception ex) {
                logger.Debug("AllNews");
                return View();
            }
            }
        //chi tiết thể loại
        public ActionResult NewsDetail(int? id, int? page)
        {
            try
            {
                int pagesize = 3;
                int pageNum = (page ?? 1);
                News a = data.News.Where(n => n.NewsID == id).SingleOrDefault();
                ViewBag.name = a;
                ViewBag.id = id;
                var AllNews = data.NewDetails.Where(n => n.NewsID == id).Where(n => n.Priority == 0).ToList();
                return PartialView(AllNews.OrderBy(n => n.CreateDate).ToPagedList(pageNum, pagesize));
            }
            catch (Exception ex)
            {
                logger.Debug("NewsDetail");
                return View();
            }

        }
    }
}