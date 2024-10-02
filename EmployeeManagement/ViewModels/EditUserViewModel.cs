using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeManagement.ViewModels
{
    public class EditUserViewModel
    {
        public EditUserViewModel()
        {
            Roles = new List<string>();
            Claims = new List<string>();
        }
        public string? Id { get; set; }

        [Required]
        [EmailAddress]
        // [Remote(action:"IsEmailInUse", controller:"Account")]
        public string? Email { get; set; }

        [Required(ErrorMessage = "UserName is required")]
        public string? UserName { get; set; }

        public string? City { get; set; }

        public IList<string> Roles { get; set; }

        public List<string> Claims { get; set; }
    }
}