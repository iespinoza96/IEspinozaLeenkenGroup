using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ML;

namespace BL
{
    public class CatEntidadFederativa
    {
        public static Result GetAll()
        {
            Result result = new Result();

            try
            {
                using (DL.IEspinozaLeenkenGroupEntities1 context = new DL.IEspinozaLeenkenGroupEntities1())
                {
                    var query = context.EstadosGetAll().ToList();

                    result.Objects = new List<object>();

                    if (query != null)
                    {
                        foreach (var obj in query)
                        {
                            ML.CatEntidadFederativa estado = new ML.CatEntidadFederativa();

                            estado.IdEstado = obj.IdEstado;
                            estado.Estado = obj.Estado;

                            result.Objects.Add(estado);

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
    }
}
