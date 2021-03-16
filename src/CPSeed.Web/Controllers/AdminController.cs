using CPSeed.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CPSeed.Controllers
{
    public class AdminController : Controller
    {
        CPSeedContext data = new CPSeedContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Home()
        {
            return View();
        }
        [HttpGet]
        public ActionResult AddProduct()
        {
            ViewBag.ProductTypeID = new SelectList(data.ProductTypes.ToList().OrderBy(n => n.ProductTypeName), "ProductTypeID", "ProductTypeName");
            return View();
        }        
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddProduct(FormCollection collection, Product product, HttpPostedFileBase fileUpload)
        {
            ViewBag.ProductTypeID = new SelectList(data.ProductTypes.ToList().OrderBy(n => n.ProductTypeName), "ProductTypeID", "ProductTypeName");

            if(fileUpload == null)
            {
                ViewBag.ThongBao = "Please enter image!";
                return this.View();
            }

            var productid = collection["ProductID"];
            var productname = collection["ProductName"];            
            var producttypeid = collection["ProductTypeID"];            
            var buypricecurrent = collection["BuyPriceCurrent"];
            var sellprice = collection["SellPrice"];
            var descriptionn = collection["description"];


            if (String.IsNullOrEmpty(productid))
            {
                ViewData["Loi1"] = "Please enter product ID !";
            }
            else if (String.IsNullOrEmpty(productname))
            {
                ViewData["Loi2"] = "Please enter product name !";
            }
            else if (String.IsNullOrEmpty(producttypeid))
            {
                ViewData["Loi3"] = "Please choose product type !";
            }
            else if (String.IsNullOrEmpty(buypricecurrent))
            {
                ViewData["Loi4"] = "Please enter buy price !";
            }
            else if (String.IsNullOrEmpty(sellprice))
            {
                ViewData["Loi5"] = "Please enter sell price !";
            }
            else if (String.IsNullOrEmpty(descriptionn))
            {
                ViewData["Loi6"] = "Pleas enter description !";
            }
            else
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/images/Product"), fileName);
                fileUpload.SaveAs(path);       
                
                product.ProductID = productid;
                product.ProductName = productname;
                product.ProductTypeID = int.Parse(producttypeid);
                product.BuyPriceCurrent = Decimal.Parse(buypricecurrent);
                product.SellPrice = Decimal.Parse(sellprice);
                product.description = descriptionn;
                product.image = fileName;
                product.UnitID = "UnitID";
                product.UnitName = "UnitName";
                product.ProviderID = "ProviderID";
                product.ProviderName = "ProviderName";
                product.BuyPriceAverage = Decimal.Parse(buypricecurrent);
                product.BuyPricePrevious = Decimal.Parse(buypricecurrent);
                product.ExportBuy = 1;
                product.ExportOffer = 1;
                product.IsDeleted = false;
                product.CreateUser = "tri";
                product.UpdateUser = "tri";
                //if(product.CreateDate != null)
                //{
                //    product.UpdateDate = DateTime.Now;
                //}
                //else
                //{
                    product.CreateDate = DateTime.Now;
                    product.UpdateDate = DateTime.Now;
                //}
                data.Products.Add(product);
                data.SaveChanges();
                return RedirectToAction("Product");
            }
            return this.AddProduct();           
        }
        public ActionResult Product()
        {
            return View(data.Products.ToList());
        }
        public ActionResult ProductTypes()
        {
            return View(data.ProductTypes.ToList());
        }
        [HttpGet]
        public ActionResult EditProduct(string id)
        {
            Product product = data.Products.SingleOrDefault(n => n.ProductID == id);
            if (product == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.ProducttypeID = new SelectList(data.ProductTypes.ToList().OrderBy(n => n.ProductTypeName), "ProductTypeID", "ProductTypeName", product.ProductID);
            return View(product);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditProduct(Product product)
        {

            data.Entry(product).State = System.Data.Entity.EntityState.Modified;
            data.SaveChanges();

            ViewBag.ProducttypeID = new SelectList(data.ProductTypes.ToList().OrderBy(n => n.ProductTypeName), "ProductTypeID", "ProductTypeName",product.ProductID);
            ViewBag.ProductID = product.ProductID;
            return RedirectToAction("Product");
        }
        [HttpGet]
        public ActionResult DeleteProduct(string id)
        {
            Product product = data.Products.SingleOrDefault(n => n.ProductID == id);         
            if (product == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.ProductTypeID = product.ProductID;
            return View(product);
        }
        [HttpPost, ActionName("DeleteProduct")]
        public ActionResult DeleteAllProduct(string id)
        {
            Product product = data.Products.SingleOrDefault(n => n.ProductID == id);
            ViewBag.ProductTypeID = product.ProductID;
            if (product == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.Products.Remove(product);
            data.SaveChanges();
            return RedirectToAction("Product");
        }
        public ActionResult Post()
        {
            return View(data.Posts.ToList());
        }
        public ActionResult Slide()
        {
            return View(data.Slides.ToList());
        }
        
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if(String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập !";
            } else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu !";
            } else
            {
                
            }
            return View();
        }
        public ActionResult Accounts()
        {
            return View();
        }
        [HttpGet]
        public ActionResult AddPost()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddPost(FormCollection collection, Post post)
        {
            var postid = collection["PostID"];
            var title = collection["title"];
            var summary = collection["Summary"];
            var contentss = collection["contents"];
            var imagee = collection["image"];
            var categoryid = collection["CategoryID"];
            post.PostID = int.Parse(postid);
            post.Title = title;
            post.Summary = summary;
            post.contents = contentss;
            post.image = null;
            post.CategoryID = int.Parse(categoryid);
            post.Status = true;
            post.IsDeleted = false;
            post.CreateDate = DateTime.Now;
            post.UpdateDate = DateTime.Now;
            post.PublicDate = DateTime.Now;
            post.CreateUser = "tri";
            post.Priority = 1;
            data.Posts.Add(post);
            data.SaveChanges();



            return this.AddProduct();
        }
        public String ProcessUpload(HttpPostedFileBase file)
        {
            file.SaveAs(Server.MapPath("~/images/" + file.FileName));
            return "/images/" + file.FileName;
        }





    }
}