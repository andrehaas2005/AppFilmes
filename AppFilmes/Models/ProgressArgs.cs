using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppFilmes.Models
{
    public class ProgressArgs
    {
        public int Completed { get; set; }
        public int Total { get; set; }
        public int Percentage { get; set; }
        public string Status { get; set; }

    }
}