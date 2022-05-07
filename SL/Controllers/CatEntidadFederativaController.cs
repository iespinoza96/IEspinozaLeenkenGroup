using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SL.Controllers
{
    public class CatEntidadFederativaController : ApiController
    {
        // GET api/catentidadfederativa
        [Route("api/catentidadfederativa/GetAll")]
        [HttpGet]
        public IHttpActionResult GetAll()
        {
            ML.Result result = BL.CatEntidadFederativa.GetAll();

            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }

    }
}
