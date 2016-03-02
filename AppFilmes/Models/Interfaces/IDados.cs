using System;
using System.Collections.Generic;

namespace AppFilmes.Models.Interfaces
{
    public interface IDados<T> where T : class
    {
        void Update(T objeto);
        void Delete(T objeto);

        void Insert(T objeto);

        IEnumerable<T> ListAll();
        T ListbyId(int id);

    }
}
