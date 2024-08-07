﻿using JobPortal.Data;
using JobPortal.Models;
using JobPortal.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Net;
using System.Net.Mail;

namespace JobPortal.Controllers
{
    [Authorize]
    public class JobSeekerController(AppDbContext context, IWebHostEnvironment environment) : Controller
    {
        private readonly AppDbContext _context = context;
        private readonly IWebHostEnvironment _environment = environment;

        public IActionResult Index() => View(_context.Employees.ToList());

        [HttpGet]
        public IActionResult Create(int id)
        {
            ViewBag.JobProfile = new SelectList(_context.JobProfile.ToList(), "JPId", "Name");
            ViewBag.Country = new SelectList(_context.Countries.ToList(), "CId", "Name");

            if (id > 0)
            {
                var Employee = _context.Employees.Where(_ => _.EId == id).FirstOrDefault();
                GetSkills(Employee.JobProfileId);
                GetStates(Employee.CountryId);
                GetCity(Employee.StateId);
                ViewBag.Bt = "Update";
                return View(Employee);
            }
            else
            {
                ViewBag.BT = "Create";
                return View(new Employee());
            }
        }

        public JsonResult GetSkills(int JPId) => Json(ViewBag.Skills = new SelectList(_context.Skills.Where(_ => _.JPId == JPId).ToList(), "SklId", "Name"));

        public JsonResult GetStates(int CId) => Json(ViewBag.State = new SelectList(_context.States.Where(_ => _.CId == CId).ToList(), "SId", "Name"));

        public JsonResult GetCity(int StateId) => Json(ViewBag.City = new SelectList(_context.Cities.Where(_ => _.SId == StateId).ToList(), "CityId", "Name"));

