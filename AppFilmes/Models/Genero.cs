using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AppFilmes.Models
{
    public class Genero
    {
        [Key]
        public int Generoid { get; set; }
        public string Nome { get; set; }
        public int CodigoGenero { get; set; }


    }
}