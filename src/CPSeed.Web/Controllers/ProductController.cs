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
        public ActionResult Index(int ? page)
        {
            int pagesize = 6;
            int pageNum = (page ?? 1);
            var productType = data.ProductTypes.ToList();
            var product = data.Products.ToList();
            return View(product.ToPagedList(pageNum, pagesize));
        }
        public ActionResult productType( int ?id)
        {
            var productType = data.ProductTypes.ToList();
            ViewBag.Status = id;
            return PartialView(productType);
        }
        public ActionResult productTypeDetail(int? id)
        {       
            var product = data.Products.Where(n => n.ProductTypeID == id);
            ViewBag.Count = data.Products.Where(n => n.ProductTypeID == id).Count();
            return View(product);
        }
        public ActionResult productDetail(String id)
        {
            var product = data.Products.Where(n => n.ProductID == id);
            var image = data.Images.Where(n => n.ProductID == id);
            ViewBag.images = image;
            return View(product.Single());
        }
    }
}