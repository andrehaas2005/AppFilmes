
using System.Collections.Generic;

namespace AppFilmes.Models.Interfaces
{
    interface IFoto_Backdrops : IDados<Foto_Backdrops>
    {
        List<Foto_Backdrops> GetFotoBackdropsByIdFilme(int idFilmes);
    }
}
