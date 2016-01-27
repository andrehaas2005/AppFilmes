using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppFilmes.Models;

namespace AppFilmes.Infra.Data.EntitiesConfig
{
   public class FilmeConfiguration : EntityTypeConfiguration<Filme>
   {
       public FilmeConfiguration()
       {
           HasKey(f => f.FilmeId);
           Property(f => f.Overview).IsRequired().HasMaxLength(2000);
       }
    }
}
