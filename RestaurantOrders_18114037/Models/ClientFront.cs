using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace RestaurantOrders_18114037.Models
{
    public class ClientFront
    {
        [Required(ErrorMessage = "Email is required")]

        [EmailAddress(ErrorMessage = "The format is wrong!")]
        public string EMail { get; set; }

        [Required(ErrorMessage = "Login is required!")]
        [StringLength(30, ErrorMessage = "Too long!")]
        [MinLength(5, ErrorMessage = "Too short!")]
        public string Login { get; set; }

        [Required(ErrorMessage = "Password is required!")]
        [StringLength(30, ErrorMessage = "Too long!")]
        [MinLength(5, ErrorMessage = "Too short!")]
        [DataType(DataType.Password)]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$",
            ErrorMessage = "Special characters, numbers, lowercase and uppercase letters are required!")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Name is required")]

        [StringLength(15, ErrorMessage = "Too long!")]
        [MinLength(5, ErrorMessage = "Too short!")]
        [RegularExpression(@"^[a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,40}$",
            ErrorMessage = "Wrong signs")]
        public string Name { get; set; }

        [Required(ErrorMessage = "The surname is required!")]
        [StringLength(15, ErrorMessage = "Too long!")]
        [MinLength(5, ErrorMessage = "Too short!")]
        //[RegularExpression(@"^[a]{1,40}$",
           // ErrorMessage = "Wrong signs")]
        public string Surname { get; set; }

        [StringLength(11, ErrorMessage = "Too long!")]
        [Phone(ErrorMessage = "Wrong format!")]
        public string PhoneNumber { get; set; }

        [StringLength(30, ErrorMessage = "It is too long!")]
        public string Address { get; set; }

        public string Role { get; set; }
    }
}