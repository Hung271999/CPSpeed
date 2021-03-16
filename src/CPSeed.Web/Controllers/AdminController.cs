using CPSeed.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            ViewBag.ProductTypeID = new SelectList(data.ProductTypes.ToList().OrderBy(n => n.ProductTypeName), "ProductTypeID", "ProductTypeName");
            int sp = Decimal.ToInt32((decimal)product.SellPrice);
            int bp = Decimal.ToInt32((decimal)product.BuyPriceCurrent);

            ViewBag.SellPrice = sp;
            ViewBag.BuyPrice = bp;
            return View(product);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditProduct(FormCollection collection, Product product, HttpPostedFileBase fileUpload)
        {
            ViewBag.ProductTypeID = new SelectList(data.ProductTypes.ToList().OrderBy(n => n.ProductTypeName), "ProductTypeID", "ProductTypeName");
            if (fileUpload == null)
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
                //product.CreateUser = "tri";
                product.UpdateUser = "tri";
                //if(product.CreateDate != null)
                //{
                //    product.UpdateDate = DateTime.Now;
                //}
                //else
                //{
                //product.CreateDate = DateTime.Now;
                product.UpdateDate = DateTime.Now;
                //}



                data.Entry(product).State = EntityState.Modified;
                data.SaveChanges();
                return RedirectToAction("Product");
            }
            return View();
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
            ProductType producttype = data.ProductTypes.SingleOrDefault(n => n.ProductTypeID == product.ProductTypeID);
            int sp = Decimal.ToInt32((decimal)product.SellPrice);
            int bp = Decimal.ToInt32((decimal)product.BuyPriceCurrent);

            ViewBag.ProductType = producttype.ProductTypeName;
            ViewBag.SellPrice = sp;
            ViewBag.BuyPrice = bp;
            return View(product);
        }
        [HttpPost, ActionName("DeleteProduct")]
        public ActionResult DeleteAllProduct(string id)
        {
            Product product = data.Products.SingleOrDefault(n => n.ProductID == id);            
            if (product == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.Products.Remove(product);
            data.SaveChanges();
            return RedirectToAction("Product");
        }
        public ActionResult Post()        {
            
            return View(data.Posts.ToList());
        }
        [HttpGet]
        public ActionResult AddPost()
        {            
            ViewBag.CategoryPost = new SelectList(data.Categories.ToList().OrderBy(n => n.Title), "CategoryID", "Title");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddPost(FormCollection collection, Post post, HttpPostedFileBase fileUpload)
        {
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Please enter image!";
                return this.View();
            }
            ViewBag.CategoryPost = new SelectList(data.Categories.ToList().OrderBy(n => n.Title), "CategoryID", "Title");

            var postid = collection["PostID"];
            var title = collection["Title"];
            var summary = collection["Summary"];
            var contentss = collection["Content"];            
            var categoryid = collection["CategoryPost"];
            if (String.IsNullOrEmpty(postid))
            {
                ViewData["Loi1"] = "Please enter PostID !";
            }
            else if (String.IsNullOrEmpty(title))
            {
                ViewData["Loi2"] = "Please enter title !";
            }
            else if (String.IsNullOrEmpty(summary))
            {
                ViewData["Loi3"] = "Please choose Summary !";
            }
            else if (String.IsNullOrEmpty(contentss))
            {
                ViewData["Loi4"] = "Please enter contents !";
            }
             else if (String.IsNullOrEmpty(categoryid))
            {
                ViewData["Loi5"] = "Pleas enter CategoryID !";
            }
            else
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/images/Post"), fileName);
                fileUpload.SaveAs(path);

                post.PostID = int.Parse(postid);
                post.Title = title;
                post.Summary = summary;
                post.contents = contentss;
                post.image = fileName;
                post.CategoryID = int.Parse(categoryid);
                post.Status = true;
                post.IsDeleted = false;
                post.CreateDate = DateTime.Now;
                post.UpdateDate = DateTime.Now;
                post.PublicDate = DateTime.Now;
                post.CreateUser = "tri";
                post.UpdateUser = "tri";
                post.Priority = 0;

                data.Posts.Add(post);
                data.SaveChanges();
                return RedirectToAction("Post");
            }

            return this.AddPost();
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
        
        public String ProcessUpload(HttpPostedFileBase file)
        {
            file.SaveAs(Server.MapPath("~/images/Product/" + file.FileName));
            return "/images/Product/" + file.FileName;
        }





    }
}