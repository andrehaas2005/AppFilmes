using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using AppFilmes.Models;
using Microsoft.Ajax.Utilities;
using TMDbLib.Client;
using TMDbLib.Objects.General;
using TMDbLib.Objects.Movies;

namespace AppFilmes.Controllers
{


    public class ManutencaoFilmesController : Controller
    {
        private static String chave = WebConfigurationManager.AppSettings["chaveAcesso"].ToString();
        private TMDbClient tmDbClient = new TMDbClient(chave);
        public int _percent { get; set; }




        public ActionResult Index()
        {
            return View();
        }
        [System.Web.Services.WebMethod]
        public void IniciandoBase()
        {


            //List<Genero> lstgeneros = new List<Genero>();
            //List<Filme> filmes = new List<Filme>();
            var chave = WebConfigurationManager.AppSettings["chaveAcesso"].ToString();
            var tmDbClient = new TMDbClient(chave);
            var lstFilmes = new List<SearchContainer<MovieResult>>();



            // var bd = new FilmeContext();
            #region .: Criando Generos :.
            try
            {
                var generos = new GeneroRepository();

                var lstgenerostmDb = tmDbClient.GetMovieGenres("pt");

                lstgenerostmDb.ForEach(g =>
                {
                    var percentGenero = (generos.ListAll().Count()*100)/lstgenerostmDb.Count;

                    Session.Add("percentGenero",percentGenero);

                    var genero = new Genero()
                    {
                        CodigoGenero = g.Id,
                        Nome = g.Name
                    };
                    var auxGenero = generos.BuscaCodigo(genero.CodigoGenero);
                    if (auxGenero == null)
                    {
                        generos.Insert(genero);
                    }

                });


            #endregion

                #region .: Criando Filmes :.

                ProgressArgs result = new ProgressArgs();
                result.Completed = 0;
                result.Total = tmDbClient.GetMovieList(MovieListType.Popular, "pt", 0).TotalResults;

                int paginas = tmDbClient.GetMovieList(MovieListType.Popular, "pt", 0).TotalPages;

                for (int i = 1; i < paginas; i++)
                {
                    var filme = tmDbClient.GetMovieList(MovieListType.Popular, "pt", i);


                    InsertFilmes(filme);

                }


            }
            catch (Exception)
            {

            }
                #endregion
        }



        public void InsertFilmes(SearchContainer<MovieResult> filme)
        {

            var auxfilmes = new FilmeRepository();



            filme.Results.ForEach(f =>
            {
                var filmenoBanco = new Filme();
                var filmes = auxfilmes.ListAll();
                filmenoBanco = filmes.FirstOrDefault(fbd => fbd.Codigothemoviedb == f.Id);

                _percent = (filmes.Count() * 100) / filme.TotalResults;
                Session.Add("percent", _percent);


                if (filmenoBanco == null || filmenoBanco.Codigothemoviedb == 0)
                {
                    var filmeAux = new Filme()
                    {
                        Adult = f.Adult,
                        BackdropPath = f.BackdropPath,
                        // GenreIds = f.GenreIds,
                        Codigothemoviedb = f.Id,
                        OriginalLanguage = f.OriginalLanguage,
                        OriginalTitle = f.OriginalTitle,
                        Overview = f.Overview,
                        Popularity = f.Popularity,
                        PosterPath = f.PosterPath,
                        ReleaseDate = f.ReleaseDate,
                        Title = f.Title,
                        Video = f.Video,
                        VoteAverage = f.VoteAverage,
                        VoteCount = f.VoteCount
                    };

                    auxfilmes.Insert(filmeAux);


                }
            });
        }

        public string progressBarFilmes()
        {
            if (Session["percent"] == null)
                Session["percent"] = "0";

            string html = "<div class=\"progress\">";

            html +=
                "<div class=\"progress-bar progress-bar-striped active\" id=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"2\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"min-width: 2em; width: " +
                Session["percent"].ToString() + "%\">";
            html += Session["percent"].ToString() + "%</div>";
            html += "</div>";
            return html;
        }


        public string progressBarGenero()
        {
            if (Session["percentGenero"] == null)
                Session["percentGenero"] = "0";

            string html = "<div class=\"progress\">";

            html +=
                "<div class=\"progress-bar progress-bar-success progress-bar-striped\" id=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"2\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"min-width: 2em; width: " +
                Session["percentGenero"].ToString() + "%\">";
            html += Session["percentGenero"].ToString() + "%</div>";
            html += "</div>";
            return html;
        }


        public void AtualizarBase()
        {
            var qtdaDePaginas = tmDbClient.GetMovieList(MovieListType.Upcoming, "pt").TotalPages;
            for (int i = 1; i < qtdaDePaginas; i++)
            {
                var filmesLancado = tmDbClient.GetMovieList(MovieListType.Upcoming, "pt", i);
                InsertFilmes(filmesLancado);
            }

        }



    }
}
