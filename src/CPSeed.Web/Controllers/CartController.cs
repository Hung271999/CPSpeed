using CPSeed.Models;
using CPSeed.Models.Cart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;

namespace CPSeed.Controllers
{
    public class CartController : Controller
    {
        private static log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        CPSeedContext data = new CPSeedContext();
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }

        public List<Cart> Laygiohang()
        {
            if (this.Session["Cart"] == null)
            {
                this.Session["Cart"] = new List<Cart>();
            }
            return this.Session["Cart"] as List<Cart>;
        }
        public ActionResult ThemGiohang(String ProductID, string strURL)
        {
            List<Cart> lstGiohang = Laygiohang();
            Cart sanpham = lstGiohang.Find(n => n.iProductID == ProductID);
            if (sanpham == null)
            {
                sanpham = new Cart(ProductID);
                lstGiohang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.quantity++;
                return Redirect(strURL);
            }
        }


        public ActionResult GioHang()
        {
            List<Cart> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                logger.Debug("Back to Home");
                return RedirectToAction("Index", "Home");
            }
            ViewBag.Tongsoluong = lstGiohang.Sum(n => n.quantity);
            ViewBag.Tongtien = lstGiohang.Sum(n => n.total);
            return View(lstGiohang);
        }

        public ActionResult TotalMoney()
        {
            List<Cart> lstGiohang = Session["Cart"] as List<Cart>;
            if (lstGiohang != null)
            {
                ViewBag.Total = lstGiohang.Sum(n => n.quantity * n.sSellPrice);
                return PartialView();
            }
            ViewBag.Total = 0;
            return PartialView(); ;
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            if (User.Identity.IsAuthenticated)
            {
                if (Session["Cart"] == null)
                {
                    return RedirectToAction("index", "Home");
                }
                else
                {
                    List<Cart> lstGiohang = Laygiohang();
                    ViewBag.Tongsoluong = lstGiohang.Sum(n => n.quantity);
                    ViewBag.Tongtien = lstGiohang.Sum(n => n.total);
                    return View(lstGiohang);
                }
            }
            else
            {
                return RedirectToAction("Login", "Account");
            }
        }

        [HttpPost]
        public ActionResult DatHang(FormCollection Form, Order order)
        {
            var firstName = Form["firstName"];
            var lastName = Form["lastName"];
            var email = Form["email"].ToString();
            var phone = Form["Phone"].ToString();
            var address = Form["address"];
            List<Cart> lstGiohang = Laygiohang();
            order.Priority = lstGiohang.Sum(n => n.quantity);
            order.Status = false;
            order.Paid = false;
            order.CreateUser = firstName + lastName;
            order.UpdateUser = firstName + lastName;
            order.CreateDate = DateTime.Now;
            order.ReceivedDate = DateTime.Now;
            order.UpdateDate = DateTime.Now;
            order.Total = lstGiohang.Sum(n => (n.total * n.sSellPrice));
            order.Email = email;
            order.Phone = phone;
            order.Address = address;
            data.Orders.Add(order);
            data.SaveChanges();
            foreach (var item in lstGiohang)
            {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.OrderID = order.OrderID;
                orderDetail.ProductID = item.iProductID;
                orderDetail.Quantity = item.quantity;
                orderDetail.SellPrice = (decimal)item.sSellPrice;
                data.OrderDetails.Add(orderDetail);
                data.SaveChanges();
            }
            Session["Cart"] = null;
            return Content("<script language='javascript' type='text/javascript'>alert('Đặt hàng thành công ');window.location.href = '../';</script>");
        }

        [HttpPost]
        public JsonResult AddToCart(string id)
        {
            List<Cart> lstGiohang = Laygiohang();
            Cart sanpham = lstGiohang.Find(n => n.iProductID == id);
            if (sanpham == null)
            {
                sanpham = new Cart(id);
                lstGiohang.Add(sanpham);
            }
            else
            {
                sanpham.quantity++;
            }
            var sl = lstGiohang.Sum(n => n.quantity);
            Session["Count"] = sl;
            var counter = lstGiohang.Sum(x => x.quantity);

            return Json(new { counter, sl1 = sl }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddToCartInDetails(string id, int count)
        {

            List<Cart> lstGiohang = Laygiohang();
            Cart cartItem = lstGiohang.Find(x => x.iProductID == id);

            if (cartItem == null)
            {
                cartItem = new Cart(id);
                cartItem.quantity = count;
                lstGiohang.Add(cartItem);
            }
            else
            {
                cartItem.quantity += count;
            }

            var counter = lstGiohang.Sum(x => x.quantity);

            return Json(counter, JsonRequestBehavior.AllowGet);
        }

        public ActionResult RemoveFromCart(string id, string strURL)
        {
            List<Cart> lstGiohang = Laygiohang();
            Cart item = lstGiohang.SingleOrDefault(x => x.iProductID == id);
            if (item != null)
            {
                lstGiohang.RemoveAll(x => x.iProductID == id);
            }

            return Redirect(strURL);
        }

        [HttpPost]
        public JsonResult UpdateQuantity(string id, int count)
        {
            List<Cart> lstGiohang = Laygiohang();
            Cart cartItem = lstGiohang.Find(x => x.iProductID == id);

            cartItem.quantity = count;

            var counter = cartItem.quantity;
            var sl = lstGiohang.Sum(n => n.quantity);
            var total = lstGiohang.Sum(n => n.total);


            return Json(new { count = counter, totalMoney = total, sl1 = sl }, JsonRequestBehavior.AllowGet);
        }

    }
}