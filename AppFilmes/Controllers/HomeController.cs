using AppFilmes.Models;
using System;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Web.Mvc;
using TMDbLib.Client;
using TMDbLib.Objects.General;
using TMDbLib.Objects.Movies;

namespace AppFilmes.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {


            #region .: Documentação :.
            //Api Key =  8fb08dee4651c3d9b1536a69ea3f3d16
            //URL para Obter Genre = http://api.themoviedb.org/3/genre/tv/lis
            //URL completa do exemplo = http://api.themoviedb.org/3/genre/tv/list?api_key=8fb08dee4651c3d9b1536a69ea3f3d16
            //URL das Imagens = http://image.tmdb.org/t/p/w500/
            //Exemplo =>http://image.tmdb.org/t/p/w500/h1H1bToJPiOob4xxcWfudEUFME5.jpg
            //Exemplo Retirado de => https://github.com/LordMike/TMDbLib.git

            #endregion

            var baseAddress = new Uri("http://api.themoviedb.org/3/");


            #region .: Linhas Comentadas :.
            //            var request = System.Net.WebRequest.Create("http://api.themoviedb.org/3/genre/tv/list?api_key=8fb08dee4651c3d9b1536a69ea3f3d16") as System.Net.HttpWebRequest;
            //            request.KeepAlive = true;
            //            request.Method = "GET";
            //            request.Accept = "application/json";


            //            JsonSchema schema = JsonSchema.Parse(@"{'type':'object','properties':{
            //                                                    'genres': {'type':'array'}
            //                                                    }
            //                                                    }");

            //            request.ContentLength = 0;
            //            string responseContent = null;
            //            using (var response = request.GetResponse() as System.Net.HttpWebResponse)
            //            {
            //                using (var reader = new System.IO.StreamReader(response.GetResponseStream()))
            //                {
            //                    responseContent = reader.ReadToEnd();
            //                    JObject genres = JObject.Parse(responseContent.ToString());
            //                    bool valid = genres.IsValid(schema);

            //                    if (valid)
            //                    {
            //                        String[] teste = responseContent.ToString().Split('[');
            //                        String[] teste1 = teste[1].ToString().Split('{');
            //                        List<Genero> generos = new List<Genero>();
            //                        foreach (var item in teste1)
            //                        {
            //                            generos.Add(JsonConvert.DeserializeObject<Genero>(item));
            //                        }
            //                    }
            //                }
            //            }

            #endregion


            ViewBag.Message = "";
           
            var chave = WebConfigurationManager.AppSettings["chaveAcesso"].ToString();

            var tmDbClient = new TMDbClient(chave);
            var lstFilmes = new List<SearchContainer<MovieResult>>();
            var filmes = new List<Filme>();
            for (int i = 1; i < 20; i++)
            {
                var filme = tmDbClient.GetMovieList(MovieListType.Popular,"pt", i);
                lstFilmes.Add(filme);

                filme.Results.ForEach(f =>
                {
                    var filmeAux = new Filme()
                    {
                        Adult               = f.Adult,
                        BackdropPath        = f.BackdropPath,
                        GenreIds            = f.GenreIds,
                        FilmeId             = f.Id,
                        OriginalLanguage    = f.OriginalLanguage,
                        OriginalTitle       = f.OriginalTitle,
                        Overview            = f.Overview,
                        Popularity          = f.Popularity,
                        PosterPath          = f.PosterPath,
                        ReleaseDate         = f.ReleaseDate,
                        Title               = f.Title,
                        Video               = f.Video,
                        VoteAverage         = f.VoteAverage,
                        VoteCount           = f.VoteCount
                    };
                    filmes.Add(filmeAux);
                });
               
                
            }

         
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
