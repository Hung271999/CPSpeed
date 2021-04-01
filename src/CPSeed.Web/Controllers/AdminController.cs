using CPSeed.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
namespace CPSeed.Controllers
{
    public class AdminController : Controller
    {
        CPSeedContext data = new CPSeedContext();
        [Authorize(Roles = "Admin")]
        public ActionResult Index(int? page)
        {
            int pagesize = 1;
            int pageNum = (page ?? 1);
            var a = data.Orders.ToList().OrderBy(n => n.CreateDate);
            return View(a.ToPagedList(pageNum, pagesize));
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        public ActionResult Home()
        {
            return View();
        }
        //------------------------------------------------------------------------------------------------------------
        [Authorize(Roles = "Admin")]
        public ActionResult Product()
        {
            return View(data.Products.ToList());
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult AddProduct()
        {
            ViewBag.ProductTypeID = new SelectList(data.ProductTypes.ToList().OrderBy(n => n.ProductTypeName), "ProductTypeID", "ProductTypeName");

            return View();
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddProduct(FormCollection collection, Product product, HttpPostedFileBase fileUpload)
        {
            try
            {
                ViewBag.ProductTypeID = new SelectList(data.ProductTypes.ToList().OrderBy(n => n.ProductTypeName), "ProductTypeID", "ProductTypeName");

                var productid = collection["ProductID"];
                var a = data.Products.Where(n => n.ProductID == productid).Count();
                var productname = collection["ProductName"];
                var producttypeid = collection["ProductTypeID"];
                var buypricecurrent = collection["BuyPriceCurrent"];
                var sellprice = collection["SellPrice"];
                var picture = collection["picture"];
                var descriptionn = collection["description"];
                int ouput;
                bool result = int.TryParse(sellprice, out ouput);
                bool result2 = int.TryParse(buypricecurrent, out ouput);
                if (result == false)
                {
                    return RedirectToAction("AddProduct", "Admin");
                }
                if (result == false)
                {
                    return RedirectToAction("AddProduct", "Admin");
                }
                if (a > 0)
                {
                    ViewData["Loi1"] = "Id đã tồn tại!";
                }
                else if (String.IsNullOrEmpty(productid))
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
                else if (String.IsNullOrEmpty(picture))
                {
                    ViewData["Loi6"] = "Please choose image !";
                }
                else if (String.IsNullOrEmpty(descriptionn))
                {
                    ViewData["Loi7"] = "Please enter description !";
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
                    product.CreateUser = User.Identity.GetUserName();
                    product.UpdateUser = User.Identity.GetUserName();
                    product.CreateDate = DateTime.Now;
                    product.UpdateDate = DateTime.Now;

                    data.Products.Add(product);
                    data.SaveChanges();
                    return RedirectToAction("Product");
                }
                return this.AddProduct();
            }
            catch (Exception ex)
            {
                ViewData["Loi1"] = "Vui lòng nhập đúng thông tin!";
                return View();
            }
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult EditProduct(string id)
        {

            Product product = data.Products.SingleOrDefault(n => n.ProductID == id);
            if (product == null)
            {
                Response.StatusCode = 404;
                return null;
            };
            ViewBag.ProductTypeID = data.ProductTypes.ToList();
            int sp = Decimal.ToInt32((decimal)product.SellPrice);
            int bp = Decimal.ToInt32((decimal)product.BuyPriceCurrent);

            ViewBag.SellPrice = sp;
            ViewBag.BuyPrice = bp;
            return View(product);
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditProduct(FormCollection collection, Product product, HttpPostedFileBase fileUpload, string id)
        {
            try
            {
                ViewBag.ProductTypeID = data.ProductTypes.ToList();
                var productid = collection["ProductID"];
                var a = data.Products.Where(n => n.ProductID == productid);
                var productname = collection["ProductName"];
                var producttypeid = collection["ProductTypeID"];
                var buypricecurrent = collection["BuyPriceCurrent"];
                var sellprice = collection["SellPrice"];
                int ouput;
                bool result = int.TryParse(sellprice, out ouput);
                bool result2 = int.TryParse(buypricecurrent, out ouput);
                if (result == false)
                {
                    return RedirectToAction("EditProduct", "Admin", new { id = id });
                }
                if (result == false)
                {
                    return RedirectToAction("EditProduct", "Admin", new { id = id });
                }
                var picture = collection["picture"];
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
                    ViewData["Loi7"] = "Please enter description !";
                }
                else
                {
                    Product productroot = data.Products.SingleOrDefault(n => n.ProductID == id);
                    if (fileUpload != null)
                    {
                        var fileName = Path.GetFileName(fileUpload.FileName);
                        var path = Path.Combine(Server.MapPath("~/images/Product"), fileName);
                        fileUpload.SaveAs(path);
                        product.image = fileName;
                    }
                    else
                    {
                        product.image = productroot.image;
                    }

                    product.ProductID = productid;
                    product.ProductName = productname;
                    product.ProductTypeID = int.Parse(producttypeid);
                    product.BuyPriceCurrent = Decimal.Parse(buypricecurrent);
                    product.SellPrice = Decimal.Parse(sellprice);
                    product.description = descriptionn;
                    product.UnitID = "UnitID";
                    product.UnitName = "UnitName";
                    product.ProviderID = "ProviderID";
                    product.ProviderName = "ProviderName";
                    product.BuyPriceAverage = Decimal.Parse(buypricecurrent);
                    product.BuyPricePrevious = Decimal.Parse(buypricecurrent);
                    product.ExportBuy = 1;
                    product.ExportOffer = 1;
                    product.IsDeleted = false;
                    product.CreateDate = productroot.CreateDate;
                    product.CreateUser = productroot.CreateUser;
                    product.UpdateUser = User.Identity.GetUserName();
                    product.UpdateDate = DateTime.Now;

                    //data.Entry(product).State = EntityState.Modified;
                    data.Products.AddOrUpdate(product);
                    data.SaveChanges();
                    return RedirectToAction("Product");
                }
                return View();
            }
            catch (Exception ex)
            {
                ViewData["Loi1"] = "Vui lòng nhập đúng thông tin !";
                return View();
            }
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
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



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
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



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        public ActionResult Post()
        {
            return View(data.Posts.ToList());
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult AddPost()
        {
            ViewBag.CategoryPost = new SelectList(data.Categories.ToList().OrderBy(n => n.Title), "CategoryID", "Title");
            return View();
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddPost(FormCollection collection, Post post, HttpPostedFileBase fileUpload)
        {
            try
            {
                ViewBag.CategoryPost = new SelectList(data.Categories.ToList().OrderBy(n => n.Title), "CategoryID", "Title");
                var title = collection["Title"];
                var summary = collection["Summary"];
                var contentss = collection["Content"];
                var categoryid = collection["CategoryPost"];
                var image = collection["picture"];
                var Priority = collection["Priority"];

                if (String.IsNullOrEmpty(title))
                {
                    ViewData["Loi2"] = "Please enter Title !";
                }
                else if (String.IsNullOrEmpty(summary))
                {
                    ViewData["Loi3"] = "Please enter Summary !";
                }
                else if (String.IsNullOrEmpty(contentss))
                {
                    ViewData["Loi4"] = "Please enter Contents !";
                }
                else if (String.IsNullOrEmpty(categoryid))
                {
                    ViewData["Loi5"] = "Please choose CategoryID !";
                }
                else if (String.IsNullOrEmpty(categoryid))
                {
                    ViewData["Loi6"] = "Please choose image !";
                }
                else
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/images/Post"), fileName);
                    fileUpload.SaveAs(path);
                    post.Title = title;
                    post.Summary = summary;
                    post.contents = contentss;
                    post.image = fileName;
                    post.CategoryID = int.Parse(categoryid);
                    post.Status = true;
                    post.IsDeleted = false;
                    post.CreateDate = post.UpdateDate = DateTime.Now;
                    post.PublicDate = DateTime.Now;
                    post.CreateUser = User.Identity.GetUserName();
                    post.UpdateUser = User.Identity.GetUserName();
                    post.Priority = int.Parse(Priority);

                    data.Posts.Add(post);
                    data.SaveChanges();
                    return RedirectToAction("Post");
                }

                return View();
            }
            catch (Exception e)
            {
                return RedirectToAction("AddPost");
            }

        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult EditPost(int id)
        {

            Post post = data.Posts.SingleOrDefault(n => n.PostID == id);
            if (post == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.CategoryPost = new SelectList(data.Categories.ToList().OrderBy(n => n.Title), "CategoryID", "Title");
            return View(post);
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditPost(FormCollection collection, Post post, HttpPostedFileBase fileUpload, int id)
        {
            try
            {
                var postid = collection["PostID"];
                var title = collection["Title"];
                var Priority = collection["Priority"];
                var summary = collection["Summary"];
                var contentss = collection["Content"];
                var categoryid = collection["CategoryPost"];
                var image = collection["picture"];
                if (string.IsNullOrEmpty(postid))
                {
                    ViewData["Loi1"] = "Please enter PostID !";
                }
                else if (String.IsNullOrEmpty(title))
                {
                    ViewData["Loi2"] = "Please enter Title !";
                }
                else if (String.IsNullOrEmpty(summary))
                {
                    ViewData["Loi3"] = "Please enter Summary !";
                }
                else if (String.IsNullOrEmpty(contentss))
                {
                    ViewData["Loi4"] = "Please enter Contents !";
                }
                else if (String.IsNullOrEmpty(categoryid))
                {
                    ViewData["Loi5"] = "Please choose CategoryID !";
                }
                else if (String.IsNullOrEmpty(categoryid))
                {
                    ViewData["Loi6"] = "Please choose image !";
                }
                else
                {
                    Post postroot = data.Posts.SingleOrDefault(n => n.PostID == id);
                    if (fileUpload != null)
                    {
                        var fileName = Path.GetFileName(fileUpload.FileName);
                        var path = Path.Combine(Server.MapPath("~/images/Post"), fileName);
                        fileUpload.SaveAs(path);
                        post.image = fileName;
                    }
                    else
                    {
                        post.image = postroot.image;
                    }

                    post.PostID = int.Parse(postid);
                    post.Title = title;
                    post.Summary = summary;
                    post.contents = contentss;
                    post.CategoryID = int.Parse(categoryid);
                    post.Status = true;
                    post.IsDeleted = false;
                    post.CreateDate = postroot.CreateDate;
                    post.PublicDate = postroot.PublicDate;
                    post.UpdateDate = DateTime.Now;
                    post.CreateUser = postroot.CreateUser;
                    post.UpdateUser = User.Identity.GetUserName();
                    post.Priority = int.Parse(Priority);

                    data.Posts.AddOrUpdate(post);
                    data.SaveChanges();
                    return RedirectToAction("Post");
                }

                return View();
            }
            catch (Exception e)
            {
                return RedirectToAction("EditPost", "Admin", new { id = id });
            }
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult DeletePost(int id)
        {
            Post post = data.Posts.SingleOrDefault(n => n.PostID == id);
            if (post == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            Category category = data.Categories.SingleOrDefault(n => n.CategoryID == post.CategoryID);

            ViewBag.Category = category.Title;
            return View(post);
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("DeletePost")]
        public ActionResult DeleteAllPost(int id)
        {
            Post post = data.Posts.SingleOrDefault(n => n.PostID == id);
            if (post == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.Posts.Remove(post);
            data.SaveChanges();
            return RedirectToAction("Post");
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        public ActionResult ProductTypes()
        {
            return View(data.ProductTypes.ToList());
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult AddProductType()
        {
            return View();
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddProductType(FormCollection collection, ProductType productType, HttpPostedFileBase fileUpload)
        {
            try
            {
                var producttypename = collection["ProductTypeName"];
                var image = collection["picture"];
                if (String.IsNullOrEmpty(producttypename))
                {
                    ViewData["Loi2"] = "Please enter Product Type Name !";
                }
                else
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);

                    var path = Path.Combine(Server.MapPath("~/images/producttype"), fileName);
                    fileUpload.SaveAs(path);
                    productType.ProductTypeName = producttypename;
                    productType.TaxPercent = 121;
                    productType.image = fileName;
                    productType.CreateDate = DateTime.Now;
                    productType.UpdateDate = DateTime.Now;
                    productType.CreateUser = User.Identity.GetUserName();
                    productType.UpdateUser = User.Identity.GetUserName();
                    data.ProductTypes.Add(productType);
                    data.SaveChanges();
                    return RedirectToAction("Product");
                }

                return this.AddProductType();
            }
            catch (Exception e)
            {
                return RedirectToAction("AddProductType");
            }

        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult DeleteProductType(int id)
        {
            ProductType productType = data.ProductTypes.SingleOrDefault(n => n.ProductTypeID == id);
            if (productType == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(productType);
        }



        //------------------------------------------------------------------------------------------------------------

        [Authorize(Roles = "Admin")]

        [HttpPost, ActionName("DeleteProductType")]
        public ActionResult DeleteAllProductType(int id)
        {
            ProductType productType = data.ProductTypes.SingleOrDefault(n => n.ProductTypeID == id);
            if (productType == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.ProductTypes.Remove(productType);
            data.SaveChanges();
            return RedirectToAction("Product");
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult EditProductType(int id)
        {
            ProductType productType = data.ProductTypes.SingleOrDefault(n => n.ProductTypeID == id);
            if (productType == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(productType);
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditProductType(FormCollection collection, ProductType productType, HttpPostedFileBase fileUpload, int id)
        {
            try
            {
                var producttypename = collection["ProductTypeName"];
                var image = collection["picture"];
                if (String.IsNullOrEmpty(producttypename))
                {
                    ViewData["Loi2"] = "Please enter Product Type Name !";
                }
                else
                {
                    ProductType productTyperoot = data.ProductTypes.SingleOrDefault(n => n.ProductTypeID == id);
                    if (fileUpload != null)
                    {
                        var fileName = Path.GetFileName(fileUpload.FileName);
                        var path = Path.Combine(Server.MapPath("~/images/producttype"), fileName);
                        fileUpload.SaveAs(path);
                        productType.image = fileName;
                    }
                    else
                    {
                        productType.image = productTyperoot.image;
                    }
                    productType.ProductTypeName = producttypename;
                    productType.CreateUser = productTyperoot.CreateUser;
                    productType.UpdateUser = User.Identity.GetUserName();
                    productType.TaxPercent = 121;
                    productType.CreateDate = productTyperoot.CreateDate;
                    productType.UpdateDate = DateTime.Now;

                    data.ProductTypes.AddOrUpdate(productType);
                    data.SaveChanges();
                    return RedirectToAction("Product");
                }

                return View();
            }
            catch (Exception ex)
            {
                return View();
            }
        }



        //------------------------------------------------------------------------------------------------------------

        [Authorize(Roles = "Admin")]
        public ActionResult Slide()
        {
            return View(data.Slides.ToList());
        }


        //------------------------------------------------------------------------------------------------------------
        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult AddSlide()
        {
            return View();
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddSlide(FormCollection collection, Slide slide, HttpPostedFileBase fileUpload)
        {
            var url = collection["Url"];
            var content = collection["Content"];
            var status = collection["Priority"];
            var image = collection["picture"];

            if (String.IsNullOrEmpty(url))
            {
                ViewData["Loi2"] = "Please enter Url !";
            }
            else if (String.IsNullOrEmpty(content))
            {
                ViewData["Loi3"] = "Please enter Content !";
            }
            else if (String.IsNullOrEmpty(image))
            {
                ViewData["Loi4"] = "Please choose image !";
            }
            else
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/images/banner"), fileName);
                fileUpload.SaveAs(path);
                slide.url = url;
                slide.contents = content;
                slide.image = fileName;
                slide.CreateDate = DateTime.Now;
                slide.UpdateDate = DateTime.Now;
                slide.PublicDate = DateTime.Now;
                slide.CreateUser = User.Identity.GetUserName();
                slide.UpdateUser = User.Identity.GetUserName();
                slide.Status = Boolean.Parse(status);
                data.Slides.Add(slide);
                data.SaveChanges();
                return RedirectToAction("Slide");
            }

            return this.AddSlide();
        }



        //------------------------------------------------------------------------------------------------------------

        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult EditSlide(int id)
        {
            Slide slide = data.Slides.SingleOrDefault(n => n.SlideID == id);
            if (slide == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(slide);
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditSlide(FormCollection collection, Slide slide, HttpPostedFileBase fileUpload, int id)
        {
            var url = collection["Url"];
            var content = collection["Content"];
            var status = collection["Priority"];
            var image = collection["picture"];

            if (String.IsNullOrEmpty(url))
            {
                ViewData["Loi2"] = "Please enter Url !";
            }
            else if (String.IsNullOrEmpty(content))
            {
                ViewData["Loi3"] = "Please enter Content !";
            }
            else if (String.IsNullOrEmpty(image))
            {
                ViewData["Loi4"] = "Please choose image !";
            }
            else
            {
                Slide slideroot = data.Slides.SingleOrDefault(n => n.SlideID == id);
                if (fileUpload != null)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/images/banner"), fileName);
                    fileUpload.SaveAs(path);
                    slide.image = fileName;
                }
                else
                {
                    slide.image = slideroot.image;
                }
                slide.url = url;
                slide.contents = content;
                slide.CreateDate = slideroot.CreateDate;
                slide.UpdateDate = DateTime.Now;
                slide.PublicDate = slideroot.PublicDate;
                slide.CreateUser = slideroot.CreateUser;
                slide.UpdateUser = User.Identity.GetUserName();

                data.Slides.AddOrUpdate(slide);
                data.SaveChanges();
                return RedirectToAction("Slide");
            }
            return View();
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult DeleteSlide(int id)
        {
            Slide slide = data.Slides.SingleOrDefault(n => n.SlideID == id);
            if (slide == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(slide);
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("DeleteSlide")]
        public ActionResult DeleteAllSlide(int id)
        {
            Slide slide = data.Slides.SingleOrDefault(n => n.SlideID == id);
            if (slide == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.Slides.Remove(slide);
            data.SaveChanges();
            return RedirectToAction("Slide");
        }



        //------------------------------------------------------------------------------------------------------------

        [Authorize(Roles = "Admin")]

        public ActionResult Category()
        {
            return View(data.Categories.ToList());
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult AddCategory()
        {
            return View();
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddCategory(FormCollection collection, Category category)
        {
            var title = collection["TitleCategory"];
            var Status = collection["Priority"];


            if (String.IsNullOrEmpty(title))
            {
                ViewData["Loi2"] = "Please enter Title !";
            }
            else
            {
                category.Title = title;
                category.Status = Boolean.Parse(Status);
                category.IsDeleted = false;
                category.CreateDate = category.UpdateDate = DateTime.Now;
                category.CreateUser = User.Identity.GetUserName();
                category.UpdateUser = User.Identity.GetUserName();
                data.Categories.Add(category);
                data.SaveChanges();
                return RedirectToAction("Post");
            }

            return View();
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult EditCategory(int id)
        {

            Category category = data.Categories.SingleOrDefault(n => n.CategoryID == id);
            if (category == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(category);
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditCategory(FormCollection collection, Category category, int id)
        {
            var title = collection["TitleCategory"];
            var Status = collection["Priority"];


            if (String.IsNullOrEmpty(title))
            {
                ViewData["Loi2"] = "Please enter Title !";
            }
            else
            {
                Category categoryroot = data.Categories.SingleOrDefault(n => n.CategoryID == id);
                category.Title = title;
                category.Status = Boolean.Parse(Status);
                category.IsDeleted = false;
                category.CreateDate = categoryroot.CreateDate;
                category.UpdateDate = DateTime.Now;
                category.CreateUser = categoryroot.CreateUser;
                category.UpdateUser = User.Identity.GetUserName();

                data.Categories.AddOrUpdate(category);
                data.SaveChanges();
                return RedirectToAction("Post");
            }
            return View();
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult DeleteCategory(int id)
        {
            Category category = data.Categories.SingleOrDefault(n => n.CategoryID == id);
            if (category == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(category);
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("DeleteCategory")]
        public ActionResult DeleteAllCategory(int id)
        {
            Category category = data.Categories.SingleOrDefault(n => n.CategoryID == id);
            if (category == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.Categories.Remove(category);
            data.SaveChanges();
            return RedirectToAction("Post");
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        public ActionResult Contact()
        {
            return View(data.Contacts.ToList());
        }


        //------------------------------------------------------------------------------------------------------------

        [Authorize(Roles = "Admin")]

        [HttpGet]
        public ActionResult AddContact()
        {
            return View();
        }



        //------------------------------------------------------------------------------------------------------------

        [Authorize(Roles = "Admin")]

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddContact(FormCollection collection, Contact contact)
        {
            var title = collection["TitleContact"];
            var content = collection["Content"];
            var icon = collection["Icon"];
            var url = collection["Url"];

            if (String.IsNullOrEmpty(title))
            {
                ViewData["Loi2"] = "Please enter Title !";
            }
            else if (String.IsNullOrEmpty(icon))
            {
                ViewData["Loi3"] = "Please enter Icon !";
            }
            else if (String.IsNullOrEmpty(url))
            {
                ViewData["Loi4"] = "Please enter Url !";
            }
            else if (String.IsNullOrEmpty(content))
            {
                ViewData["Loi5"] = "Please enter Content !";
            }
            else
            {
                contact.Title = title;
                contact.Status = true;
                contact.contents = content;
                contact.icons = icon;
                contact.url = url;

                data.Contacts.Add(contact);
                data.SaveChanges();
                return RedirectToAction("Contactus");
            }

            return View();
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult EditContact(int id)
        {

            Contact contact = data.Contacts.SingleOrDefault(n => n.ContactID == id);
            if (contact == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(contact);
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditContact(FormCollection collection, Contact contact, int id)
        {
            var contactid = collection["ContactID"];
            var title = collection["TitleContact"];
            var content = collection["Content"];
            var icon = collection["Icon"];
            var url = collection["Url"];

            if (string.IsNullOrEmpty(contactid))
            {
                ViewData["Loi1"] = "Please enter Category ID !";
            }
            else if (String.IsNullOrEmpty(title))
            {
                ViewData["Loi2"] = "Please enter Title !";
            }
            else if (String.IsNullOrEmpty(content))
            {
                ViewData["Loi3"] = "Please enter Content !";
            }
            else if (String.IsNullOrEmpty(icon))
            {
                ViewData["Loi4"] = "Please enter Icon !";
            }
            else if (String.IsNullOrEmpty(url))
            {
                ViewData["Loi5"] = "Please enter Url !";
            }
            else
            {
                Contact contactroot = data.Contacts.SingleOrDefault(n => n.ContactID == id);

                contact.ContactID = int.Parse(contactid);
                contact.Title = title;
                contact.Status = true;
                contact.contents = content;
                contact.icons = icon;
                contact.url = url;

                data.Contacts.AddOrUpdate(contact);
                data.SaveChanges();
                return RedirectToAction("Contactus");
            }
            return View();
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult DeleteContact(int id)
        {
            Contact contact = data.Contacts.SingleOrDefault(n => n.ContactID == id);
            if (contact == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(contact);
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("DeleteContact")]
        public ActionResult DeleteAllContact(int id)
        {
            Contact contact = data.Contacts.SingleOrDefault(n => n.ContactID == id);
            if (contact == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.Contacts.Remove(contact);
            data.SaveChanges();
            return RedirectToAction("Contactus");
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        public ActionResult Contactus()
        {
            return View(data.Contactus.ToList());
        }


        //------------------------------------------------------------------------------------------------------------



        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult DeleteContactus(int id)
        {
            Contactus contactus = data.Contactus.SingleOrDefault(n => n.ContactusID == id);
            if (contactus == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.Contactus.Remove(contactus);
            data.SaveChanges();
            return RedirectToAction("Contactus");
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("DeleteContactus")]
        public ActionResult DeleteAllContactus(int id)
        {
            Contactus contactus = data.Contactus.SingleOrDefault(n => n.ContactusID == id);
            if (contactus == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.Contactus.Remove(contactus);
            data.SaveChanges();
            return RedirectToAction("Contact");
        }



        //------------------------------------------------------------------------------------------------------------



        [Authorize(Roles = "Admin")]
        public ActionResult NewsDetail()
        {
            return View(data.NewDetails.ToList());
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult AddNewsDetail()
        {
            ViewBag.NewsID = new SelectList(data.News.ToList().OrderBy(n => n.Title), "NewsID", "Title");
            return View();
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddNewsDetail(FormCollection collection, NewDetail newDetail, HttpPostedFileBase fileUpload)
        {
            ViewBag.NewsID = new SelectList(data.News.ToList().OrderBy(n => n.Title), "NewsID", "Title");
            var title = collection["Title"];
            var Priority = collection["Priority"];
            var summary = collection["Summary"];
            var content = collection["Content"];
            var newsid = collection["NewsID"];
            var image = collection["picture"];
            if (String.IsNullOrEmpty(title))
            {
                ViewData["Loi2"] = "Please enter Title !";
            }
            else if (String.IsNullOrEmpty(summary))
            {
                ViewData["Loi3"] = "Please enter Summary !";
            }
            else if (String.IsNullOrEmpty(content))
            {
                ViewData["Loi4"] = "Please choose content!";
            }
            else if (String.IsNullOrEmpty(newsid))
            {
                ViewData["Loi5"] = "Please choose News ID !";
            }
            else if (String.IsNullOrEmpty(image))
            {
                ViewData["Loi6"] = "Please choose image !";
            }
            else
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/images/News"), fileName);
                fileUpload.SaveAs(path);
                newDetail.Title = title;
                newDetail.Summary = summary;
                newDetail.contents = content;
                newDetail.image = fileName;
                newDetail.NewsID = int.Parse(newsid);
                newDetail.Status = true;
                newDetail.IsDeleted = false;
                newDetail.CreateDate = newDetail.UpdateDate = DateTime.Now;
                newDetail.PublicDate = DateTime.Now;
                newDetail.CreateUser = User.Identity.GetUserName();
                newDetail.UpdateUser = User.Identity.GetUserName();
                newDetail.Priority = int.Parse(Priority);
                data.NewDetails.Add(newDetail);
                data.SaveChanges();
                return RedirectToAction("NewsDetail");
            }

            return View();
        }



        //------------------------------------------------------------------------------------------------------------

        [Authorize(Roles = "Admin")]

        [HttpGet]
        public ActionResult EditNewsDetail(int id)
        {

            NewDetail newDetail = data.NewDetails.SingleOrDefault(n => n.NewDetailID == id);
            if (newDetail == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.NewsID = new SelectList(data.News.ToList().OrderBy(n => n.Title), "NewsID", "Title");
            return View(newDetail);
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditNewsDetail(FormCollection collection, NewDetail newDetail, HttpPostedFileBase fileUpload, int id)
        {
            var title = collection["Title"];
            var Priority = collection["Priority"];
            var summary = collection["Summary"];
            var content = collection["contents"];
            var newsid = collection["NewsID"];
            var image = collection["picture"];

            if (String.IsNullOrEmpty(title))
            {
                ViewData["Loi2"] = "Please enter Title !";
            }
            else if (String.IsNullOrEmpty(summary))
            {
                ViewData["Loi3"] = "Please enter Summary !";
            }
            else if (String.IsNullOrEmpty(content))
            {
                ViewData["Loi4"] = "Please choose content!";
            }
            else if (String.IsNullOrEmpty(newsid))
            {
                ViewData["Loi5"] = "Please choose News ID !";
            }
            else if (String.IsNullOrEmpty(image))
            {
                ViewData["Loi6"] = "Please choose image !";
            }
            else
            {
                NewDetail newDetailroot = data.NewDetails.SingleOrDefault(n => n.NewDetailID == id);
                if (fileUpload != null)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/images/News"), fileName);
                    fileUpload.SaveAs(path);
                    newDetail.image = fileName;
                }
                else
                {
                    newDetail.image = newDetailroot.image;
                }
                newDetail.Title = title;
                newDetail.Summary = summary;
                newDetail.contents = content;
                newDetail.NewsID = int.Parse(newsid);
                newDetail.Status = true;
                newDetail.IsDeleted = false;
                newDetail.CreateDate = DateTime.Now;
                newDetail.UpdateDate = newDetailroot.UpdateDate;
                newDetail.PublicDate = DateTime.Now;
                newDetail.CreateUser = newDetailroot.UpdateUser;
                newDetail.UpdateUser = User.Identity.GetUserName();
                newDetail.Priority = int.Parse(Priority);

                data.NewDetails.AddOrUpdate(newDetail);
                data.SaveChanges();
                return RedirectToAction("NewsDetail");
            }

            return View();
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult DeleteNewsDetail(int id)
        {
            NewDetail newDetail = data.NewDetails.SingleOrDefault(n => n.NewDetailID == id);
            if (newDetail == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            News news = data.News.SingleOrDefault(n => n.NewsID == newDetail.NewsID);

            ViewBag.News = news.Title;
            return View(newDetail);
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("DeleteNewsDetail")]
        public ActionResult DeleteAllNewsDetail(int id)
        {
            NewDetail newDetail = data.NewDetails.SingleOrDefault(n => n.NewDetailID == id);
            if (newDetail == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.NewDetails.Remove(newDetail);
            data.SaveChanges();
            return RedirectToAction("NewsDetail");
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        public ActionResult News()
        {
            return View(data.News.ToList());
        }


        //------------------------------------------------------------------------------------------------------------

        [Authorize(Roles = "Admin")]

        [HttpGet]
        public ActionResult AddNews()
        {
            return View();
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddNews(FormCollection collection, News news)
        {
            var title = collection["TitleNews"];
            var status = collection["Priority"];
            if (String.IsNullOrEmpty(title))
            {
                ViewData["Loi2"] = "Please enter Title !";
            }
            else
            {
                news.Title = title;
                news.Status = Boolean.Parse(status);
                news.IsDeleted = false;
                news.CreateDate = news.UpdateDate = DateTime.Now;
                news.CreateUser = User.Identity.GetUserName();
                news.UpdateUser = User.Identity.GetUserName();
                data.News.Add(news);
                data.SaveChanges();
                return RedirectToAction("NewsDetail");
            }

            return View();
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult EditNews(int id)
        {

            News news = data.News.SingleOrDefault(n => n.NewsID == id);
            if (news == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(news);
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditNews(FormCollection collection, News news, int id)
        {
            var title = collection["TitleNews"];
            var status = collection["Priority"];
            if (String.IsNullOrEmpty(title))
            {
                ViewData["Loi2"] = "Please enter Title !";
            }
            else
            {
                News newsroot = data.News.SingleOrDefault(n => n.NewsID == id);
                news.Title = title;
                news.Status = Boolean.Parse(status);
                news.IsDeleted = false;
                news.CreateDate = newsroot.CreateDate;
                news.UpdateDate = DateTime.Now;
                news.CreateUser = newsroot.CreateUser;
                news.UpdateUser = User.Identity.GetUserName();

                data.News.AddOrUpdate(news);
                data.SaveChanges();
                return RedirectToAction("NewsDetail");
            }
            return View();
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult DeleteNews(int id)
        {
            News news = data.News.SingleOrDefault(n => n.NewsID == id);
            if (news == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(news);
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("DeleteNews")]
        public ActionResult DeleteAllNews(int id)
        {
            News news = data.News.SingleOrDefault(n => n.NewsID == id);
            if (news == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.News.Remove(news);
            data.SaveChanges();
            return RedirectToAction("NewsDetail");
        }


        //------------------------------------------------------------------------------------------------------------

        [Authorize(Roles = "Admin")]
        public ActionResult Order(int id)
        {
            var a = data.OrderDetails.Where(n => n.OrderID == id);
            return View(a);
        }



        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpGet]
        public ActionResult EditOrder(int id)
        {
            OrderDetail orderDetail = data.OrderDetails.SingleOrDefault(n => n.OrderDetailID == id);
            if (orderDetail == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.ProductName = new SelectList(data.Products.ToList().OrderBy(n => n.ProductName), "ProductID", "ProductName");
            int sp = Decimal.ToInt32((decimal)orderDetail.SellPrice);
            ViewBag.SellPrice = sp;
            ViewBag.Status = new List<string>()
            {
                "True","False"
            };
            ViewBag.Paid = new List<string>()
            {
                "True","False"
            };
            return View(orderDetail);
        }


        //------------------------------------------------------------------------------------------------------------


        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditOrder(FormCollection collection, Order order, OrderDetail orderDetail, int id)
        {
            var productName = collection["ProductName"];
            var quantity = collection["Quantity"];
            var sellPrice = collection["SellPrice"];
            var status = collection["Status"];
            var paid = collection["Paid"];
            var email = collection["Email"];
            var address = collection["Address"];
            var phone = collection["Phone"];

            if (string.IsNullOrEmpty(productName))
            {
                ViewData["Loi1"] = "Please enter Product Name !";
            }
            else if (String.IsNullOrEmpty(quantity))
            {
                ViewData["Loi2"] = "Please enter Quantity !";
            }
            else if (string.IsNullOrEmpty(sellPrice))
            {
                ViewData["Loi3"] = "Please enter Sell Price !";
            }
            else if (String.IsNullOrEmpty(status))
            {
                ViewData["Loi4"] = "Please enter Status !";
            }
            else if (string.IsNullOrEmpty(paid))
            {
                ViewData["Loi5"] = "Please enter Paid !";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi6"] = "Please enter Email !";
            }
            else if (string.IsNullOrEmpty(address))
            {
                ViewData["Loi7"] = "Please enter Address !";
            }
            else if (String.IsNullOrEmpty(phone))
            {
                ViewData["Loi8"] = "Please enter Phone !";
            }
            else
            {
                OrderDetail orderDetailRoot = data.OrderDetails.SingleOrDefault(n => n.OrderDetailID == id);
                Order orderRoot = data.Orders.SingleOrDefault(n => n.OrderID == orderDetailRoot.OrderID);

                orderDetail.OrderDetailID = orderDetailRoot.OrderDetailID;
                orderDetail.OrderID = orderDetailRoot.OrderID;

                order.OrderID = orderRoot.OrderID;
                order.CreateDate = orderRoot.CreateDate;
                order.UpdateDate = orderRoot.UpdateDate;
                order.ReceivedDate = orderRoot.ReceivedDate;
                order.CreateUser = orderRoot.CreateUser;
                order.UpdateUser = orderRoot.UpdateUser;
                order.Priority = orderRoot.Priority;
                order.Total = orderRoot.Total;


                orderDetail.ProductID = productName;
                orderDetail.Quantity = int.Parse(quantity);
                orderDetail.SellPrice = int.Parse(sellPrice);

                if (status == "True")
                {
                    order.Status = true;
                }
                else
                {
                    order.Status = false;
                }

                if (paid == "True")
                {
                    order.Paid = true;
                }
                else
                {
                    order.Paid = false;
                }
                order.Email = email;
                order.Address = address;
                order.Phone = phone;

                data.Orders.AddOrUpdate(order);
                data.OrderDetails.AddOrUpdate(orderDetail);
                data.SaveChanges();
                return RedirectToAction("Order");
            }
            return View();
        }



        //------------------------------------------------------------------------------------------------------------



        [HttpGet]
        public ActionResult DeleteOrder(int id)
        {
            OrderDetail orderDetail = data.OrderDetails.SingleOrDefault(n => n.OrderDetailID == id);
            if (orderDetail == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.OrderDetails.Remove(orderDetail);
            data.SaveChanges();
            return RedirectToAction("Order", new { id = orderDetail.OrderID }); ;
        }



        //------------------------------------------------------------------------------------------------------------



        [HttpPost, ActionName("DeleteOrder")]
        public ActionResult DeleteAllOrder(int id)
        {
            OrderDetail orderDetail = data.OrderDetails.SingleOrDefault(n => n.OrderDetailID == id);
            if (orderDetail == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.OrderDetails.Remove(orderDetail);
            data.SaveChanges();
            return RedirectToAction("Order");
        }


        //------------------------------------------------------------------------------------------------------------


        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }



        //------------------------------------------------------------------------------------------------------------




        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập !";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu !";
            }
            else
            {

            }
            return View();
        }



        //------------------------------------------------------------------------------------------------------------



        public ActionResult Accounts()
        {
            var context = new ApplicationDbContext();
            var allUsers = context.Users.ToList();
            return View(allUsers);
        }



        //------------------------------------------------------------------------------------------------------------




        public String ProcessUpload(HttpPostedFileBase file)
        {
            file.SaveAs(Server.MapPath("~/images/Product/" + file.FileName));
            return "/images/Product/" + file.FileName;
        }

    }
}