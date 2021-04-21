using CPSeed.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CPSeed.Controllers
{
    public class PotsController : Controller
    {
        
        // GET: Pots
        // trang chu tuyen dung
        public ActionResult Index()
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();
            try
            {
                var td = data.Posts.Where(n => n.CategoryID == 3).Take(4).Where(n=>n.Priority==1).ToList();
                return View(td);
            }
            catch (Exception ex) {
                logger.Debug("Index Post contronller"+ex);
                return View();
            }
            
        }
        // danh mục tuyển dụng
        public ActionResult categoryPost(int? id)
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();
            try
            {
                var categoryPost = data.Posts.Where(n => n.CategoryID == 3).Where(n=>n.Priority==1).ToList();
                return PartialView(categoryPost);
            }
            catch (Exception ex)
            {
                logger.Debug("categoryPost" + ex);
                return View();
            }
            
        }
        public ActionResult PostDetail(int id)
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();
            try
            {
                var news = data.Posts.Where(n => n.PostID == id).Where(n=>n.CategoryID==3).Single();
                return View(news);
            }
            catch (Exception ex)
            {
                logger.Debug("PostDetail" + ex);
                return View();
            }

        }
        public ActionResult recruitment()
        {
            return PartialView();
        }
        public ActionResult Onlinefiling()
        {
            return View();
        }
    }
}