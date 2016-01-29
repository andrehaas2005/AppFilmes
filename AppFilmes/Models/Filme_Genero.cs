using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppFilmes.Models
{
    public class Filme_Genero
    {
        public int Filme_GeneroId { get; set; }
        public int FilmeId { get; set; }
        public int GeneroId { get; set; }

    }
}