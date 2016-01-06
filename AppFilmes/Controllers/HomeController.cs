using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TMDbLib.Client;
using TMDbLib.Objects.Movies;

namespace AppFilmes.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";
            var chave = System.Web.Configuration.WebConfigurationManager.AppSettings["chaveAcesso"].ToString();
            var tmDbClient = new TMDbClient(chave);
            var filmes = tmDbClient.GetMovieList(MovieListType.Popular);
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
