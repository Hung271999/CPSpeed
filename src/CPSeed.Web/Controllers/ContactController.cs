using CPSeed.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CPSeed.Controllers
{
    public class ContactController : Controller
    {
        CPSeedContext data = new CPSeedContext();
        // GET: Contact
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(FormCollection Form, Contactus contact)
        {
            var Name = Form["name"];
            var Email = Form["email"];
            var Message =Form["message"];
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
        public ActionResult Contact()
        {
            var contact = data.Contacts.ToList();
            return PartialView(contact);
        }

    }
}