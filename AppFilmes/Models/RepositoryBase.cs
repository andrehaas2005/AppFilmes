using AppFilmes.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace AppFilmes.Models
{
    public class RepositoryBase<T> : IDisposable,IDados<T> where T : class 
    {
        protected FilmeContext db = new FilmeContext();

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public void Update(T objeto)
        {
            db.Entry(objeto).State = EntityState.Modified;
            db.SaveChanges();
        }

        public void Delete(T objeto)
        {
            db.Set<T>().Remove(objeto);
        }

        public void Insert(T objeto)
        {
            db.Set<T>().Add(objeto);
            db.SaveChanges();
        }

        public IEnumerable<T> ListAll()
        {
            return db.Set<T>().ToList();
        }

        public T ListbyId(int id)
        {
            return db.Set<T>().Find(id);
        }
    }
}