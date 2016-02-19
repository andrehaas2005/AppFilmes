using System;
using System.ComponentModel;
using System.IO;
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
        private FilmeContext bd = new FilmeContext();

        //
        // GET: /Filmes/

        public ActionResult Index()
        {
            FilmeContext db = new FilmeContext();
            var lstfilmes = db.Filmes.Take(10);

            return View(lstfilmes);
        }



        public void IniciandoBase()
        {

            List<Genero> generos = new List<Genero>();




            #region .: Criando Generos :.


            try
            {
                if (!bd.Generos.Any())
                {

                    generos = bd.Generos.ToList();
                }
                var auxGeneros = tmDbClient.GetMovieGenres("pt");
                //List<Genero> generos = null;
                if (!generos.Any() || generos.Count == 0)
                {
                    auxGeneros.ForEach(g =>
                    {
                        var genero = new Genero()
                        {
                            CodigoGenero = g.Id,
                            Nome = g.Name
                        };
                        bd.Generos.Add(genero);
                        bd.SaveChanges();

                    });
                }
                else
                {
                    auxGeneros.ForEach(g =>
                    {
                        var generoNoBanco = generos.First(gn => gn.CodigoGenero == g.Id);

                        if (generoNoBanco.Generoid == 0)
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
            var filmes = new List<Filme>();
            filmes = bd.Filmes.ToList();

            filme.Results.ForEach(f =>
            {
                var filmenoBanco = new Filme();

                if (filmes.Count > 0)
                {
                    filmenoBanco = filmes.FirstOrDefault(fbd => fbd.Codigothemoviedb == f.Id);
                }
                if (filmenoBanco == null || filmenoBanco.Codigothemoviedb == 0)
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
                    LogdeInclusao("= > Filme : " + filmeAux.Title + " - Lançado em : " + filmeAux.ReleaseDate.ToString() + " - Incluido em : " + DateTime.Now.ToString());
                }
            });
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


        public bool LogdeInclusao(string conteudo)
        {
            const string pathArquivo = @"C:\ProjetoNet\AppFilmes\AppFilmes\Content\Arquivos\Logs\LogInclusaoDeFilmes.txt";

            try
            {
                using (StreamWriter file = new StreamWriter(pathArquivo,true))
                {
                    
                    file.WriteLine(conteudo);
                }
                return true;
            }
            catch (Exception)
            {
                
                return false;
            }
            



            //if (!System.IO.File.Exists(pathArquivo))
            //{
            //    var arquivo = System.IO.File.Create(pathArquivo);
            //    var arquivo1 = new System.IO.FileStream(pathArquivo);
            //    if (arquivo.CanWrite)
            //    {
            //        byte[] teste = new byte[] { byte.Parse(conteudo) };
            //        arquivo.WriteByte();
            //        arquivo.Flush();
            //        arquivo.Dispose();
            //        return true;
            //    }
            //}
            //else
            //{
            //    var arquivo = System.IO.File.OpenWrite(pathArquivo);
            //    if (arquivo.CanWrite)
            //    {
            //        byte[] teste = new byte[] { byte.Parse(conteudo) };
            //        arquivo.Write(teste, 1, teste.Length);
            //        arquivo.Flush();
            //        arquivo.Dispose();
            //        return true;
            //    }
            //}
            
            
            return false;
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

