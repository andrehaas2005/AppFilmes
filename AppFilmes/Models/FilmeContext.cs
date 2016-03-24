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

        public DbSet<Foto_Backdrops> Foto_Backdrops { get; set; }
        public DbSet<Foto_Posters> Foto_Posters { get; set; }
      //  public DbSet<Filme_Genero> FilmeGeneros { get; set; }

        

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Filme>().HasKey(f => f.FilmeId);
            modelBuilder.Entity<Genero>().HasKey(g => g.Generoid);
            modelBuilder.Entity<Foto_Posters>().HasKey(fp => fp.Foto_PostersId);
            modelBuilder.Entity<Foto_Backdrops>().HasKey(fb => fb.Foto_BackdropsId);
            modelBuilder.Entity<Genero>().ToTable("Generos");
            modelBuilder.Entity<Filme>().ToTable("Filme");
            modelBuilder.Entity<Foto_Posters>().ToTable("Foto_Posters");
            modelBuilder.Entity<Foto_Backdrops>().ToTable("Foto_Backdrops");
            //modelBuilder.Entity<Filme>().HasRequired(e => e.Generos).WithMany().HasForeignKey(e => e.GenreIds);
        }
    }
}