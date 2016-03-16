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


    public class ManutencaoFilmesController : AsyncController
    {
        private static String chave = WebConfigurationManager.AppSettings["chaveAcesso"].ToString();
        private TMDbClient tmDbClient = new TMDbClient(chave);

        private int _qtdaFilmeLidos;
        private int _qtdaGeneroLidos;

        public int qtdaFilmeLidos { get { return _qtdaFilmeLidos; } set { _qtdaFilmeLidos = value; } }
        public int qtdaGeneroLidos { get { return _qtdaGeneroLidos; } set { _qtdaGeneroLidos = value; } }
        public ActionResult Index()
        {
            var auxfilmes = new FilmeRepository();
            var generos = new GeneroRepository();
            var lstgenerostmDb = tmDbClient.GetMovieGenres("pt");
            var lstFilmetmDb = tmDbClient.GetMovieList(MovieListType.Popular, "pt", 0);
            var lstGenero = generos.ListAll();
            var lstFilmes = auxfilmes.ListAll();

            var percentGenero = Math.Round(((Double)(lstGenero.Count() * 100) / lstgenerostmDb.Count), 2);
            var _percent = Math.Round(((Double)(lstFilmes.Count() * 100) / lstFilmetmDb.TotalResults), 2);
            //Math.Round(((Double) (lstFilmes.Count() * 100) / lstFilmetmDb.TotalResults),2)
            Session.Add("percent", _percent);
            Session.Add("percentGenero", percentGenero);

            return View();
        }

        public void IniciandoBaseCompleted()
        {
            
        }

        [NoAsyncTimeout]
        public void IniciandoBaseAsync()
        {
            AsyncManager.OutstandingOperations.Increment();
           


            var lstFilmes = new List<SearchContainer<MovieResult>>();

            #region .: Criando Generos :.
            try
            {
                var generos = new GeneroRepository();

                var lstgenerostmDb = tmDbClient.GetMovieGenres("pt");

                var qtdaBancoGenero = generos.ListAll().Count();

                if (qtdaBancoGenero < lstgenerostmDb.Count)
                {


                    lstgenerostmDb.ForEach(g =>
                    {
                        this.qtdaGeneroLidos++;
                        Session["percentGenero"] = Math.Round(((Double)(generos.ListAll().Count() * 100) / lstgenerostmDb.Count), 2);


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
                }
                else
                {
                    this.qtdaGeneroLidos = qtdaBancoGenero;
                }


            #endregion

                #region .: Criando Filmes :.

                int paginas = tmDbClient.GetMovieList(MovieListType.Popular, "pt", 0).TotalPages;

                for (int i = 1; i < paginas; i++)
                {
                    var filme = tmDbClient.GetMovieList(MovieListType.Popular, "pt", i);


                    InsertFilmes(filme);

                }
                AsyncManager.OutstandingOperations.Decrement();

            }
            catch (Exception)
            {

            }
                #endregion
        }



        public void InsertFilmes(SearchContainer<MovieResult> filme)
        {

            var auxfilmes = new FilmeRepository();
            var atualizaLista = false;
            var filmes = auxfilmes.ListAll();

            filme.Results.ForEach(f =>
            {
                this.qtdaFilmeLidos++;
                var filmenoBanco = new Filme();
                if (atualizaLista)
                    filmes = auxfilmes.ListAll();

                Session["percent"] = Math.Round(((Double)(filmes.Count() * 100) / filme.TotalResults), 2);

                filmenoBanco = filmes.FirstOrDefault(fbd => fbd.Codigothemoviedb == f.Id);


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
                    atualizaLista = true;

                }
            });
        }
   
        public string progressBarFilmes()
        {


            if (Session["percent"] == null)
                Session["percent"] = "0";
            string html = "<div>Registros Lidos: " + this.qtdaFilmeLidos + "</div>";

            html += "<div class=\"progress\">";

            html +=
                "<div class=\"progress-bar progress-bar-striped active\" id=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"2\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"min-width: 2em; width: " +
                Session["percent"].ToString().Replace(',', '.') + "%\">";
            html += Session["percent"].ToString() + "%</div>";
            html += "</div>";
            return html;
        }
      
        public string progressBarGenero()
        {
            if (Session["percentGenero"] == null)
                Session["percentGenero"] = "0";
            string html = "<div>Registros Lidos: " + this.qtdaGeneroLidos + "</div>";
            html += "<div class=\"progress\">";

            html +=
                "<div class=\"progress-bar progress-bar-success progress-bar-striped\" id=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"2\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"min-width: 2em; width: " +
                Session["percentGenero"].ToString().Replace(',', '.') + "%\">";
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
