
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;

namespace AppFilmes.Models.Interfaces
{
    interface IFoto_Posters : IDados<Foto_Posters>
    {
        List<Foto_Posters> GetFotoPostersesByIdFilme(int idFilmes);
    }
}