        [HttpPost]
        public IActionResult Create(Employee employee, int id)
        {
            if (id == 0)
            {
                string fileName = FileUpload(employee);

                if (TempData["Message"] != null)
                {
                    return RedirectToAction("Create");
                }

                employee.ImagePath = fileName;
                _context.Employees.Add(employee);
                _context.SaveChanges();
            }
            else if (id != 0)
            {
                var Employee = _context.Employees.Find(id);
                Employee.EId = employee.EId;
                Employee.Name = employee.Name;
                Employee.Gender = employee.Gender;
                Employee.JobProfileId = employee.JobProfileId;
                Employee.SkillsId = employee.SkillsId;
                Employee.Email = employee.Email;
                Employee.Age = employee.Age;
                Employee.Mobno = employee.Mobno;
                Employee.CountryId = employee.CountryId;
                Employee.StateId = employee.StateId;
                Employee.CityId = employee.CityId;
                Employee.Comment = employee.Comment;

                var oldImagePath = Path.Combine(_environment.WebRootPath, "Images", Employee.ImagePath);

                if (employee.Password == null)
                {
                    Employee.Password = Employee.Password;
                }
                if (employee.Password != null)
                {
                    Employee.Password = employee.Password;
                }

                if (employee.ImageFile != null)
                {
                    string fileName = FileUpload(employee);

                    if (TempData["Message"] != null)
                    {
                        return RedirectToAction("Create");
                    }

                    if (System.IO.File.Exists(oldImagePath))
                    {
                        System.IO.File.Delete(oldImagePath);
                    }
                    Employee.ImagePath = fileName;
                }

                _context.Employees.Update(Employee);
                _context.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        private string FileUpload(Employee employee)
        {
            string uploadDir = Path.Combine(_environment.WebRootPath, "Images");
            string fileName = Guid.NewGuid().ToString() + "-" + employee.ImageFile.FileName;
            string filePath = Path.Combine(uploadDir, fileName);
            string fe = Path.GetExtension(employee.ImageFile.FileName);
            var fileLength = employee.ImageFile.Length;

            if (fe.ToString().ToLower().Equals(".jpg", StringComparison.CurrentCultureIgnoreCase) || fe.ToString().ToLower().Equals(".jpeg", StringComparison.CurrentCultureIgnoreCase) || fe.ToString().ToLower().Equals(".png", StringComparison.CurrentCultureIgnoreCase))
            {
                if (fileLength <= 2105344)
                {
                    var fileStream = new FileStream(filePath, FileMode.Create);
                    employee.ImageFile.CopyTo(fileStream);
                }
                else
                {
                    TempData["Message"] = "Please upload only less than 2mb size files !!";
                }
            }
            else
            {
                TempData["Message"] = "Please upload only jpg,jpeg and png files !!";
            }

            return fileName;
        }

        public IActionResult Delete(int id)
        {
            _context.Employees.Remove(_context.Employees.Find(id));
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult MailSent() => View();

        [HttpPost]
        public IActionResult MailSent(Message messageDetails)
        {
            MailMessage message = new();
            SmtpClient smtpClientsmtp = new();
            message.From = new MailAddress("gulshankumar.mailid01@gmail.com");
            message.To.Add(messageDetails.Email);
            message.Subject = "Test Mail";

            string MailBody = "<!DOCTYPE html>" +
  "<body style=\"display:flex; justify-content:center;\">" +
  "<div style=\"min-height: 10rem; width: 40rem; background-color: aqua; padding: 1rem; border-radius: 10px;\">" +
       " <table style=\"width:100%; color:white; border: 1px solid black; text-align: center;\">" +
           " <thead style=\"color:black;\">" +
                "<tr>" +
                   " <th style=\"border: 1px solid black;\"> Name </th>" +
                   " <th style=\"border: 1px solid black;\"> Email </th>" +
                   " <th style=\"border: 1px solid black;\"> Message </th>" +
               " </tr>" +
            "</thead>" +
            "<tbody>" +
                "<tr>" +
                   $" <td style=\"border: 1px solid black;\"> {messageDetails.Name} </td>" +
                    $"<td style=\"border: 1px solid black;\"> {messageDetails.Email} </td>" +
                   $" <td style=\"border: 1px solid black;\"> {messageDetails.MessageData} </td>" +
                "</tr>" +
           " </tbody>" +
        "</table>" +
"</body>" +

"</html>";
            message.Body = MailBody;
            message.IsBodyHtml = true;
            smtpClientsmtp.Port = 587;
            smtpClientsmtp.Host = "smtp.gmail.com";
            smtpClientsmtp.EnableSsl = true;
            smtpClientsmtp.UseDefaultCredentials = false;
            smtpClientsmtp.Credentials = new NetworkCredential("gulshankumar.mailid01@gmail.com", "aeljomqrgsaqgtkv");
            smtpClientsmtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClientsmtp.Send(message);
            ModelState.Clear();
            return View();
        }

        public IActionResult ViewJobs()
        {
            List<JobsViewJobSeekerViewModel> vm = [];

            foreach (var i in (from jp in _context.JobPosts
                              join c in _context.Companies
                              on jp.JobProfileId equals c.JobProfileId
                              join jpr in _context.JobProfile
                              on jp.JobProfileId equals jpr.JPId
                              select new
                              {
                                  jp.MinExp,
                                  jp.MaxExp,
                                  jp.MinSal,
                                  jp.MaxSal,
                                  jp.NoOfVac,
                                  jp.NoticePeriod,
                                  jp.Comment,
                                  jp.InsertedDate,
                                  c.Id,
                                  CName = c.Name,
                                  JPName = jpr.Name
                              }).ToList())
            {
                vm.Add(new JobsViewJobSeekerViewModel
                {
                    MinExp = (int)i.MinExp,
                    MaxExp = (int)i.MaxExp,
                    MinSal = (int)i.MinSal,
                    MaxSal = (int)i.MaxSal,
                    NoOfVac = (int)i.NoOfVac,
                    NoticePeriod = (int)i.NoticePeriod,
                    Comment = i.Comment,
                    InsertedDate = i.InsertedDate,
                    CompanyId = i.Id,
                    CompanyName = i.CName,
                    JPName = i.JPName
                });
            }

            return View(vm);
        }
    }
}
