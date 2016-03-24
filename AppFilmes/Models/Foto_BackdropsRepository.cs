using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AppFilmes.Models.Interfaces;

namespace AppFilmes.Models
{
    public class Foto_BackdropsRepository : RepositoryBase<Foto_Backdrops>, IFoto_Backdrops
    {
        public List<Foto_Backdrops> GetFotoBackdropsByIdFilme(int idFilmes)
        {
            var repository = new Foto_BackdropsRepository().ListAll().Where(x => x.FilmeId == idFilmes).ToList();

            return repository;
        }
    }
}