using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Winter.BackEnd.Models.Domain;
using System.Security.Principal;
using System.Web.Security;

namespace Winter.BackEnd.Controllers
{
    public class PersonController : Controller
    {
        //
        // GET: /Person/

        public ActionResult Details(int id)
        {
            //if (User.Identity.IsAuthenticated)
            {
                return View(Repository.CurrentDataContext.Persons.SingleOrDefault(p => p.ID == id));
            }
            //return View();
        }

        public ActionResult Index()
        {
            return View(Repository.CurrentDataContext.Persons.ToArray());
        }

        public ActionResult Edit(int id)
        {
            ViewData["Roles"] = from role in Repository.CurrentDataContext.aspnet_Roles
                                select new SelectListItem() { Value = role.RoleName, Text = role.RoleName };

            return View(Repository.CurrentDataContext.Persons.SingleOrDefault(p => p.ID == id));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, string Roles)
        {
            Person person =
                        Repository.CurrentDataContext.Persons.SingleOrDefault(p => p.ID == id);

            System.Web.Security.Roles.AddUserToRole(person.UserName, Roles);

            return RedirectToAction("Index", "Person");
        }
    }
}
