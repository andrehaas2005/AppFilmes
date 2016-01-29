using System;
using System.Collections.Generic;

namespace AppFilmes.Models
{
    public class Filme 
    {
        public bool Adult { get; set; }
        public string BackdropPath { get; set; }
        public List<int> GenreIds { get; set; }
        
        public int FilmeId { get; set; }
        public int Codigothemoviedb { get; set; }
        public string OriginalLanguage { get; set; }
        public string OriginalTitle { get; set; }
        public string Overview { get; set; }
        public double Popularity { get; set; }
        public string PosterPath { get; set; }
        public DateTime? ReleaseDate { get; set; }
        public string Title { get; set; }
        public bool Video { get; set; }
        public double VoteAverage { get; set; }
        public int VoteCount { get; set; }

        public virtual List<Genero> Generos { get; set; }

        #region .: Classe gerada pelo JSon de retorno da URL 
        //public class Rootobject
        //{
        //    public int page { get; set; }
        //    public IEnumerable<Result> results { get; set; }
        //    public int total_results { get; set; }
        //    public int total_pages { get; set; }
        //}

        //public class Result
        //{
        //    public string poster_path { get; set; }
        //    public bool adult { get; set; }
        //    public string overview { get; set; }
        //    public string release_date { get; set; }
        //    public int[] genre_ids { get; set; }
        //    public int id { get; set; }
        //    public string original_title { get; set; }
        //    public string original_language { get; set; }
        //    public string title { get; set; }
        //    public string backdrop_path { get; set; }
        //    public float popularity { get; set; }
        //    public int vote_count { get; set; }
        //    public bool video { get; set; }
        //    public float vote_average { get; set; }
        //}
        #endregion

    }
}