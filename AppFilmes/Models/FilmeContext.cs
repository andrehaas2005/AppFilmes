using System.Data.Entity;
using MySql.Data.MySqlClient;

namespace AppFilmes.Models
{
    public class FilmeContext : DbContext
    {
        public FilmeContext()
            : base("name=andrehaas")
        {
            
        }

        

        public DbSet<Filme> Filmes { get; set; }
        public DbSet<Genero> Generos { get; set; }
      //  public DbSet<Filme_Genero> FilmeGeneros { get; set; }

        

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Filme>().HasKey(f => f.FilmeId);
            modelBuilder.Entity<Genero>().HasKey(g => g.Generoid);
            modelBuilder.Entity<Genero>().ToTable("Generos");
            modelBuilder.Entity<Filme>().ToTable("Filme");
            //modelBuilder.Entity<Filme>().HasRequired(e => e.Generos).WithMany().HasForeignKey(e => e.GenreIds);
        }
    }
}