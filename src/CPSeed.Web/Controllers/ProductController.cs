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
        public ActionResult Index(int ? id )
        {
            if (id == null)
            {
                ViewBag.id = 0;
                ViewBag.Count = data.Products.Count();
            }
            else
            {
                ViewBag.id = id;
                ViewBag.Count=data.Products.Where(n => n.ProductTypeID == id).Count();
            }
            return View();
        }
        public PartialViewResult GetPaging(int? page, int status = 0, int id = 0)
        {
            if (id == 0)
            {
                int pagesize = 6;
                int pageNum = (page ?? 1);
                var product = data.Products.ToList();
                return PartialView("Product", product.ToPagedList(pageNum, pagesize));
            }
            else
            {
                ViewBag.id = id;
                int a = id;
                int pagesize = 6;
                int pageNum = (page ?? 1);
                var product = data.Products.Where(n => n.ProductTypeID == a);
                return PartialView("Product", product.OrderBy(n=>n.CreateDate).ToPagedList(pageNum, pagesize));
            }
            return PartialView();
        }
        public ActionResult productType( int ?id)
        {
            var productType = data.ProductTypes.ToList();
            ViewBag.Status = id;
            return PartialView(productType);
        }
        
        public ActionResult productDetail(string id)
        {
            var product = data.Products.Where(n => n.ProductID == id);
            var image = data.Images.Where(n => n.ProductID == id);
            ViewBag.count = image.Count();
            ViewBag.images = image;
            return View(product.Single());
        }
        public ActionResult select(int ?value, int? id, int? page)
        {
            int pagesize = 6;
            int pageNum = (page ?? 1);
            ViewBag.value = value;
            if (id !=null)
            {
                var product = data.Products.Where(n => n.ProductTypeID == id).ToList();
                if (value == 2)
                {
                    return PartialView(product.OrderBy(n => n.SellPrice).ToPagedList(pageNum, pagesize));
                }
                else if (value == 3)
                {
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