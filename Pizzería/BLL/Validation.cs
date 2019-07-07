using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace BLL
{
    public class Validation
    {
       

        public Boolean NumericFieldValidation(String ced)
        {
            return Regex.IsMatch(ced, "[A-Za-z]");
        }

        public Boolean TextFiedValidation(String texto)
        {
            return Regex.IsMatch(texto, "[0-9]");
        }

        public Boolean EmailValidation(String correo)
        {
            return Regex.IsMatch(correo, "^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]{1}|[\\w-]{2,}))@(([a-zA-Z]+[\\w-]+\\.){1,2}[a-zA-Z]{2,4})$");
        }

        public Boolean EmptyValidation(String texto)
        {
            texto = texto.Trim();
            return (texto.Length == 0);
        }

        public int LengthValidation(String texto)
        {
            texto = texto.Trim();
            return texto.Length;
        }
    }
}
