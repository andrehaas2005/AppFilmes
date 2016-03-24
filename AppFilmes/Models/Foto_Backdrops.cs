using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppFilmes.Models
{
    public class Foto_Backdrops
    {
        [Key]
        public int Foto_BackdropsId { get; set; }
        public double AspectRatio { get; set; }
        public string FilePath { get; set; }
        public int Height { get; set; }
        public string Iso_639_1 { get; set; }
        public double VoteAverage { get; set; }
        public int VoteCount { get; set; }
        public int Width { get; set; }
        public int Codigothemoviedb { get; set; }
        public int FilmeId { get; set; }



    }


}