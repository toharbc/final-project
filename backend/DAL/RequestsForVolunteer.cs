//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class RequestsForVolunteer
    {
        public long RequestForVolunteerId { get; set; }
        public long HelpRequestId { get; set; }
        public long VolunteerId { get; set; }
        public string Status { get; set; }
        public bool Done { get; set; }
        public long Review { get; set; }
        public string Comment { get; set; }
    
        public virtual HelpRequest HelpRequest { get; set; }
        public virtual User User { get; set; }
    }
}
