using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace RestaurantOrders_18114037.Models
{
    public class FoodFront
    {
        [Display(Name = "Price")]
        [Required]
        [DataType(DataType.Currency)]
        [Range(0, 1000, ErrorMessage = "Bad value! Please fix it!")]
        public int price { get; set; }

        [Display(Name = "Expense")]
        [Required]
        [DataType(DataType.Currency)]
        [Range(0, 1000, ErrorMessage = "Bad value! Please fix it!.")]
        public int cost { get; set; }

        [Display(Name = "Availability")]
        [Required]
        public bool isAvailable { get; set; }
        [Display(Name = "Name")]
        [Required]
        [StringLength(30, ErrorMessage = "Too long.")]
        [MinLength(3, ErrorMessage = "Too short")]
        public string type { get; set; }

        [Display(Name = "Size")]
        [Required]
        [Range(16, 64, ErrorMessage = "Wrong size! Interval: (16-64).")]
        public int size{ get; set; }

        [Display(Name = "Points")]
        [Required]
        [Range(0, 100, ErrorMessage = "Bad value! Compartment (0-100).")]
        public int points { get; set; }
    }
}