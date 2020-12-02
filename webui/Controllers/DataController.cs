using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace webui.Controllers
{
    
    [ApiController]
    public class DataController : ControllerBase
    {
        [HttpGet]
        [Route("[controller]")]
        public IEnumerable<Person> Get()
        {
            return new List<Person> {  
                new Person { Id = System.Guid.NewGuid(), FirstName  = "Tom", LastName = "Worthy" }, 
                new Person { Id = System.Guid.NewGuid(), FirstName  = "Lan", LastName = "Kemple" }, 
                new Person { Id = System.Guid.NewGuid(), FirstName  = "Mark", LastName = "Rich" }
            };

        }

        [HttpGet]
        [Route("[controller]/[action]")]
        public OSInfo GetOSInfo()
        {
            return new OSInfo{ Description = System.Runtime.InteropServices.RuntimeInformation.OSDescription };
        }
    }

    public class Person
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Guid Id { get; internal set; }
    }

    public class OSInfo
    {
        public string Description { get; set; }
    }
}