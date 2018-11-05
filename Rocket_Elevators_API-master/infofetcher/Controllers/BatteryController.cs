using System.Collections.Generic;
using System.Linq;
using infofetcher.Models;
using Microsoft.AspNetCore.Mvc;

namespace infofetcher.Controllers
{
    [Route ("api/batteries")]
    [ApiController]
    public class BatteryController : ControllerBase 
    {
        private readonly mathieu_h_appContext _context;

        public BatteryController (mathieu_h_appContext context) {
            _context = context;
            
        }

        [HttpGet]
        public ActionResult<List<Batteries>> GetAll () {
            return _context.Batteries.ToList ();
        }

        [HttpGet ("{id}", Name = "GetBatteries")]
        public ActionResult<Batteries> GetById (long id) {
            var item = _context.Batteries.Find (id);
            if (item == null) {
                return NotFound ();
            }
            return item;
        }
    }
}