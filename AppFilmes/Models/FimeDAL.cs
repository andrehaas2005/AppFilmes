using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AppFilmes.Models.Interfaces;

namespace AppFilmes.Models
{
    public class FimeDAL : RepositoryBase<Filme>,IFilme
    {
        public Filme BuscaFilmePorCodigo(int codigo)
        {
            return db.Filmes.FirstOrDefault(f => f.Codigothemoviedb == codigo);
        }
    }
}