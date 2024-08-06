using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EmployeeManagement.Models;
using EmployeeManagement.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR.Protocol;

namespace EmployeeManagement.Controllers
{
    public class HomeController : Controller
    {
        private readonly IEmployeeRepository _employeeRepository;
        private readonly IWebHostEnvironment hostingEnvironment;

        public HomeController(IEmployeeRepository employeeRepository,
                                IWebHostEnvironment hostingEnvironment)
        {
            this.hostingEnvironment = hostingEnvironment;
            _employeeRepository = employeeRepository;
        }
        public ViewResult Index()
        {
            var model = _employeeRepository.GetAllEmployee();
            return View(model);
        }
        public ViewResult Details(int? id)
        {
            HomeDetailsViewModel homeDetailsViewModel = new HomeDetailsViewModel(){
                Employee = _employeeRepository.GetEmployee(id??1),
                PageTitle = "Employee Details"
            };
            return View(homeDetailsViewModel);
        }
        [HttpGet]
        public ViewResult Create(){
            return View();
        }
        [HttpPost]
        public IActionResult Create(EmployeeCreateViewModel model){
            if(ModelState.IsValid)
            {
                string uniqueFileName = null!;
                if(model.Photos != null){
                    string uploadsFolder = Path.Combine(hostingEnvironment.WebRootPath,"images");
                    uniqueFileName = Guid.NewGuid().ToString() + "_" + model.Photos.FileName;
                    string filePath = Path.Combine(uploadsFolder,uniqueFileName);
                    model.Photos.CopyTo(new FileStream(filePath, FileMode.Create));
                }
                Employee newEmployee = new Employee
                {
                    Name = model.Name,
                    Email = model.Email,
                    Department = model.Department,
                    PhotoPath = uniqueFileName,
                };
                _employeeRepository.Add(newEmployee);
                // Employee newEmployee = _employeeRepository.Add(employee);
                return RedirectToAction(actionName : "Details", new {id = newEmployee.Id});
            }
            return View();
        }
    }
}