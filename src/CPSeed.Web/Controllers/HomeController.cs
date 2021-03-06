﻿using CPSeed.Models;
using CPSeed.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

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
        // Tầm nhìn sứ mệnh
        public ActionResult Vision_mission(int ? id)
        {
            Category CategoryPosts = data.Categories.Where(n => n.CategoryID == id).Where(n => n.Status == true).SingleOrDefault();
            ViewBag.Message = CategoryPosts;
            var vs = data.Posts.Where(n => n.CategoryID == 1).ToList();
            return PartialView(vs);
        }
        // Danh sách các sản phẩm
        public ActionResult ProductType()
        {

            var productType = data.ProductTypes.ToList();
            return PartialView(productType);
        }
        // Tin tức được ưu tiên
        public ActionResult News()
        {
            var News = data.NewDetails.OrderByDescending(n => n.CreateDate).Where(n=>n.Status==true).Where(n=>n.Priority==1).ToList();
            return PartialView(News);
        }
        // Footer thông tin liên lạc
        public ActionResult Contacts()
        {
            var Contact = data.Contacts.Where(n => n.Status == true).ToList();
            return PartialView(Contact);
        }
        // Bannner
        public ActionResult Slide()
        {
            var Slide = data.Slides.Where(n => n.Status == true).ToList();
            return PartialView(Slide);
        }
        // Công nghệ
        public ActionResult Technology(int ?page)
        {
            int pagesize = 1;
            int pageNum = (page ?? 1);
            var Technology = data.Posts.Where(n => n.CategoryID == 2). Where(n=>n.Status == true).ToList();
            return PartialView(Technology.ToPagedList(pageNum,pagesize));
        }
        // Danh sách loại sản phẩm dạng menu
        public ActionResult ProductTypeMenu()
        {

            var productType = data.ProductTypes.ToList();
            return PartialView(productType);
        }
        //Danh sách tất cả các tin tức
        public ActionResult New()
        {
            var New = data.News.OrderByDescending(n => n.CreateDate).Where(n => n.Status == true).ToList();
            return PartialView(New);
        }
        // Bài Post theo chủ đề
        public ActionResult Pots(int ?id)
        {
            var Pots = data.Posts.OrderByDescending(n => n.CreateDate).Where(n => n.Status == true).Where(n=>n.CategoryID==id).ToList();
            return PartialView(Pots);
        }

    }
}