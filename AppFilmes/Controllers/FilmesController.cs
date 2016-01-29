using System;
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



        //
        // GET: /Filmes/

        public ActionResult Index()
        {
            var bd = new FilmeContext();
            List<Genero> generos = new List<Genero>();
            List<Filme>  filmes = new List<Filme>();
            var chave = WebConfigurationManager.AppSettings["chaveAcesso"].ToString();
            var tmDbClient = new TMDbClient(chave);
            var lstFilmes = new List<SearchContainer<MovieResult>>();

            #region .: Criando Generos :.

            try
            {
                 generos = bd.Generos.ToList();
                //List<Genero> generos = null;
                if (generos.Any())
                {
                    var auxGeneros = tmDbClient.GetMovieGenres("pt");

                    auxGeneros.ForEach(g =>
                    {
                        var generoNoBanco = generos.First(gn => gn.CodigoGenero != g.Id);

                        if (generoNoBanco != null)
                        {
                            var genero = new Genero()
                            {
                                CodigoGenero = g.Id,
                                Nome = g.Name
                            };
                            bd.Generos.Add(genero);
                            bd.SaveChanges();
                        }


                    });
                }
       
            #endregion

            #region .: Criando Filmes :.

           

                 filmes = bd.Filmes.ToList();

                if (filmes.Any())
                {
                    int paginas = tmDbClient.GetMovieList(MovieListType.Popular, "pt", 0).TotalPages;

                    for (int i = 1; i < paginas; i++)
                    {
                        var filme = tmDbClient.GetMovieList(MovieListType.Popular, "pt", i);

                        lstFilmes.Add(filme);

                        filme.Results.ForEach(f =>
                        {
                            var filmenoBanco = filmes.First(fbd => fbd.Codigothemoviedb != f.Id);
                            if (filmenoBanco != null)
                            {

                                var filmeAux = new Filme()
                                {
                                    Adult = f.Adult,
                                    BackdropPath = f.BackdropPath,
                                    GenreIds = f.GenreIds,
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



                                bd.Filmes.Add(filmeAux);
                                bd.SaveChanges();
                            }
                        });


                    }

                }
                return View(filmes);

            }
            catch (Exception e)
            {
                
            }

            #endregion


            return View();
        }

        //
        // GET: /Filmes/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Filmes/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Filmes/Create

        [HttpPost]
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
        // GET: /Filmes/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Filmes/Edit/5

        [HttpPost]
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

        //
        // GET: /Filmes/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Filmes/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
