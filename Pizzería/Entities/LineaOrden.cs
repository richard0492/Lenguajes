//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class LineaOrden
    {
        public int LineaOrdenID { get; set; }
        public int OrdenID { get; set; }
        public int PlatoID { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }
    
        public virtual Orden Orden { get; set; }
        public virtual Plato Plato { get; set; }
    }
}
