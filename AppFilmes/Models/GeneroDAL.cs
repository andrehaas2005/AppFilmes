using System;
using System.Collections.Generic;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Web;
using AppFilmes.Models.Interfaces;

namespace AppFilmes.Models
{
    public class GeneroDAL : RepositoryBase<Genero>,IGenero
    {
        public Genero BuscaCodigo(int Codigo)
        {
            return db.Generos.FirstOrDefault(g => g.CodigoGenero == Codigo);
        }
    }
}