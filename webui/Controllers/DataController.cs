using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace webui.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class DataController : ControllerBase
    {
        [HttpGet]
        public IEnumerable<Person> Get()
        {
            return new List<Person> {  
                new Person { Id = System.Guid.NewGuid(), FirstName  = "Tom", LastName = "Worthy" }, 
                new Person { Id = System.Guid.NewGuid(), FirstName  = "Lan", LastName = "Kemple" }, 
                new Person { Id = System.Guid.NewGuid(), FirstName  = "Mark", LastName = "Rich" }
            };

        }
    }

    public class Person
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Guid Id { get; internal set; }
    }
}