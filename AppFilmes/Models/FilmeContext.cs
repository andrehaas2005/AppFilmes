using System.Data.Entity;

namespace AppFilmes.Models
{
    public class FilmeContext : DbContext
    {
        public DbSet<Filme> Filmes { get; set; }
        public DbSet<Genero> Generos { get; set; }
        public DbSet<Filme_Genero> FilmeGeneros { get; set; }

    }
}