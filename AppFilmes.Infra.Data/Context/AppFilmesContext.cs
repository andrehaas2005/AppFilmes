using System;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using AppFilmes.Infra.Data.EntitiesConfig;
using AppFilmes.Models;
using System.Data.Entity;

namespace AppFilmes.Infra.Data.Context
{
    public class AppFilmesContext : DbContext
    {
        public AppFilmesContext() : base("AppFilmes")
        {
            
        }

        public DbSet<Filme> Filmes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>(); //Desativa a Pluralização da tabelas (ex: class cliente => tabela clienties)
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>(); //Desativa a deleção em cascata para relação de 1 para muitos
            modelBuilder.Conventions.Remove<ManyToManyCascadeDeleteConvention>(); //Desativa a deleção em cascata para relação de muitos para muitos

            modelBuilder.Properties().Where(p => p.Name == p.ReflectedType.Name + "Id").Configure(p => p.IsKey()); //Força a coluna que contenha o nome + id como chave primaria

            modelBuilder.Properties<string>().Configure(p => p.HasColumnType("varchar")); //força a propriedade da classe que for string a criar como varchar na base
            modelBuilder.Properties<string>().Configure(p => p.HasMaxLength(300)); //força a propriedade da classe que for string a criar com tamanho de 100

            modelBuilder.Configurations.Add(new FilmeConfiguration());
            
        }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries().Where(entry => entry.Entity.GetType().GetProperty("DataCadastro") != null))
            {
                if (entry.State == EntityState.Added)
                {
                    entry.Property("DataCadastro").CurrentValue = DateTime.Now;
                }
                if (entry.State == EntityState.Modified)
                {
                    entry.Property("DataCadastro").IsModified = false;
                }
            }
            return base.SaveChanges();
        }
    }
}
