using CPSeed.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace CPSeed.Controllers
{
    public class ContactController : Controller
    {
        
        // GET: Contact
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        //  liên hệ
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(FormCollection Form, Contactus contact)
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();
            try
            {
                var Name = Form["name"];
                var Email = Form["email"];
                var Message = Form["message"];
                if (String.IsNullOrEmpty(Name))
                {
                    ViewBag.Message = "Không được để trống Name";
                }
                else if (String.IsNullOrEmpty(Email))
                {
                    ViewBag.Message = "Không được để trống Email";
                }
                else if (String.IsNullOrEmpty(Message))
                {
                    ViewBag.Message = "Không được để trống Messgae";
                }
                else
                {
                    contact.CreateUser = Name;
                    contact.Email = Email;
                    contact.contents = Message;
                    contact.CreateDate = DateTime.Now;
                    data.Contactus.Add(contact);
                    data.SaveChanges();
                    ViewBag.Status = 1;
                    ViewBag.Message = "Thông tin của bạn đã được ghi lại";
                }
                return View();
            }
            catch (Exception ex)
            {
                logger.Error("Index"+ex);
                return View();
            }
           
        }
        // bản đồ
        public ActionResult Contact()
        {
            log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            CPSeedContext data = new CPSeedContext();
            try
            {
                var contact = data.Contacts.ToList();
                return PartialView(contact);
            }
            catch (Exception ex)
            {
                logger.Error("Contact" + ex);
                return View();
            }
           
        }
       
    }
}