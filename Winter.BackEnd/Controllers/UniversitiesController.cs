using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Winter.BackEnd.Models.Domain;
using System.Web.UI.MobileControls;

namespace Winter.BackEnd.Controllers
{
    public class UniversitiesTree
    {
        public string CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string ParentCategoryID { get; set; }
    }

    public class UniversitiesController : Controller
    {
        //
        // GET: /Universities/

        public ActionResult Index()
        {
            return View(Repository.CurrentDataContext.Universities.FirstOrDefault());
        }

        //
        // GET: /Universities/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Universities/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Universities/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Universities/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Universities/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
