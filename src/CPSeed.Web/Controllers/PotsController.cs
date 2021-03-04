using CPSeed.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CPSeed.Controllers
{
    public class PotsController : Controller
    {
        CPSeedContext data = new CPSeedContext();
        // GET: Pots
        public ActionResult Index()
        {
            var td = data.Posts.Where(n => n.CategoryID == 3).Take(4).ToList();
            return View(td);
        }
    }
}