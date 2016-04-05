using AppFilmes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Configuration;
using System.Web.Mvc;
using TMDbLib.Client;
using TMDbLib.Objects.General;
using TMDbLib.Objects.Movies;
using TMDbLib.Objects.TvShows;
using WebGrease.Css.Extensions;

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
            Session.Add("qtdaFilmeLidos", qtdaFilmeLidos);
            Session.Add("qtdaGeneroLidos", qtdaGeneroLidos);

            return View();
        }

        public ActionResult IniciandoBaseCompleted()
        {
            return View("Index");
        }

        [NoAsyncTimeout]
        public void IniciandoBaseAsync()
        {
            AsyncManager.OutstandingOperations.Increment();

            var listFilmeContainers = new List<SearchContainer<MovieResult>>();

            var filmesRepository = new FilmeRepository();
            var lstFilmesNoBanco = filmesRepository.ListAll();

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
                        Session["qtdaGeneroLidos"] = this.qtdaGeneroLidos++;
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

                    Session["qtdaGeneroLidos"] = this.qtdaGeneroLidos = qtdaBancoGenero;
                }


            #endregion

                #region .: Criando Filmes :.

                var tbmDbFilme = tmDbClient.GetMovieList(MovieListType.Popular, "pt", 0);
                if (tbmDbFilme.TotalResults > lstFilmesNoBanco.Count())
                {
                    for (int i = 1; i < tbmDbFilme.TotalPages; i++)
                    {
                        listFilmeContainers.Add(tmDbClient.GetMovieList(MovieListType.Popular, "pt", i));
                    }
                    InsertFilmes(listFilmeContainers);
                }

                AsyncManager.OutstandingOperations.Decrement();

            }
            catch (Exception)
            {
                
            }
                #endregion
        }



        public void IniciaBaseFotos()
        {
            var lstFilmeRepository =new FilmeRepository();
            var lstFotosPosters = new List<Foto_Posters>();
            var lstFotoBackdrops = new List<Foto_Backdrops>();
            var FotoBRepository = new Foto_BackdropsRepository();
            var FotoPRepository = new Foto_PostersRepository();
           
            lstFotosPosters = (List<Foto_Posters>) FotoPRepository.ListAll();
            lstFotoBackdrops = (List<Foto_Backdrops>) FotoBRepository.ListAll();

            var lstFilmes = lstFilmeRepository.ListAll();
            lstFilmes.ForEach(f =>
            {
              var fotoFilme =   tmDbClient.GetMovieImages(f.Codigothemoviedb);
                fotoFilme.Backdrops.ForEach(fb =>
                {
                    if (!lstFotoBackdrops.Any(x => x.FilePath.Equals(fb.FilePath)))
                    {
                        var clsFotoBackdrops = new Foto_Backdrops()
                        {
                            Codigothemoviedb = f.Codigothemoviedb,
                            AspectRatio = fb.AspectRatio,
                            FilePath = fb.FilePath,
                            Height = fb.Height,
                            Iso_639_1 = fb.Iso_639_1,
                            VoteAverage = fb.VoteAverage,
                            VoteCount = fb.VoteCount,
                            Width = fb.Width,
                            FilmeId = f.FilmeId,
                            
                        };

                        FotoBRepository.Insert(clsFotoBackdrops);
                        
                    }
                });

                fotoFilme.Posters.ForEach(fp =>
                {

                    if (!lstFotosPosters.Any(y => y.FilePath.Equals(fp.FilePath)))
                    {
                        var clsFotoPosters = new Foto_Posters()
                        {
                            Codigothemoviedb = f.Codigothemoviedb,
                            AspectRatio = fp.AspectRatio,
                            FilePath = fp.FilePath,
                            Height = fp.Height,
                            Iso_639_1 = fp.Iso_639_1,
                            VoteAverage = fp.VoteAverage,
                            VoteCount = fp.VoteCount,
                            Width = fp.Width,
                            FilmeId = f.FilmeId,   
                        };
                        FotoPRepository.Insert(clsFotoPosters);
                    }
                });

            });
        }


        public void InsertFilmes(List<SearchContainer<MovieResult>> filmeSearchContainers)
        {

            var auxfilmes = new FilmeRepository();
            var filmes = auxfilmes.ListAll();

            filmeSearchContainers.ForEach(filme =>
            {
                filme.Results.ForEach(f =>
                {

                    Session["qtdaFilmeLidos"] = this.qtdaFilmeLidos++;
                    var filmenoBanco = new Filme();
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
                    }
                });
            });



        }

        public string progressBarFilmes()
        {
            if (Session["percent"] == null)
                Session["percent"] = "0";
            string html = "<div>Registros Lidos: " + Session["qtdaFilmeLidos"] + "</div>";
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
            string html = "<div>Registros Lidos: " + Session["qtdaGeneroLidos"] + "</div>";
            html += "<div class=\"progress\">";

            html +=
                "<div class=\"progress-bar progress-bar-success progress-bar-striped\" id=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"2\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"min-width: 2em; width: " +
                Session["percentGenero"].ToString().Replace(',', '.') + "%\">";
            html += Session["percentGenero"].ToString() + "%</div>";
            html += "</div>";
            return html;
        }


 

        public void Serie()
        {
            var teste = tmDbClient.GetChangesTv();

        }

    }
}
