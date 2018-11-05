using System.Collections.Generic;
using System.Linq;
using infofetcher.Models;
using Microsoft.AspNetCore.Mvc;

namespace infofetcher.Controllers
{
    [Route ("api/buildings")]
    [ApiController]
    public class BuildingController : ControllerBase 
    {
        private readonly mathieu_h_appContext _context;

        public BuildingController (mathieu_h_appContext context) {
            _context = context;
            
        }

        [HttpGet]
        public ActionResult<List<Buildings>> GetAll () {
            return _context.Buildings.ToList ();
        }

        [HttpGet ("{id}", Name = "GetBuildings")]
        public ActionResult<Buildings> GetById (long id) {
            var item = _context.Buildings.Find (id);
            if (item == null) {
                return NotFound ();
            }
            return item;
        }
    }
}