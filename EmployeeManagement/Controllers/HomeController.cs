using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EmployeeManagement.Models;
using EmployeeManagement.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR.Protocol;

namespace EmployeeManagement.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly IEmployeeRepository _employeeRepository;
        private readonly IWebHostEnvironment hostingEnvironment;
        private readonly ILogger logger;

        public HomeController(IEmployeeRepository employeeRepository,
                                IWebHostEnvironment hostingEnvironment,
                                ILogger<HomeController> logger)
        {
            this.logger = logger;
            this.hostingEnvironment = hostingEnvironment;
            _employeeRepository = employeeRepository;
        }
        [AllowAnonymous]
        public ViewResult Index()
        {
            var model = _employeeRepository.GetAllEmployee();
            return View(model);
        }
        
        [AllowAnonymous]
        public ViewResult Details(int? id)
        {
            logger.LogCritical("Ciritcal Log");
            logger.LogDebug("Debug Log");
            logger.LogError("Error Log");
            // throw new Exception("Error in Details View");
            HomeDetailsViewModel homeDetailsViewModel = new HomeDetailsViewModel(){
                Employee = _employeeRepository.GetEmployee(id??1),
                PageTitle = "Employee Details"
            };
            return View(homeDetailsViewModel);
        }
        [HttpGet]
        public ViewResult Edit(int id){
            Employee employee = _employeeRepository.GetEmployee(id);
            EmployeeEditViewModel employeeEditViewModel = new EmployeeEditViewModel
            {
                Id = employee.Id,
                Name = employee.Name,
                Email = employee.Email,
                Department = employee.Department,
                ExistingPhotoPath = employee.PhotoPath!,

            };
            return View(employeeEditViewModel);
        }
        
        [HttpGet]
        public ViewResult Create(){
            return View();
        }

        [HttpPost]
        public IActionResult Edit(EmployeeEditViewModel model){

            if(ModelState.IsValid)
            {
                Employee employee = _employeeRepository.GetEmployee(model.Id);
                employee.Name = model.Name;
                employee.Email = model.Email;
                employee.Department = model.Department;
                if(model.Photos != null)
                {
                    if(model.ExistingPhotoPath != null)
                    {
                        string filePath = Path.Combine(hostingEnvironment.WebRootPath, "images", model.ExistingPhotoPath);
                        System.IO.File.Delete(filePath);
                    }
                    employee.PhotoPath = ProcessUploadFile(model);
                }

                _employeeRepository.Update(employee);
                // Employee newEmployee = _employeeRepository.Add(employee);
                return RedirectToAction(actionName: "index");
            }
            return View();

            
        }

        private string ProcessUploadFile(EmployeeCreateViewModel model)
        {
            string uniqueFileName = null!;
            if (model.Photos != null)
            {
                string uploadsFolder = Path.Combine(hostingEnvironment.WebRootPath, "images");
                uniqueFileName = Guid.NewGuid().ToString() + "_" + model.Photos.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using(var FileStream = new FileStream(filePath, FileMode.Create))
                {
                    model.Photos.CopyTo(FileStream);
                }
            }

            return uniqueFileName;
        }

        [HttpPost]
        public IActionResult Create(EmployeeCreateViewModel model){
            if(ModelState.IsValid)
            {
                string uniqueFileName = ProcessUploadFile(model);
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