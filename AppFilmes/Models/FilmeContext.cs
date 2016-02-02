using System.Data.Entity;

namespace AppFilmes.Models
{
    public class FilmeContext : DbContext
    {
        public FilmeContext()
            : base("DBFilmes")
        {
            
        }

        public DbSet<Filme> Filmes { get; set; }
        public DbSet<Genero> Generos { get; set; }
        public DbSet<Filme_Genero> FilmeGeneros { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Filme>().HasKey(f => f.FilmeId);
            modelBuilder.Entity<Genero>().HasKey(g => g.Generoid);
        }
    }
}