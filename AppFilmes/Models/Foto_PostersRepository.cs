using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AppFilmes.Models.Interfaces;

namespace AppFilmes.Models
{
    public class Foto_PostersRepository : RepositoryBase<Foto_Posters>,IFoto_Posters
    {
        public List<Foto_Posters> GetFotoPostersesByIdFilme(int idFilmes)
        {
            var repository = new Foto_PostersRepository().ListAll().Where(x=> x.FilmeId == idFilmes).ToList();

            return repository;
        }
    }
}