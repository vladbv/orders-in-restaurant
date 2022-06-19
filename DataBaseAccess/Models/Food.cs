using System;
using System.Collections.Generic;

namespace DataBaseAccess.Models
{
    public partial class Food
    {
        public Food()
        {
            Dishes = new HashSet<Dishes>();
        }

        public int IdFood { get; set; }
        public int Price { get; set; }
        public int Cost { get; set; }
        public bool IsAvailable { get; set; }
        public string Type { get; set; }
        public int? Size { get; set; }
        public int? Points { get; set; }

        public virtual ICollection<Dishes> Dishes { get; set; }
    }
}
