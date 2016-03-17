using AppFilmes.Models.Interfaces;
using System.Linq;

namespace AppFilmes.Models
{
    public class GeneroRepository : RepositoryBase<Genero>, IGenero
    {
        public Genero BuscaCodigo(int Codigo)
        {
            var gen = new GeneroRepository().ListAll();
            if (gen.Any())
            {
                var aux = new Genero();
                aux = gen.FirstOrDefault(g => g.CodigoGenero == Codigo);

                return aux;

            }
            else
            {
                return null;
            }
            //First(g => g.CodigoGenero == Codigo);
            //FirstOrDefault(g => g.CodigoGenero == Codigo);
        }
    }
}