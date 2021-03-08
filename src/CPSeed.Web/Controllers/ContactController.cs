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
        [HttpPost]
        public ActionResult TinyMceUpload(HttpPostedFileBase file)
        {
            //Response.AppendHeader("Access-Control-Allow-Origin", "*");

            var location = SaveFile(Server.MapPath("~/uploads/"), file);

            return Json(new { location }, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// Saves the contents of an uploaded image file.
        /// </summary>
        /// <param name="targetFolder">Location where to save the image file.</param>
        /// <param name="file">The uploaded image file.</param>
        /// <exception cref="InvalidOperationException">Invalid MIME content type.</exception>
        /// <exception cref="InvalidOperationException">Invalid file extension.</exception>
        /// <exception cref="InvalidOperationException">File size limit exceeded.</exception>
        /// <returns>The relative path where the file is stored.</returns>
        private static string SaveFile(string targetFolder, HttpPostedFileBase file)
        {
            const int megabyte = 1024 * 1024;

            if (!file.ContentType.StartsWith("image/"))
            {
                throw new InvalidOperationException("Invalid MIME content type.");
            }

            var extension = Path.GetExtension(file.FileName.ToLowerInvariant());
            string[] extensions = { ".gif", ".jpg", ".png", ".svg", ".webp" };
            if (!extensions.Contains(extension))
            {
                throw new InvalidOperationException("Invalid file extension.");
            }

            if (file.ContentLength > (8 * megabyte))
            {
                throw new InvalidOperationException("File size limit exceeded.");
            }

            var fileName = Guid.NewGuid() + extension;
            var path = Path.Combine(targetFolder, fileName);
            file.SaveAs(path);

            return Path.Combine("/uploads", fileName).Replace('\\', '/');
        }

    }
}