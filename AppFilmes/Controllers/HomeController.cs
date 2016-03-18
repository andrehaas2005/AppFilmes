using System.Linq;
using AppFilmes.Models;
using System;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Web.Mvc;
using TMDbLib.Client;
using TMDbLib.Objects.General;
using TMDbLib.Objects.Movies;
using WebGrease.Css.Extensions;

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

            #region .: Linhas Comentadas :.
            //            var request = System.Net.WebRequest.Create("http://api.themoviedb.org/3/genre/tv/list?api_key=8fb08dee4651c3d9b1536a69ea3f3d16") as System.Net.HttpWebRequest;
            //            request.KeepAlive = true;
            //            request.Method = "GET";
            //            request.Accept = "application/json";

            // http://api.themoviedb.org/3/genre/movie/list?api_key=8fb08dee4651c3d9b1536a69ea3f3d16&language=pt
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

            var carosselRepository = new FilmeRepository();

            var lstcarossel = carosselRepository.ListAll();
            int p = 0;
            var filmes = lstcarossel as IList<Filme> ?? lstcarossel.ToList();
            foreach (var source in filmes.Where(x => x.ReleaseDate > DateTime.Now.AddDays(-30) & !String.IsNullOrEmpty(x.BackdropPath) & x.ReleaseDate < DateTime.Now.AddDays(1)).OrderByDescending(y => y.Popularity).Take(3))
            {
                ViewData.Add("Car" + p, source.BackdropPath);
                ViewData.Add("Des" + p, source.Title);
                p++;
            }


            var lancamento =
                filmes.Where(lan => lan.ReleaseDate > DateTime.Now && lan.ReleaseDate < DateTime.Now.AddDays(7))
                    .ToList();



            var baseAddress = new Uri("http://api.themoviedb.org/3/");






            return View(lancamento);
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
