﻿using System;
using System.ComponentModel;
using System.IO;
using System.Text;
using Microsoft.Ajax.Utilities;
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

        public string strCarrossel(int id)
        {
            var FotoPostersRepository = new Foto_PostersRepository();
            var lstPosters = FotoPostersRepository.GetFotoPostersesByIdFilme(id);
            int i = 0;
            StringBuilder strTemplateControle = new StringBuilder();

            strTemplateControle.Append("<ol class=\"carousel-indicators\">");
            var strCarrossel = "<div class=\"carousel-inner\" role=\"listbox\">";
            lstPosters.ForEach(t =>
            {

                if (i == 0)
                {
                    strTemplateControle.Append("<li data-target=\"#carousel-foto-generic\" data-slide-to=\"0\" class=\"active\"></li>");

                    strCarrossel += "<div class=\"item active\">";
                    strCarrossel += "<img src=\"http://image.tmdb.org/t/p/w500/\"" + t.FilePath + "alt=\"...\">";
                    strCarrossel += "<div class=\"carousel-caption\">";
                    strCarrossel += "   ... ";
                    strCarrossel += "</div>";
                    strCarrossel += "</div>";
                }
                else
                {
                    strTemplateControle.Append("<li data-target=\"#carousel-foto-generic\" data-slide-to='" + i + "' class=\"active\"></li>");
                    strCarrossel += "<div class=\"item\">";
                    strCarrossel += "<img src=\"http://image.tmdb.org/t/p/w500/\"" + t.FilePath + "alt=\"...\">";
                    strCarrossel += "      <div class=\"carousel-caption\">";
                    strCarrossel += "...";
                    strCarrossel += "</div>";
                    strCarrossel += "</div>";
                }
            });
            strTemplateControle.Append("</ol>");
            strCarrossel += "</div>";
            strTemplateControle.Append(strCarrossel);

            return strTemplateControle.ToString();
        }



    }
}

