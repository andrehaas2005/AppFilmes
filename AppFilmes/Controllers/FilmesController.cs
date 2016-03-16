using System;
using System.ComponentModel;
using System.IO;
using MySql.Data.MySqlClient;
using AppFilmes.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Configuration;
using System.Web.Mvc;
using TMDbLib.Client;
using TMDbLib.Objects.General;
using TMDbLib.Objects.Movies;


namespace AppFilmes.Controllers
{
    public class FilmesController : Controller
    {

        private static String chave = WebConfigurationManager.AppSettings["chaveAcesso"].ToString();
        private TMDbClient tmDbClient = new TMDbClient(chave);
        

        //
        // GET: /Filmes/

        public ActionResult Index()
        {
            //FilmeContext db = new FilmeContext();
            var repFilmes = new FilmeRepository();
            var lstfilmes = repFilmes.ListAll().Take(10);
                //db.Filmes.Take(10);

            return View(lstfilmes);
        }



     

        public ActionResult Detalhes(int id)
        {
            var filme = new FilmeRepository();
            var model = filme.ListbyId(id);

            return View(model);
        }


      
  

    }
}

