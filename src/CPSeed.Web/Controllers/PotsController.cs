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
                var td = data.Posts.Where(n => n.CategoryID == 3).Take(4).ToList();
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
                var categoryPost = data.Posts.Where(n => n.CategoryID == 3).ToList();
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
            CPSeedContext data = new CPSeedContext();
            List<recruitments> recruitments = (from d in data.Recruitments
                                               join c in data.Workplaces on d.WorkplaceID equals c.WorkplaceID
                                               join s in data.Positions on d.PositionID equals s.PositionID
                                               select new recruitments
                                               {
                                                   RecruitmentID = d.RecruitmentID,
                                                   Title = d.Title,
                                                   contents = d.contents,
                                                   CreateDate = d.CreateDate,
                                                   Summary = d.Summary,
                                                   Quantity = d.Quantity,
                                                   ExpirationDate = d.ExpirationDate,
                                                   workplace = c.Title,
                                                   position = s.Title
                                               }).ToList();

            return PartialView(recruitments);

        }
        public ActionResult Onlinefiling()
        {
            return View();
        }
        public ActionResult workplace()
        {
            CPSeedContext data = new CPSeedContext();
            var wp = data.Workplaces.ToList();
            return PartialView(wp);
        }
        public ActionResult position(int ?id)
        {
            ViewBag.Onlinefiling = id;
            CPSeedContext data = new CPSeedContext();
            var position = data.Positions.ToList();
            return PartialView(position);
        }
        public ActionResult recruitmentDetail(int Id)
        {
            CPSeedContext data = new CPSeedContext();
            var recruitmentDetail = data.Recruitments.Where(n=>n.RecruitmentID==Id).SingleOrDefault();
            return View(recruitmentDetail);
        }
    }
}