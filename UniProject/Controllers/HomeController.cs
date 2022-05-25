using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using UniProject.Models;

namespace UniProject.Controllers
{
    public class HomeController : Controller
    {
       

        public IActionResult Index()
        {
            return View();
        }

        

        
    }
}