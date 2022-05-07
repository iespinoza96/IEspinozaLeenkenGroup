using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SL.Controllers
{
    public class EmpleadoController : ApiController
    {
        // GET api/empleado
        [Route("api/empleado/GetAll")]
        [HttpGet]
        public IHttpActionResult GetAll()
        {
            ML.Result result = BL.Empleado.GetAll();

            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }

        [Route("api/empleado/{IdEmpleado}")] // enviar parametros ->IdEmpleado
        [HttpGet]

        // Get api/empleado
        public IHttpActionResult GetById(int IdEmpleado)
        {
            ML.Result result = BL.Empleado.GetById(IdEmpleado);
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }

        [Route("api/empleado/add")]//enviar parametros desde el body 
        [HttpPost]

        // POST api/departamento
        public IHttpActionResult Add([FromBody]ML.Empleado empleado)
        {
            ML.Result result = BL.Empleado.Add(empleado);

            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }

        //PUT 
        [Route("api/empleado/update")]//enviar parametros desde el body 
        [HttpPut]
        public IHttpActionResult Update([FromBody]ML.Empleado empleado)
        {
            ML.Result result = BL.Empleado.Update(empleado);

            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return Content(HttpStatusCode.NotFound, result);
            }
        }

        [Route("api/empleado/{IdEmpleado}")]//enviar parametros desde el body 
        [HttpDelete]
        public IHttpActionResult Delete(int IdEmpleado)
        {
            ML.Result result = BL.Empleado.Delete(IdEmpleado);

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
