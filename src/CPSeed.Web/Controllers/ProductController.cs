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
        

        // trang chính product
        public ActionResult Index(int ? id )
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            using (CPSeedContext data = new CPSeedContext())
            {
                try
                {

                    if (id == null)
                    {
                        ViewBag.id = 0;
                        ViewBag.Count = data.Products.Count();
                    }
                    else
                    {
                        ViewBag.id = id;
                        ProductType a = data.ProductTypes.Where(n => n.ProductTypeID == id).SingleOrDefault();
                        ViewBag.name = a;
                        ViewBag.Count = data.Products.Where(n => n.ProductTypeID == id).Count();
                    }
                    return View();

                }
                catch (Exception ex)
                {

                    logger.Error("Index product mission" + ex);
                    return View();

                }
            }
           
        }
        // trang sản phẩm
        public PartialViewResult GetPaging(int? page, int status = 0, int id = 0)
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            using (CPSeedContext data = new CPSeedContext())
            {
                try
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
                        return PartialView("Product", product.OrderBy(n => n.CreateDate).ToPagedList(pageNum, pagesize));
                    }

                }
                catch (Exception ex)
                {

                    logger.Error("GetPaging" + ex);
                    return PartialView();
                }
            }
            
        }
        // menu loại sản phẩm
        public ActionResult productType( int ?id)
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            using (CPSeedContext data = new CPSeedContext())
            {
                try
                {
                    var productType = data.ProductTypes.ToList();
                    ViewBag.Status = id;
                    return PartialView(productType);

                }
                catch (Exception ex)
                {

                    logger.Error("productType" + ex);
                    return PartialView();
                }
            }
           
        }
        
        // chi tiết sản phẩm
        public ActionResult productDetail(string id)
        {
            CPSeedContext data = new CPSeedContext();
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            
            {
                try
                {
                    var product = data.Products.Where(n => n.ProductID == id);
                    var image = data.Images.Where(n => n.ProductID == id);
                    ViewBag.count = image.Count();
                    ViewBag.images = image;
                    return View(product.Single());

                }
                catch (Exception ex)
                {

                    logger.Error("productDetail" + ex);
                    return PartialView();
                }
            }
        }
        // lọc sản phẩm theo giá
        public ActionResult select(int ?value, int? id, int? page)
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            using (CPSeedContext data = new CPSeedContext())
            {
                try
                {
                    int pagesize = 6;
                    int pageNum = (page ?? 1);
                    ViewBag.value = value;
                    if (id != null)
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
                catch (Exception ex)
                {

                    logger.Error("select contronller" + ex);
                    return PartialView();
                }
            }
            
        }
    }
}