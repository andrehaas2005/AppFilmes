using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppFilmes.Models.Interfaces
{
    interface IFilme :IDados<Filme>
    {
        Filme BuscaFilmePorCodigo(int codigo);
    }
}
