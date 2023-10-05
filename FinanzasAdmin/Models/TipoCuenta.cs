using FinanzasAdmin.Validaciones;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace FinanzasAdmin.Models
{
    public class TipoCuenta //: IValidatableObject
    {
        public int Id { get; set; }


        //[StringLength(maximumLength: 50, MinimumLength =3, ErrorMessage ="La longitud del campo {0} debe estar entre {2} y {1} caracteres")]
        //[Display(Name = "Nombre del tipo cuenta")]
        [Required(ErrorMessage = "El campo {0} es requerido")]
        [PrimetaLetraMayuscula]
        [Remote(action:"VerificarExisteTipoCuenta", controller:"TiposCuentas")]
        public string Nombre { get; set; }

        public int UsuarioId { get; set; }

        public int Orden { get; set; }


        //public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        //{
        //    if (Nombre != null && Nombre.Length > 0)
        //    {
        //        var primeraLetra = Nombre[0].ToString();

        //        if (primeraLetra != primeraLetra.ToUpper())
        //        {
        //            yield return new ValidationResult("La primera letra debe ser mayúscula", new[] { nameof(Nombre) });
        //        }
        //    }
        //}
    }
}
