using CPSeed.Models;
using CPSeed.Models.Cart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CPSeed.Controllers
{
    public class CartController : Controller
    {
        CPSeedContext data = new CPSeedContext();
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }
        
        public List<Cart> Laygiohang()
        {
            List<Cart> lstGiohang = Session["Cart"] as List<Cart>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<Cart>();
                Session["Cart"] = lstGiohang;
            }
            return lstGiohang;
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
                return RedirectToAction("Index", "Home");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return View(lstGiohang);
        }
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<Cart> lstGiohang = Session["Cart"] as List<Cart>;
            if (lstGiohang != null)
            {
                iTongSoLuong = lstGiohang.Sum(n => n.quantity);
            }
            return iTongSoLuong;
        }
        private double TongTien()
        {
            double iTongTien = 0;
            List<Cart> lstGiohang = Session["Cart"] as List<Cart>;
            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.total);
            }
            return iTongTien;
        }
        public ActionResult GiohangPartial()
        {
            if (TongSoLuong() == 0)
            {
                return PartialView();
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return PartialView();
        }
        public ActionResult CapnhatGiohang(String ProductID, FormCollection f)
        {
            List<Cart> lstGiohang = Laygiohang();
            Cart sanpham = lstGiohang.SingleOrDefault(n => n.iProductID == ProductID);
            if (sanpham != null)
            {
                sanpham.quantity = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("Giohang");
        }
        public ActionResult XoaGiohang(String ProductID)
        {
            //Lay gio hang tu Session
            List<Cart> lstGiohang = Laygiohang();
            //Kiem tra sach da co trong Session["Giohang"]
            Cart sanpham = lstGiohang.SingleOrDefault(n => n.iProductID == ProductID);
            //Neu ton tai thi cho sua Soluong
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.iProductID == ProductID);
                return RedirectToAction("GioHang");

            }
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "ShoeStore");
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaTatcaGiohang()
        {
            //Lay gio hang tu Session
            List<Cart> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("Index", "ShoeStore");
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "Nguoidung");
            }
            if (Session["Giohang"] == null)
            {
                return RedirectToAction("Index", "ShoeStore");
            }

            List<Cart> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();

            return View(lstGiohang);
        }

    }
}