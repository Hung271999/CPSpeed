using CPSeed.Models;
using CPSeed.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using System.Web.UI;

namespace CPSeed.Controllers
{
    public class HomeController : MyController
    {
        CPSeedContext data = new CPSeedContext();
        private static log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        public ActionResult Index()
        {
           
            return View();
        }
        public ActionResult ChangeLanguage(string lang)
        {
            new LanguageMang().SetLanguage(lang);
            return RedirectToAction("Index", "Home");
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
        // Tầm nhìn sứ mệnh
        public ActionResult Vision_mission(int? id)
        {
            try
            {
                Category CategoryPosts = data.Categories.Where(n => n.CategoryID == id).Where(n => n.Status == true).SingleOrDefault();
                ViewBag.Message = CategoryPosts;
                var vs = data.Posts.Where(n => n.CategoryID == 1).ToList();
                if (vs == null)
                {
                    logger.Error("post vission mission is null");
                }
                return PartialView(vs);
            }
            catch (Exception ex)
            {
                logger.Debug("Vission mission");
                return View();
            }
        }
        // Danh sách các sản phẩm
        public ActionResult ProductType()
        {
            try
            {
                var productType = data.ProductTypes.ToList();
                if (productType == null)
                {
                    logger.Error("ProductTypes is null");
                }
                return PartialView(productType);
            }
            catch (Exception ex)
            {
                logger.Debug("ProductType");
                return View();
            }

        }
        // Tin tức được ưu tiên
        public ActionResult News()
        {
            try
            {
                var News = data.NewDetails.OrderByDescending(n => n.CreateDate).Where(n => n.Status == true).Where(n => n.Priority == 1).ToList();
                if (News == null)
                {
                    logger.Error("NewDetails Priority is null");
                }
                return PartialView(News);

            }
            catch (Exception ex)
            {
                logger.Debug("ProductType");
                return View();
            }
        }
        // Footer thông tin liên lạc
        public ActionResult Contacts()
        {
            try
            {

                var Contact = data.Contacts.Where(n => n.Status == true).ToList();
                if (Contact == null)
                {
                    logger.Error("Contacts  is null");
                }
                return PartialView(Contact);

            }
            catch (Exception ex)
            {

                logger.Debug("Contacts");
                return View();

            }

        }
        // Bannner
        public ActionResult Slide()
        {
            try
            {

                var Slide = data.Slides.Where(n => n.Status == true).ToList();
                if (Slide == null)
                {
                    logger.Error("Slide  is null");
                }
                return PartialView(Slide);

            }
            catch (Exception ex)
            {

                logger.Debug("Slide");
                return View();

            }
        }
        // Công nghệ
        public ActionResult Technology(int? page)
        {
            try
            {

                int pagesize = 1;
                int pageNum = (page ?? 1);
                var Technology = data.Posts.Where(n => n.CategoryID == 2).Where(n => n.Status == true).ToList();
                if (Technology == null)
                {
                    logger.Error("Posts Technology is null id =2 or status is not true");
                }
                return PartialView(Technology.ToPagedList(pageNum, pagesize));

            }
            catch (Exception ex)
            {

                logger.Debug("Technology");
                return View();
            }
        }
        //linh vuc
        public ActionResult LV(int? page)
        {
            try
            {

                int pagesize = 1;
                int pageNum = (page ?? 1);
                var lv = data.Posts.Where(n => n.CategoryID == 4).Where(n => n.Status == true).ToList();
                if (lv == null)
                {
                    logger.Error("LV is null or id not ==4 or status is not true");
                }
                return PartialView(lv.ToPagedList(pageNum, pagesize));

            }
            catch (Exception ex)
            {

                logger.Debug("LV");
                return View();

            }

        }
        // Danh sách loại sản phẩm dạng menu
        public ActionResult ProductTypeMenu()
        {
            try
            {
                var productType = data.ProductTypes.ToList();
                if (productType == null)
                {
                    logger.Error("productType is null");
                }
                return PartialView(productType);

            }
            catch (Exception ex)
            {

                logger.Debug("ProductTypeMenu controller");
                return View();

            }


        }
        //Danh sách tất cả các tin tức
        public ActionResult New()
        {
            try
            {
                var New = data.News.OrderByDescending(n => n.CreateDate).Where(n => n.Status == true).ToList();
                if (New == null)
                {
                    logger.Error("News is null  or status is not true");
                }
                return PartialView(New);

            }
            catch (Exception ex)
            {

                logger.Debug("New controller");
                return View();

            }


        }
        // Bài Post theo chủ đề
        public ActionResult Pots(int? id)
        {
            try
            {
                var Pots = data.Posts.OrderByDescending(n => n.CreateDate).Where(n => n.Status == true).Where(n => n.CategoryID == id).ToList();
                if (Pots == null)
                {
                    logger.Error("Pots is null  or status is not true");
                }
                return PartialView(Pots);
            }
            catch (Exception ex)
            {

                logger.Debug("Pots controller");
                return View();

            }
        }
        //  Banner trang con
        public ActionResult Banner(string image, string title)
        {
            ViewBag.title = title;
            ViewBag.image = image;
            return PartialView();
        }
        //  tim kiem
        public ActionResult Seach(int? page, string key, int status = 0)
        {
            try
            {
                int pagesize = 10;
                int pageNum = (page ?? 1);
                if (status == 0)
                {
                    if (!String.IsNullOrEmpty(key))
                    {
                        var product = data.Products.Take(10).Where(n => n.ProductName.Contains(key)).ToList();
                        if (product.Count() == 0)
                        {
                            ViewBag.Status = 1;
                            var news = data.NewDetails.Where(n => n.Title.Contains(key)).Where(n => n.Priority == 0).Take(10).ToList();
                            if (news.Count() == 0)
                            {
                                ViewBag.Status = 2;
                                return PartialView();
                            }
                            else
                                return PartialView(news);
                        }
                        else
                        {
                            return PartialView(product.ToPagedList(pageNum, pagesize));
                        }
                    }
                }
                else
                {
                    var product = data.Products.Where(n => n.ProductName.Contains(key)).ToList();
                    return PartialView(product);
                }

                return View();
            }
            catch (Exception ex)
            {

                logger.Debug("Seach controller");
                return View();

            }
        }
    }
}