namespace AppFilmes.Models.Interfaces
{
    interface IGenero : IDados<Genero>
    {
        Genero BuscaCodigo(int Codigo);
    }
}
