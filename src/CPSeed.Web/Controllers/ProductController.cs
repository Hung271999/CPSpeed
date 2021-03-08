using CPSeed.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
namespace CPSeed.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        CPSeedContext data = new CPSeedContext();
        public ActionResult Index()
        {    
            return View();
        }
        public PartialViewResult GetPaging(int ? page)
        {
           // System.Threading.Thread.Sleep(2000);
            int pagesize = 10;
            int pageNum = (page ?? 1);
            var product = data.Products.ToList();
            return PartialView("Product",product.ToPagedList(pageNum,pagesize));
        }
        public PartialViewResult Products2(int? page)
        {
            int pagesize = 10;
            int pageNum = (page ?? 1);
            var product = data.Products.ToList();
            return PartialView(product.ToPagedList(pageNum, pagesize));
        }
        public ActionResult productType( int ?id)
        {
            var productType = data.ProductTypes.ToList();
            ViewBag.Status = id;
            return PartialView(productType);
        }
        public ActionResult productTypeDetail(int? page, int? id)
        {
            ViewBag.id = id;
            int pagesize = 10;
            int pageNum = (page ?? 1);
            var product = data.Products.Where(n => n.ProductTypeID == id);
            ViewBag.Count = data.Products.Where(n => n.ProductTypeID == id).Count();
            return View(product.OrderBy(n=>n.CreateDate).ToPagedList(pageNum, pagesize));
        }
        
        public ActionResult productDetail(string id)
        {
            var product = data.Products.Where(n => n.ProductID == id);
            var image = data.Images.Where(n => n.ProductID == id);
            ViewBag.count = image.Count();
            ViewBag.images = image;
            return View(product.Single());
        }
        public ActionResult producPart(int? page, int? id)
        {
            int pagesize = 10;
            int pageNum = (page ?? 1);
            var product = data.Products.Where(n => n.ProductTypeID == id);
            return PartialView(product.OrderBy(n => n.CreateDate).ToPagedList(pageNum, pagesize));
        }
        public ActionResult list_viewt(int? page, int? id)
        {
            ViewBag.id = id;
            int pagesize = 10;
            int pageNum = (page ?? 1);
            var product = data.Products.Where(n => n.ProductTypeID == id);
            return PartialView(product.OrderBy(n => n.CreateDate).ToPagedList(pageNum, pagesize));
        }
        public ActionResult select(int ?value, int? id, int? page)
        {
            int pagesize = 10;
            int pageNum = (page ?? 1);
            ViewBag.value = value;
            if (id !=null)
            {
                if (value == 2)
                {
                    var product = data.Products.Where(n=>n.ProductTypeID==id).ToList();
                    return PartialView(product.OrderBy(n => n.SellPrice).ToPagedList(pageNum, pagesize));
                }
                else if (value == 3)
                {
                    var product = data.Products.Where(n => n.ProductTypeID == id).ToList();
                    return PartialView(product.OrderByDescending(n => n.SellPrice).ToPagedList(pageNum, pagesize));
                }
            }
            else
            {
                if (value == 2)
                {
                    var product = data.Products.ToList();
                    return PartialView(product.OrderBy(n => n.SellPrice).ToPagedList(pageNum, pagesize));
                }
                else if (value == 3)
                {
                    var product = data.Products.ToList();
                    return PartialView(product.OrderByDescending(n => n.SellPrice).ToPagedList(pageNum, pagesize));
                }
            }
            return PartialView();
        }
    }
}