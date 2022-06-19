using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace RestaurantOrders_18114037.Models
{
    public class OrderFront
    {
        [Required(ErrorMessage = "Name is required!")]
        [StringLength(30, ErrorMessage = "Too long!")]
        [MinLength(5, ErrorMessage = "Too short!")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Surname is requried!")]
        [StringLength(30, ErrorMessage = "Too long!")]
        [MinLength(5, ErrorMessage = "Too short")]
        public string LastName { get; set; }

        [StringLength(11, ErrorMessage = "Too long!")]
        [Phone(ErrorMessage = "Wrong format!")]
        public string PhoneNumber { get; set; }

        [Required(ErrorMessage = "Required field!")]
        [StringLength(30, ErrorMessage = "Too long!")]
        public string Address { get; set; }

        [Required(ErrorMessage = "Field is required!")]
        [StringLength(40, ErrorMessage = "Too long!")]
        public string City { get; set; }

        [Required]
        public int RestaurantId { get; set; }
    }
}
