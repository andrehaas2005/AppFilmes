using System.ComponentModel.DataAnnotations;

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