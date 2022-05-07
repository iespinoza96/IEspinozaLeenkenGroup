using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ML;

namespace BL
{
    public class Empleado
    {
        public static Result GetAll()
        {
            Result result = new Result();

            try
            {
                using (DL.IEspinozaLeenkenGroupEntities1 context = new DL.IEspinozaLeenkenGroupEntities1())
                {
                    var query = context.EmpleadoGetAll().ToList();

                    result.Objects = new List<object>();

                    if (query != null)
                    {
                        foreach (var obj in query)
                        {
                            ML.Empleado empleado = new ML.Empleado();

                            empleado.IdEmpleado = obj.IdEmpleado;
                            empleado.NumeroNomina = obj.NumeroNomina;  
                            empleado.Nombre = obj.Nombre;
                            empleado.ApellidoPaterno = obj.ApellidoPaterno;
                            empleado.ApellidoMaterno = obj.ApellidoMaterno;
                            empleado.Estado = new ML.CatEntidadFederativa();
                            empleado.Estado.IdEstado = obj.IdEstado.Value;

                            result.Objects.Add(empleado);
                      
                        }

                        result.Correct = true;

                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se encontraron registros.";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;

                result.ErrorMessage = ex.Message;
            }

            return result; 
        }// termina getall

        public static Result Add(ML.Empleado empleado)
        {
            Result result = new Result();

            try 
            {
                using (DL.IEspinozaLeenkenGroupEntities1 context = new DL.IEspinozaLeenkenGroupEntities1())
                {
                    var query = context.EmpleadoAdd(empleado.NumeroNomina, empleado.Nombre, empleado.ApellidoPaterno, empleado.ApellidoMaterno, empleado.Estado.IdEstado);

                    if (query >= 1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se inserto el registro";

                    }
                    result.Correct = true;

                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }
            return result;
        }// termina Add

        public static Result Update(ML.Empleado empleado)
        {
            Result result = new Result();
            try
            {
                using (DL.IEspinozaLeenkenGroupEntities1 context = new DL.IEspinozaLeenkenGroupEntities1())
                {
                    var query = context.EmpleadoUpdate(empleado.IdEmpleado,
                        empleado.NumeroNomina,
                        empleado.Nombre, 
                        empleado.ApellidoPaterno,
                        empleado.ApellidoMaterno,
                        empleado.Estado.IdEstado);

                    if (query >=1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se inserto el registro";

                    }
                    result.Correct = true;

                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }
            return result;
        }// termina update

        public static Result Delete(int IdEmpleado)
        {
            Result result = new Result();
            try
            {
                using (DL.IEspinozaLeenkenGroupEntities1 context = new DL.IEspinozaLeenkenGroupEntities1())
                {
                    var query = context.EmpleadoDelete(IdEmpleado);

                    if (query >= 1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se elimino el registro";

                    }
                    result.Correct = true;

                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }
            return result;
        }// termina delete 

        public static Result GetById(int IdEmpleado)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.IEspinozaLeenkenGroupEntities1 context = new DL.IEspinozaLeenkenGroupEntities1())
                {
                    var objEmpleado = context.EmpleadoGeById(IdEmpleado).FirstOrDefault();

                    result.Objects = new List<object>();

                    if (objEmpleado != null)
                    {
                        ML.Empleado empleado = new ML.Empleado();

                        empleado.IdEmpleado = objEmpleado.IdEmpleado;
                        empleado.NumeroNomina = objEmpleado.NumeroNomina;
                        empleado.Nombre = objEmpleado.Nombre;
                        empleado.ApellidoPaterno = objEmpleado.ApellidoPaterno;
                        empleado.ApellidoMaterno = objEmpleado.ApellidoMaterno;
                        empleado.Estado = new ML.CatEntidadFederativa();
                        empleado.Estado.IdEstado = objEmpleado.IdEstado.Value;

                        result.Object = empleado;


                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se encontro el registro";
                    }
                }
            }
            catch (Exception ex)
            {

                result.Correct = false;
                result.ErrorMessage = ex.Message;

            }

            return result;
        }// termina GetById


    }
}
