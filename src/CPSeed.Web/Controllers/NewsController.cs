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
        // GET: News
        public ActionResult Index()
        {
            return View();
        }
        // sự kiện
        public ActionResult events()
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();
                try
                {
                    var events = data.NewDetails.Where(n => n.NewsID == 2).Where(n => n.Priority == 0).Take(3).OrderBy(n => n.CreateDate);
                    if (events == null)
                    {
                        logger.Error("New details is null id=2, Priority");
                    }
                    return PartialView(events);
                }
                catch (Exception ex)
                {
                    logger.Error("events" + ex);
                    return View();
                }
            
        }
        // tin tức
        public ActionResult News(int? status)
        {
            CPSeedContext data = new CPSeedContext();
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            
                try
                {
                    ViewBag.Status = status;
                    var News = data.NewDetails.Where(n => n.NewsID == 1).Where(n => n.Priority == 0).Take(3).OrderBy(n => n.CreateDate);
                    return PartialView(News);

                }
                catch (Exception ex)
                {
                    logger.Error("News" + ex);
                    return View();
                }
        }
        // thư viện
        public ActionResult Imagegallery()
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();
            {
                try
                {
                    var Imagegallery = data.NewDetails.Where(n => n.NewsID == 3).Where(n => n.Priority == 0).Take(10).OrderBy(n => n.CreateDate);
                    return PartialView(Imagegallery);

                }
                catch (Exception ex)
                {
                    logger.Error("Imagegallery" + ex);
                    return View();
                }
            }
            
        }
        //danh mục 
        public ActionResult Communicationcategory(int? id)
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();
            {
                try
                {
                    var News = data.News.ToList();
                    ViewBag.Status = id;
                    return PartialView(News);
                }
                catch (Exception ex)
                {
                    logger.Error("Communicationcategory" + ex);
                    return View();
                }
            }
           
        }
        // chi tiêt
        public ActionResult CT(int id)
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();   
                try
                {
                    var news = data.NewDetails.Where(n => n.NewDetailID == id).Single();
                    return View(news);
                }
                catch (Exception ex)
                {
                    logger.Error("CT" + ex);
                    return View();
                }
            
        }
        // danh sách tin
        public ActionResult AllNews(int? id, int? page)
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();
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
                catch (Exception ex)
                {
                    logger.Error("AllNews" + ex);
                    return View();
                }
            }
        }
        //chi tiết thể loại
        public ActionResult NewsDetail(int? id, int? page)
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();
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
                    logger.Debug("NewsDetail" + ex);
                    return View();
                }
            }

        }
    }
}